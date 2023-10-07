public with sharing class MiniChartsMetadataHelper {
    public MiniChartsMetadataHelper() {
        MetadataServiceMin.MetadataPort service = new MetadataServiceMin.MetadataPort();
        service.SessionHeader = new MetadataServiceMin.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        MetadataServiceMin.CustomField customField = (MetadataServiceMin.CustomField) service.readMetadata('CustomField', new String[] { 'Account.mc_Dial_Chart__c' }).getRecords()[0];
        
        customField.label='mc Dial Chart';
        
        List<MetadataServiceMin.SaveResult> results = service.updateMetadata(new MetadataServiceMin.Metadata[] { customField });
        
        System.debug(results);
    }
}