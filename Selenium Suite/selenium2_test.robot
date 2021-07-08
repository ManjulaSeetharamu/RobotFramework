*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library    XML
Library    String

*** Test Cases ***
 TC1
    Append To Environment Variable   Path    C:\\Program Files (x86)\\Common Files\\chromedriver_win32
    Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default    browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s

 *** Test Cases ***
 TC2
    Append To Environment Variable   Path    C:\\Program Files (x86)\\Common Files\\chromedriver_win32
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    
    ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    Log To Console    ${rowcount}

    FOR    ${i}    IN RANGE    1    ${rowcount}+1
        ${name}       Get Text    xpath=//table[@id='example']/tbody/tr[i]/td[2]
        Log To Console  ${name}
        
        ${age}       Get Text    xpath=//table[@id='example']/tbody/tr[i]/td[5]
        Log To Console  ${age}
        
        IF    '${name}' == 'Brenden Wagner'
            Click Element    xpath=//table[@id='example']/tbody/tr[i]/td[1]
            Exit For Loop

         # Run Keyword If    '${name}' == 'Brenden Wagner'
         # ...   Click Element    xpath=//table[@id='example']/tbody/tr[i]/td[1]

         # Run Keyword If    '${name}' == 'Brenden Wagner'
         # Set Local Variable    ${current}      ${name}
        END
   END
   # Log To Console    ${current}
   
 TC3
 
     Append To Environment Variable   Path    C:\\Program Files (x86)\\Common Files\\chromedriver_win32
     Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=gc
     Maximize Browser Window
     Set Selenium Implicit Wait    30s
    
    FOR    ${page}    IN RANGE    1    7
   
     ${rowcount}    Get Element Count    xpath=//table[@id='example']/tbody/tr
     Log To Console    ${rowcount}

     FOR    ${i}    IN RANGE    1    ${rowcount}+1
        ${name}       Get Text    xpath=//table[@id='example']/tbody/tr[i]/td[2]
        Log To Console  ${name}
     END
     Click Element    link=Next
  END

TC4
     Append To Environment Variable   Path    C:\\Program Files (x86)\\Common Files\\chromedriver_win32
     Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=gc
     Maximize Browser Window
     Set Selenium Implicit Wait    30s
     ${text}     Get Text    //div[contains[text(),'Showing']
     Log To Console    ${text}
     ${text}     Fetch From Right    ${text}     of
     Log To Console    ${text}
     ${text}     Remove String   ${text}     entries
     Log To Console    ${text}
     ${text}     Strip String   ${text}     entries
     Log To Console    ${text}
     ${text}     Evaluate   ${text}/10
     Log To Console    ${text}

TC5
     Set Local Variable    ${text}   Showing 1 to 10 of 57 entries
     ${text}     Fetch From Right    ${text}     of
     Log To Console    ${text}
     ${text}     Remove String   ${text}     entries
     Log To Console    ${text}
     ${text}     Strip String   ${text}
     Log To Console    ${text}
     ${text}     Evaluate   math.ceil(${text}/10)
     Log To Console    ${text}