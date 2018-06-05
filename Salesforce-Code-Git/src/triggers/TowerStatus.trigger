trigger TowerStatus on Tower__c (before insert, after update) {
    
    tower__c newTowerObj= trigger.new[0];
    string id1= newTowerObj.Developer_Project__c;
    if(newTowerObj.Status__c == 'In Progress')
    {
        Developer_Project__c obj1= [select id, name from Developer_Project__c where id=:id1];
            System.debug('tower__c'+obj1);
        Developer_Project__c obj= new Developer_Project__c(id=id1);
        obj.Actual_Work_Done__c=100;
        update obj;
    }

}