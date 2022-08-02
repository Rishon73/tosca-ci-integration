Enqueue, poll for status and get results:
------------------------------------------------
  .\tests\aos-api\tosca_execution_client.ps1 -toscaServerUrl "http://localhost" -eventsConfigFilePath "tests\testEvents.json" -projectName "NEW_DEX_WS" -creator "Shahar Shiff" -debug


Enqueue by event name/id, poll for status and get results:
  -----------------------------------------------------------
  .\tests\aos-api\tosca_execution_client.ps1 -toscaServerUrl "http://localhost" -events '[{"eventId": "GetSetPerson", "eventId": "ado-pipeline"}]' -projectName "NEW_DEX_WS" -creator "Shahar Shiff" -debug  -pollingInterval 30


Enqueue only:
------------------------
.\tests\aos-api\tosca_execution_client.ps1 -toscaServerUrl "http://localhost" -eventsConfigFilePath "tests\testEvents.json" -projectName "NEW_DEX_WS" -creator "Shahar Shiff" -debug -enqueueOnly true


"\tests\aos-api\tosca_execution_client.ps1" -toscaServerUrl "http://localhost" -eventsConfigFilePath "tests\testEvents.json" -projectName "NEW_DEX_WS" -creator "Shahar Shiff @jenkins" -debug "true"

& "".\tosca_execution_client.ps1" -toscaServerUrl "http://localhost" -events '[{"eventId": "GetSetPerson"}]' -projectName "NEW_DEX_WS" -creator "ss from host" -debug "true"


{
  "ProjectName":"SQL Server Shared Workspace",
  "ExecutionEnvironment":"true",
  "Events":[
    {
      "eventId": "Renault TestEvent"
    }
  ],
  "ImportResult":true,
  "Creator":"Matt"
}
