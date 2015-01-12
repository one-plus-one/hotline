Feature: Login in
    In order to use the hotline system
    A telephone operator
    Should provide correct credential to do the login
 
    Scenario: can't login to the system with random username
        Given I am on the home page
        Then I should see "继续操作前请注册或者登录" on the page
        And I provide the username "asdfgqrwer" and password
        When I click login button
        Then I should see "邮箱或密码错误" on the page

    Scenario: login to the system with correct user
        Given I am on the home page
        And I provide the username "test" and password
        When I click login button
        Then I should see "test" on the page
