*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Test Cases ***
TC1 MultipleTabs
     Append To Environment Variable   Path    C:\\Program Files (x86)\\Common Files\\chromedriver_win32
    # Append To Environment Variable   Path   ${EXECDIR}${/}driver
     Open Browser  browser=gc
     Go To    url=https://db4free.org/
     Maximize Browser Window
     Set Selenium Implicit Wait    30s
     Click Element    //a[@href="/phpMyAdmin"]
     Switch Window   NEW
     Select From List By Label    id=sel-lang  English (United Kingdom)

     Input Text    id=input_username    manjula
     Input Text    id=input_password    pass123
     Click Element    id=input_go
     ${actualtext}   Get Text    (//div[@role='alert'])[2]
     Log To Console    ${actualtext}

     Switch Window   url=https://db4free.org/
     ${actualtext}   Get Text    xpath=//div[@class='col-sm-9 hdrtxt']
     Log To Console    ${actualtext}