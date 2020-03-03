# ToscaDemo


Tricentis demo app configuration file - _C:\DevOpsPackage\TricentisWebServer\Xml_Sprint1\Cars.xml_

### Tosca / Jenkins / qTest

***Option 1: NO qTest Integration***
1. Jenkins: job config > build >
   Add 'Execute Windows batch Command'  
   copy Cars.xml C:\DevOpsPackage\TricentisWebServer\Xml_Sprint1\Cars.xml  
   _"C:\Program Files (x86)\TRICENTIS\Tosca Testsuite\ToscaCommander\ToscaCI\Client\ToscaCIClient.exe" -m distributed -r Results.xml -t junit -x True_

2. Jenkins: job config > Post-build Actions >
   Add 'Publish JUnit test results report' > Test report XMLs: Results.xml

***Option 2: WITH qTest Integration***
1. qTest: Downloads > CI Tools Integration > Copy API Token

2. Jenkins: job config > Post-build Actions >
  1. Add 'Submit JUnit test results to qTest'
  2. Check the 'Execute Tricentis Tosca Tests'
  3. Path to Tricentis Tosca CI Executable: _C:\Program Files (x86)\TRICENTIS\Tosca Testsuite\ToscaCommander\ToscaCI\Client\ToscaCIClient.exe_
  4. Tricentis Tosca Command Line Arguments:  _-m distributed -r Results.xml -t junit -x True_
  5. Path to Results: __Results.xml__
  6. qTest URL: [https://sademo.qtestnet.com/](https://sademo.qtestnet.com/)
  7. API Key: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx (same API Token from step 1)
