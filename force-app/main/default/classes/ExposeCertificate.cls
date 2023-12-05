@RestResource(urlMapping='/CertificationExpose/*')
global class ExposeCertificate {
    @httpGet
    global static List<Certification__c> getCertficationDetails(){
        List<Certification__c> c = [select Name,Comments__c from Certification__c];
        return c;
    }
}