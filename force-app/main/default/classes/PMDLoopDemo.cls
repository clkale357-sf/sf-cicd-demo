/**
 * @description This class is a sample to demonstrate a common PMD violation.
 * The processRelatedContacts method contains a SOQL query inside a for loop,
 * which is an inefficient pattern that can easily hit governor limits.
 */
public with sharing class PMDLoopDemo {

    public static void processRelatedContacts(List<Account> triggerAccounts) {

        // This loop iterates over each Account record.

        //dummy update 8
        for (Account acc : triggerAccounts) {

            // BAD PRACTICE: SOQL query inside a for loop.
            // PMD will flag this line with the 'AvoidSoqlInLoops' rule.
            // If triggerAccounts contains 100 records, this will execute 100 separate SOQL queries.
            /*List<Contact> relatedContacts = [SELECT Id, Name FROM Contact WHERE AccountId = :acc.Id USER_MODE];
            //test

            for (Contact con : relatedContacts) {
                // Some business logic would go here...
                System.debug('Processing Contact: ' + con.Name);
            }*/
        }
    }
}