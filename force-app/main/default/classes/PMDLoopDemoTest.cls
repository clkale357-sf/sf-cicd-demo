@isTest
private class PMDLoopDemoTest {


@IsTest
    static void testProcessRelatedContacts() {
        // Create test data: Accounts and related Contacts
        List<Account> testAccounts = new List<Account>();
        List<Contact> testContacts = new List<Contact>();
        
        for (Integer i = 0; i < 10; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            testAccounts.add(acc);
        }
        insert testAccounts;
        
        for (Account acc : testAccounts) {
            for (Integer i = 0; i < 5; i++) {
                Contact con = new Contact(FirstName = 'Test', LastName = 'Contact ' + i, AccountId = acc.Id);
                testContacts.add(con);
            }
        }
        insert testContacts;
        
        // Call the method to be tested
        Test.startTest();
        PMDLoopDemo.processRelatedContacts(testAccounts);
        Test.stopTest();
        
        // Assertions (if needed)
        // For example, you could check if the expected number of Contacts were processed.
    }
}