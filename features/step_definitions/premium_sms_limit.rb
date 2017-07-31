# Premium SMS Limit
# -----------------

Then(/^the user can change the premium SMS limit$/) do
    initial_premium_sms_limit = on(SettingsPage).get_premium_sms_limit_setting
    on(SettingsPage).change_premium_sms_limit(initial_premium_sms_limit)
    expect(on(SettingsPage).get_premium_sms_limit_setting).not_to eq(initial_premium_sms_limit)
end
