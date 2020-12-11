*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
...                 https://home.speckhart.com/error.html 404 page not found
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:8081
${BROWSER}        Firefox
${DELAY}          0.1
${MAIN URL}       http://${SERVER}/

*** Keywords ***
Open Browser To Main Page
    Open Browser            ${MAIN URL}    ${BROWSER} 
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    Capture Page Screenshot
    Main Page Should Be Open

Main Page Should Be Open
    Title Should Be    Notedo

Create Collection
    [Arguments]     ${COLLECTION TITLE}
    Go To           ${MAIN URL}
    Main Page Should Be Open
    # Pending Bug: Open Collection        
    # Root   (Not root any more, should be "Collections")
    # until bug fixed, click on Root first.
    # Element Should Be Visible    xpath://*[@id="main-app-container-left"]/div[2]/span
    
    Capture Page Screenshot
    Wait Until Page Contains Element   xpath://*[@id="main-app-container-left"]/div/span[contains(text(), "Collections")]
    # Click Element   //*[@id="main-app-container-left"]/div/span[contains(text(), "Collections")]/parent::div/button
    Click Button    //*[@id="main-app-container-left"]/div/span[contains(text(), "Collections")]/parent::div/button
    Press Keys      None                            BACKSPACE
    Press Keys      None                            BACKSPACE
    Input Text      xpath://*[@id="collection-title"]     ${COLLECTION TITLE}     clear=True
    # Press Keys    //*[@id="collection-title"]     RETURN
    # need to sleep for timer to save change
    Wait Until Element Contains         xpath://*[@id="main-app-container-left"]//*/div[contains(text(), " ${COLLECTION TITLE} ")]     ${COLLECTION TITLE}     timeout=15
    Capture Page Screenshot

Load Collection
    [Arguments]     ${COLLECTION TITLE}
    Click Element   //*[@id="main-app-container-left"]//*/div[contains(text(), " ${COLLECTION TITLE} ")]

    # below is notes toward validating the collection is actually loaded.
    # shadow root is hidden from js (user-agent) ?
    #Element Text Should Be      //*[@id="collection-title"]//div[2]     ${COLLECTION TITLE}
    #Element Text Should Be      dom:document.querySelector("#collection-title")     ${COLLECTION TITLE}
    #Element Text Should Be      dom:document.querySelector("#collection-title").shadowRoot.querySelector("div[2]")     ${COLLECTION TITLE}
    #/html/body/div/div/main/div/div/div[3]/div[2]/div/div/div[1]/div[1]/div/div/div/input//div[2]
    # //*[@id="collection-title"]//div[2]
    # maybe could check that Collection name on left is now highlighted ?
    #xpath://*[@id="main-app-container-left"]/div[3]/div[5]/div
    #Page Should Contain Image    dom:document.querySelector("body > settings-ui").shadowRoot.querySelector("#main").shadowRoot.querySelector("settings-basic-page").shadowRoot.querySelector("#basicPage > settings-section:nth-child(3) > settings-people-page").shadowRoot.querySelector("#pages > div > settings-sync-account-control").shadowRoot.querySelector("#avatar-container > img")

# Delete collection from whatever view we are currently at.
Delete Collection
    [Arguments]     ${COLLECTION TITLE}

    Assign ID to Element	            xpath://*[@id="main-app-container-left"]//*/div[contains(text(), " ${COLLECTION TITLE} ")]  	left nav collection div
    Assign ID to Element                xpath://*[@id="main-app-container-left"]//*/div[contains(text(), " ${COLLECTION TITLE} ")]/parent::div/parent::div/div[3]/button        trashcan
    Page Should Contain Element         left nav collection div

    # be on the collection first?  (do we need to delete all notes first?)
    Click Element                       left nav collection div
    # Mouse Out                           xpath://*[@id="main-app-container-left"]
    Mouse Over                          xpath://*[@id="collection-title"]
    Element Should Not Be Visible       trashcan
    Mouse Over                          left nav collection div

    #now trashcan should be showing.  Send it to it's maker.
    Element Should Be Visible           trashcan
    Click Element                       trashcan

    # hope span with "Yes" never moves. BE STILL!
    Click Element                       //*[@id="inspire"]/div[3]/div/div/div[3]/button[2]/span

    # Validation
    # Root page should now be shown. However we can validate that.
    # http://localhost:8081/#/collections/item/col-0 (root url)

    # bug: collections can have same name.
    # Page Should Not Contain Element     left nav collection div





Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
