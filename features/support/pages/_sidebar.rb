class Sidebar

    include PageObject

    # Element Locators
    div(:modal, :class => "reveal-modal-bg")
    div(:loading_spinner, :class => "loading-spinner")
    div(:page_header, :class => "ama-page-header")
    link(:plan, :xpath => "//a[@href='/my-account/my-amaysim/dashboards']")
    link(:manage_plan, :xpath => "//a[@href='/my-account/my-amaysim/products']")
    link(:usage_history, :xpath => "//a[@href='/my-account/my-amaysim/usage_records']")
    link(:recharge_voucher, :xpath => "//a[@href='/my-account/my-amaysim/promotions?voucher=true']")
    link(:payments, :xpath => "//a[@href='/my-account/my-amaysim/invoices']")
    link(:payment_method, :xpath => "//a[@href='/my-account/my-amaysim/payment-method']")
    link(:settings, :xpath => "//a[@href='/my-account/my-amaysim/settings']")
    link(:personal_details, :xpath => "//a[@href='/my-account/my-amaysim/personal-details']")
    link(:replace_sim, :xpath => "//a[@href='/my-account/my-amaysim/sims']")
    link(:redeem_promo, :xpath => "//a[@href='/my-account/my-amaysim/promotions']")
    link(:refer_friend, :xpath => "//a[@href='/my-account/my-amaysim/refer_friends']")
    link(:mobile_help, :xpath => "//a[@href='/help/mobile']")
    link(:forminfo_popup_close, :xpath => "//div[contains(@class,'form_info_popup')]//a[@class='close-reveal-modal']")


    # Methods
    def goto_section(section_name)
        self.settings if section_name.include? 'settings'
        wait_until_page_loads
        self.page_header_element.wait_until_present(timeout:30)
        return self.page_header_element.text
    end

    def wait_until_page_loads
        self.loading_spinner_element.wait_until_present(timeout:30)
        self.loading_spinner_element.wait_while_present(timeout:30)
    end

    def close_forminfo_popup
        self.forminfo_popup_close_element.wait_until_present(timeout:30)
        self.forminfo_popup_close
        self.forminfo_popup_close_element.wait_while_present(timeout:30)
    end

end
