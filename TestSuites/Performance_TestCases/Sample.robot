*** Settings ***
Library           JMeterLib.py
Library           Collections

*** Variables ***
${jMeterStartup}  C:/Jmeter/bin/jmeter.bat
${jmxFileLocation}  D:/00_Workspace/07_Jmeter/00_SampleTestCases/firstTestCase.jmx
${outputResults}  D:/00_Workspace/04_RobotFrameWork/01_Python/RF_E2E_Testing/outputResults
#D:/00_Workspace/04_RobotFrameWork/01_Python/RF_E2E_Testing/outputResults

*** Test Cases ***
tc1_justRunJMeter
    Run jmeter   ${jMeterStartup}  ${jmxFileLocation}  ${outputResults}/tc1_justRunJMeter.jtl  


tc2_analyseAndConvertExistingJtlLog
    ${result}    analyse Jtl convert    ${outputResults}/tc1_justRunJMeter.jtl
    log    ${result}
    : FOR    ${ELEMENT}    IN    @{result}
    \    log dictionary    ${ELEMENT}
    \    ${check}    Get From Dictionary    ${ELEMENT}    samplesSuccessRateInclAssert
    \    log to console    ${check}
    Should Be Equal As Integers    ${check}    100  
    
    
tc3_runJMeterAndAnalyseAndConvertLog
    ${result}    run jmeter analyse jtl convert    ${jMeterStartup}  ${jmxFileLocation}  ${outputResults}/tc3_runJMeterAndAnalyseAndConvertLog.jtl  
    log    ${result}
    :FOR    ${ELEMENT}    IN    @{result}
    \    log dictionary    ${ELEMENT}