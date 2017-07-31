Feature: MyAmaysim Settings Management

    Various settings can be managed for MyAmaysim accounts when a valid user is logged in

    Background:
        Given a valid MyAmaysim user logs into his account


    @amaysim @call_forward
    Scenario: Update Call Forwarding Setting
        When the user goes to the Settings section
        Then the user can turn OFF the call forwarding option
        And the user can also turn ON the call forwarding option
        And the user can log out of his account

    @amaysim @sms_limit
    Scenario: Update Premium SMS Limit Setting
        When the user goes to the Settings section
        Then the user can change the premium SMS limit
        And the user can log out of his account

    @amaysim @caller_id
    Scenario: Update Caller ID Setting
        When the user goes to the Settings section
        Then the user can turn OFF the caller ID option
        And the user can also turn ON the caller ID option
        And the user can log out of his account
