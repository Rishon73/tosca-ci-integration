# ToscaDemo


Tricentis demo app configuration file - C:\DevOpsPackage\TricentisWebServer\Xml_Sprint1\Cars.xml

### Tosca / Jenkins / qTest

***Option 1: NO qTest Integration***
1. Jenkins: job config > build >
   Add 'Execute Windows batch Command'  
   copy Cars.xml C:\DevOpsPackage\TricentisWebServer\Xml_Sprint1\Cars.xml  
   "C:\Program Files (x86)\TRICENTIS\Tosca Testsuite\ToscaCommander\ToscaCI\Client\ToscaCIClient.exe" -m distributed -r Results.xml -t junit -x True  

2. Jenkins: job config > Post-build Actions >
   Add 'Publish JUnit test results report' > Test report XMLs: Results.xml

***Option 2: WITH qTest Integration***
1. qTest: Downloads > CI Tools Integration > Copy API Token

2. Jenkins: job config > Post-build Actions >
  a. Add 'Submit JUnit test results to qTest'
  b. Check the 'Execute Tricentis Tosca Tests'
  c. Path to Tricentis Tosca CI Executable: C:\Program Files (x86)\TRICENTIS\Tosca Testsuite\ToscaCommander\ToscaCI\Client\ToscaCIClient.exe
  d. Tricentis Tosca Command Line Arguments:  -m distributed -r Results.xml -t junit -x True
  e. Path to Results: Results.xml
  f. qTest URL: https://sademo.qtestnet.com/
  g. API Key: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx (same API Token from step 1)
