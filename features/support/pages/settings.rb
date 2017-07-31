class SettingsPage < Sidebar

    include PageObject

    page_url FigNewton.amaysim_settings

    # Element Locators
    div(:sim_nickname, :id => "settings_sim_nickname")
    div(:recharge_pin, :id => "settings_recharge_pin")
    div(:puk_code, :id => "settings_puk_code")
    div(:caller_id, :id => "settings_caller_id_out")
    div(:call_waiting, :id => "settings_caller_waiting")
    div(:voicemail, :id => "settings_voice_mail")
    div(:usage_alerts, :id => "settings_usage_alert")
    div(:international_roaming, :id => "settings_intl_roaming")
    div(:call_forwarding, :id => "settings_call_forwarding")
    div(:call_forwarding_value, :xpath => "//div[@id='settings_call_forwarding']//div[@class='small-1 medium-2 large-1 columns bold text-right setting-option-value-text']")
    div(:premium_sms_limit, :id => "settings_premium_sms_limit")
    div(:premium_sms_limit_value, :xpath => "//div[@id='settings_premium_sms_limit']//div[@class='small-1 medium-2 large-1 columns bold text-right setting-option-value-text']")
    div(:auto_recharge, :id => "settings_auto_recharge")
    div(:auto_recharge_value, :xpath => "//div[@id='settings_auto_recharge']//div[@class='small-1 medium-2 large-1 columns bold text-right setting-option-value-text']")
    link(:edit_sim_nickname, :id => "edit_settings_phone_label")
    link(:edit_recharge_pin, :id => "edit_settings_recharge_pin")
    link(:call_forwarding_popup_confirm, :xpath => "//div[contains(@class,'form_confirm_popup')]//a[contains(@class,'confirm_popup_confirm')]")
    link(:call_forwarding_popup_cancel, :xpath => "//div[contains(@class,'form_confirm_popup')]//a[contains(@class,'confirm_popup_cancel')]")
    link(:edit_call_forwarding, :id => "edit_settings_call_forwarding")
    link(:call_forwarding_cancel, :id => "cancel_settings_call_forwarding")
    link(:edit_premium_sms_limit, :id => "edit_settings_premium_sms_limit")
    link(:edit_auto_recharge, :id => "edit_settings_auto_recharge")
    span(:allow_call_forwarding, :xpath => "//*[@id='my_amaysim2_setting_call_divert_true']/following::span[1]")
    span(:disallow_call_forwarding, :xpath => "//*[@id='my_amaysim2_setting_call_divert_false']/following::span[1]")
    button(:call_forwarding_save, :xpath => "//*[@id='settings_call_forwarding']//input[@name='commit']")
    button(:premium_sms_limit_save, :xpath => "//*[@id='settings_premium_sms_limit']//input[@name='commit']")
    checkbox(:edit_caller_id, :id => "my_amaysim2_setting_caller_id_out")
    label(:label_caller_id, :xpath => "//label[@for='my_amaysim2_setting_caller_id_out']")
    checkbox(:edit_call_waiting, :id => "my_amaysim2_setting_caller_waiting")
    checkbox(:edit_voicemail, :id => "my_amaysim2_setting_voice_mail")
    checkbox(:edit_usage_alerts, :id => "my_amaysim2_setting_usage_alert")
    checkbox(:edit_international_roaming, :id => "my_amaysim2_setting_intl_roaming")
    text_field(:call_forwarding_number, :id => "my_amaysim2_setting_call_divert_number")
    select_list(:premium_sms_limit_options, :id => "my_amaysim2_setting_psms_spend")


    # Methods
    def get_call_forwarding_setting
        self.call_forwarding_value_element.wait_until_present(timeout:30)
        return self.call_forwarding_value_element.text
    end

    def change_call_forwarding(call_forwarding_value)
        self.edit_call_forwarding
        wait_until_page_loads
        self.call_forwarding_popup_confirm_element.wait_until_present(timeout:30)
        self.call_forwarding_popup_confirm
        if call_forwarding_value == "No"
            self.allow_call_forwarding_element.click
            self.call_forwarding_number = FigNewton.amaysim_divert_number
        else
            self.disallow_call_forwarding_element.click
        end
        self.call_forwarding_save_element.scroll_into_view
        self.call_forwarding_save_element.focus
        self.call_forwarding_save
        wait_until_page_loads
        close_forminfo_popup
    end

    def get_premium_sms_limit_setting
        self.premium_sms_limit_value_element.wait_until_present(timeout:30)
        return self.premium_sms_limit_value_element.text
    end

    def change_premium_sms_limit(sms_limit)
        self.edit_premium_sms_limit
        wait_until_page_loads
        sms_limit_options = Array.new(11) {|i| i*10 }
        sms_limit_options.delete(sms_limit.gsub("$",""))
        sms_limit_option = sms_limit_options[rand(1..10)].to_s
        self.premium_sms_limit_options_element.select_value(sms_limit_option)
        self.premium_sms_limit_save_element.scroll_into_view
        self.premium_sms_limit_save_element.focus
        self.premium_sms_limit_save
        wait_until_page_loads
    end

    def get_caller_id_setting
        return self.edit_caller_id_element.attribute_value("checked")
    end

    def display_caller_id(caller_id_value)
        if caller_id_value.nil?
            self.label_caller_id_element.click
            wait_until_page_loads
            close_forminfo_popup
        end
    end

    def hide_caller_id(caller_id_value)
        unless caller_id_value.nil?
            self.label_caller_id_element.click
            wait_until_page_loads
            close_forminfo_popup
        end
    end

end
