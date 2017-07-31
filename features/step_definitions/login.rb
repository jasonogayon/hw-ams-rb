# Login to MyAmaysim Account
# --------------------------

Given(/^a valid MyAmaysim user logs into his account$/) do
    visit LoginPage
    on(LoginPage).login
    on(DashboardPage).close_welcome_popup
    expect(@browser.url).to eq(FigNewton.amaysim_dashboard)
end

Then(/^the user can log out of his account$/) do
    on(LoginPage).logout
end
