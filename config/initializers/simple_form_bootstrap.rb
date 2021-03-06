# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, :tag => 'div', :class => 'form-group', :error_class => 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :tag => 'div', :class => 'controls' do |ba|
      ba.use :input
      ba.use :error, :wrap_with => { :tag => :span, :class => 'help-block has-error' }
      ba.use :hint,  :wrap_with => { :tag => :p, :class => 'help-block' }
    end
  end

  config.wrappers :bootstrap_checkbox, :tag => :div, :class => "checkbox", :error_class => 'has-error' do |b|
    b.use :html5

    b.wrapper :tag => :label do |ba|
      ba.use :input
      ba.use :label_text
    end

    b.use :hint, :wrap_with => {:tag => :p, :class => "help-block"}
    b.use :error, :wrap_with => {:tag => :span, :class => "help-block has-error"}
  end

  config.wrappers :bootstrap_radio, :tag => :div, :class => 'radio', :error_class => 'has-error' do |b|
    b.use :html5

    b.wrapper :tag => :label do |ba|
      ba.use :input
      ba.use :label_text
    end

    b.use :hint, :wrap_with => {:tag => :p, :class => "help-block"}
    b.use :error, :wrap_with => {:tag => :span, :class => "help-block has-error"}
  end

  config.wrappers :prepend, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  config.wrappers :append, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block has-error' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
  config.boolean_style = :inline
  config.wrapper_mappings = {:boolean => :bootstrap_checkbox, :radio => :bootstrap_radio}
  config.error_notification_class = 'alert alert-danger'
end

# TEMPORARY FIX FOR SIMPLEFORM INPUTS ON BOOTSTRAP 3
%w[
  CollectionSelectInput
  DateTimeInput
  FileInput
  GroupedCollectionSelectInput
  NumericInput
  PasswordInput
  RangeInput
  StringInput
  TextInput
].each do |input_type|
  superclass = "SimpleForm::Inputs::#{input_type}".constantize

  new_class = Class.new(superclass) do
    def input_html_classes
      super.push('form-control')
    end
  end

  Object.const_set(input_type, new_class)
end
