# tosca-execute-print-email

### Precondition:
This will only work on a host with Tosca Commander (tested with v13.x).

### Step 1: Update the 2 files:
Replace the place-holder values with real ones.

To get the right Tosca node, select the ExecutionList or TestCase you want to run and grab the NodePath from the Properties (you may need to click the ... button to be able to copy the string).


### Step 2: Create a test case that sends an email

Import the **Send Mail.tsu** subset to your workspace and update the fields accordingly.
Note, in my example I'm using my gmail account because my work Outlook 365 has security features I cannot disable/change. These settings are not allowing me to use the SMTP server.
