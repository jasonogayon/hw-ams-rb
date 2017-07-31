class DashboardPage < Sidebar

    include PageObject

    page_url FigNewton.amaysim_dashboard

    # Element Locators
    div(:welcome_popup, :id => "welcome_popup")
    link(:welcome_popup_close, :xpath => "//div[@id='welcome_popup']//a[@class='close-reveal-modal']")


    # Methods
    def close_welcome_popup
        self.welcome_popup_element.wait_until_present(timeout:120)
        self.welcome_popup_close
        self.welcome_popup_element.wait_while_present(timeout:120)
    end

end
