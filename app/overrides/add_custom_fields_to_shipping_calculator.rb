Deface::Override.new(
	:name         => "add_custom_fields_capability_to_shipping_calculator",
	:virtual_path => "spree/admin/shipping_methods/_form",
	:replace			=> "[data-hook='admin_shipping_method_form_calculator_fields']",
	:partial			=> "spree/admin/shipping_methods/add_custom_calculator_fields.html.erb"
)