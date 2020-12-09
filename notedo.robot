*** Settings ***
Documentation     A test suite to test collection functions
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
...
Resource            resource.robot
Suite Setup         Open Browser To Main Page
Suite Teardown      Close Browser

*** Variables ***
${TEST COLLECTION}      Test Collection

*** Test Cases ***
Create Collection
    Create Collection   ${TEST COLLECTION}
    Load Collection     ${TEST COLLECTION}
    Delete Collection   ${TEST COLLECTION}



# Todo Test Cases:
# Create & Delete Note
## Special Note commands like :wq
# Paste Image
# Create Todos
# Create Links
# Search for Text, Links, etc.
## awesome bar, ctrl-p ?
# Pin Notes
# Recently Used Notes 
# Settings?