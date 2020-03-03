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
    * Add 'Submit JUnit test results to qTest'
    * qTest URL: [https://sademo.qtestnet.com/](https://sademo.qtestnet.com/)
    * API Key: same API Token you got in step 1 above (I'm not telling you my super-secret token)
    * Selected Project
    * Submit test results to an existing container: select the container you wish
    * Environment: optional
    * Select - Utilize test results from the CI tool
    * Select - Each JUnit Test Suite (class) = a qTest Test Case
