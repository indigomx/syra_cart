module Localization
  module UserPreferences
    def self.included(base)
      base.class_eval do
        preference :locale, :string, :default => 'es-MX'
      end
    end
  end
end
