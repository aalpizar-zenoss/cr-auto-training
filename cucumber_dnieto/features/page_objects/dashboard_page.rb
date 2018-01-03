require 'site_prism'

class DashboardPage < SitePrism::Page
	set_url "/"
	element :logout_button, :css, "div[id='sign-out-link']"
	element :infrastructure_button, :css, "a[id='Infrastructure-nav-button']"
end