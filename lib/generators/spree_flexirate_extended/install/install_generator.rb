module SpreeFlexirateExtended
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_flexirate_extended'
      end

      def add_javascripts
        append_file "app/assets/javascripts/admin/all.js", "\n//= require admin/index\n" 
      end
      
      def add_stylesheets
        inject_into_file "app/assets/stylesheets/admin/all.css", "\n *= require admin/index\n", :before => /\*\//, :verbose => true
      end
    end
  end
end