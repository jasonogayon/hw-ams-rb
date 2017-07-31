# Caller ID
# ---------

Then(/^the user can (?:also )?turn (.*?) the caller ID option$/) do |caller_id|
    initial_caller_id_value = on(SettingsPage).get_caller_id_setting
    caller_id.include?('ON') ? on(SettingsPage).display_caller_id(initial_caller_id_value) : on(SettingsPage).hide_caller_id(initial_caller_id_value)
end
