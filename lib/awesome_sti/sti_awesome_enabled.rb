require 'active_support'

module AwesomeSti
  module StiAwesomeEnabled extend ActiveSupport::Concern


    module ClassMethods

      # This method by default will create typecasting initializer
      #
      # awesome_sti

      def awesome_sti(params = {}, &block)
        if block_given?
          instance_eval &block
        else
          create_sti_typecast_initializer
          override_sti_modelname
          create_sti_stable_callbacks
        end
      end

      private
      def create_sti_stable_callbacks
        class_eval do
          around_update do
            self.class.instance_variable_set :@finder_needs_type_condition, true
            yield
            self.class.instance_variable_set :@finder_needs_type_condition, nil
          end

          after_rollback do
            self.class.instance_variable_set :@finder_needs_type_condition, nil
          end
        end
      end

      def override_sti_modelname
        class_eval do
          self.descendants.each do |child|
            child.define_method :model_name do
               self.name unless child.descends_from_active_record?
            end
          end
        end
      end

      def create_sti_typecast_initializer
        class_eval do
          def new_with_cast(*attributes, &block)
            if (h = attributes.first).is_a?(Hash) && !h.nil? && (type = h[:klass] || h['klass']) && type.length > 0 && (klass = type.constantize) != self
              raise "wtF hax!!"  unless klass <= self
              return klass.new(*attributes, &block)
            end

            new_without_cast(*attributes, &block)
          end
          alias_method_chain :new, :cast
        end
      end

    end
  end
end