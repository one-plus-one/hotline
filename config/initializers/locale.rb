# in config/initializers/locale.rb

# tell the I18n library where to find your translations
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{zh-CN,yml}')]
I18n.config.enforce_available_locales = false
I18n.default_locale = 'zh-CN'