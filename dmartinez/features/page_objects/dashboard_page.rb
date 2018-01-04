class DashboardPage < SitePrism::Page 
	set_url('/')
	element :logout_button, :xpath, "//*[contains(text(),'sign out')]" 
	element :dashboard_page, :xpath, "//*[contains(text(),'Infrastructure')]"
end