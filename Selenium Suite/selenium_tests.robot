*** Settings ***
Library  DateTime
Library  SeleniumLibrary
Library    Telnet
Library    OperatingSystem

*** Test Cases ***
TC1 Get DateTime
    ${currentdate}    Get Current Date
    Log To Console    ${currentdate}
    
TC2 Print Name
    ${name1}    Set Variable    manju
    Log To Console    ${name1}
    Set Local Variable  ${name2}    color
    Log To Console    ${name2}

 TC3 OpenEMR Login
    Append To Environment Variable   Path    C:\\Program Files (x86)\\Common Files\\chromedriver_win32
    Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default    browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    id=authUser   admin
    Input Text    id=clearPass    pass
    Select From List By Label    name=languageChoice     English (Indian)
    Click Element    //button[@type='submit']
    ${actualtitle}   Get Title
    Log    ${actualtitle}  
    Log To Console    ${actualtitle}
    Title Should Be    OpenEMR
    Mouse Over    xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='Patients']

    Select Frame    xpath=//iframe[@name='fin']
    Click Element    id=create_patient_btn1
    Unselect Frame
    
    Select Frame    //iframe[contains(@src,"new.php")]
    Input Text   id=form_fname     manjula
    Input Text    id=form_DOB    2021-07-07
    Input Text     id=form_lname    seetharamu
    Select From List By Label    id=form_sex   Female
    Click Element    id=create
    Unselect Frame
    
    Select Frame    //iframe[@id='modalframe']
    Click Element    //input[contains(@value, 'Confirm Create New Patient')]
    ${alerttext}     Handle Alert
    Log To Console     ${alerttext}
    Click Element   xpath=//div[@class='closeDlgIframe']

    Unselect Frame
    Select Frame    //iframe[@name='pat']
    Element Text Should Be    xpath=//h2[contains(text(), 'Record')]    Medical Record Dashboard - Manjula Seetharamu

TC4 MultipleWindow
     Append To Environment Variable   Path    C:\\Program Files (x86)\\Common Files\\chromedriver_win32
     Open Browser    url=https://db4free.org/    browser=gc
     Click Element    //a[@href="/phpMyAdmin"]