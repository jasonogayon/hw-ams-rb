class LoginPage

    include PageObject

    page_url FigNewton.amaysim_login

    # Element Locators
    button(:login, :name => "button")
    link(:logoff, :id => "logout-link")
    text_field(:username, :id => "username")
    text_field(:password, :id => "password")


    # Methods
    def login
        self.username_element.wait_until_present(timeout:120)
        self.username = FigNewton.amaysim_username
        self.password = FigNewton.amaysim_password
        self.login_element.click
    end

    def logout
        self.logoff_element.scroll_into_view
        self.logoff_element.focus
        self.logoff
        self.login_element.wait_until_present(timeout:120)
    end

end
