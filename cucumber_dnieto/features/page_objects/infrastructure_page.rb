require 'site_prism'

class InfrastructurePage < SitePrism::Page
	set_url "/"
	element :add_button, :css, "button[id='adddevice-button-btnEl']"
	element :add_single_device, :css, "div[id='addsingledevice-item']"
end