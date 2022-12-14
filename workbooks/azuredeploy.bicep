@description('Name of Workbook')
param workbookDisplayName string = 'FTA - Reliability Workbook'

@description('GUID of Workbook')
param workbookId string = newGuid()

// If change json file name, please change the name of the filename below
var workbookContent = loadJsonContent('Reliability Workbook.json')

resource workbookId_resource 'microsoft.insights/workbooks@2021-03-08' = {
  name: workbookId
  location: resourceGroup().location
  kind: 'shared'
  properties: {
    displayName: workbookDisplayName
    serializedData: string(workbookContent)
    version: '1.6'
    sourceId: 'azure monitor'
    category: 'workbook'
  }
  dependsOn: []
}

output workbookId string = workbookId_resource.id
