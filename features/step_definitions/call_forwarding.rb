# Call Forwarding
# ---------------

Then(/^the user can (?:also )?turn (.*?) the call forwarding option$/) do |call_forwarding|
    initial_call_forwarding_value = on(SettingsPage).get_call_forwarding_setting
    call_forwarding = call_forwarding.include?('ON') ? 'Yes' : 'No'
    step "the user can change the call forwarding option" if initial_call_forwarding_value != call_forwarding
end

Then(/^the user can change the call forwarding option$/) do
    initial_call_forwarding_value = on(SettingsPage).get_call_forwarding_setting
    on(SettingsPage).change_call_forwarding(initial_call_forwarding_value)
    expect(on(SettingsPage).get_call_forwarding_setting).not_to eq(initial_call_forwarding_value)
end
