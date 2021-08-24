*** Settings ***
Documentation    WebUI smoke test using SeleniumLibrary
Library    SeleniumLibrary


*** Variables ***
${browser}    Headless Firefox


*** Test Cases ***
Smoke Browser Test
    Open Browser To Search Page
    Agree To Google Terms
    Input Search Term    etteplan
    Submit Form
    Wait Until Search Completed
    Log The Amount Of Results
    [Teardown]    Close Browser


*** Keywords ***
Open Browser To Search Page
    Open Browser    https://www.google.com    ${browser}
    Maximize Browser Window
    Title Should Be    Google

Agree To Google Terms
    Element Should Be Visible    //*[contains(text(),'Hyväksyn')]
    Click Element       //*[contains(text(),'Hyväksyn')]

Input Search Term
    [Arguments]    ${search_term}
    Input Text    q    ${search_term}

Wait Until Search Completed
    Wait Until Page Contains Element    id=result-stats

Log The Amount Of Results
    ${results}    Get Text    id=result-stats
    Log    ${results}    console=True
