class InfrastructurePage < SitePrism::Page 
	set_url('/zport/dmd/itinfrastructure')
	element :device_list, :xpath, "*//div[@id='device_grid-body']" 
	element :add_devices_button, :xpath, "*//div[@id='adddevice-button']"
	element :add_device_options, :xpath, "*//div[@id='addsingledevice-item']"
	element :add_single_device, :xpath, "*//div[@id='addsingledevice-item']"
	element :add_device_modal, :xpath, "*//div[@class='x-css-shadow']"
	element :device_ip_address, :xpath, "//*[@id='add-device-name-inputEl']"
	element :device_class, :xpath, "//*[@id='add-device_class-inputEl']"
	element :more_link, :xpath, "//*[text()='More...']"
	element :server_username, :xpath, "//*[@id='zCommandUsername-inputEl']"
	element :server_password, :xpath, "//*[@id='zCommandPassword-inputEl']"
	element :add_button, :xpath, "//*[text()='Add']"
	element :added_device, :xpath, "//*[text()='10.88.120.20']"
	element :refresh, :xpath, "//*[text()='Refresh']"
	element :flare, :xpath, "//*[text()='Create 10.88.120.20']" 
end 