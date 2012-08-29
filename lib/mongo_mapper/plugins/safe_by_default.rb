module MongoMapper
  module Plugins
    module SafeByDefault
      extend ActiveSupport::Concern

      module ClassMethods
        def inherited(subclass)
          super
          subclass.unsafe if unsafe?
        end

        def unsafe
          @unsafe = true
        end

        def unsafe?
          @unsafe == true
        end
      end

      def save_to_collection(options={})
        options[:safe] = !self.class.unsafe? unless options.key? :safe
        super
      end
    end
  end
end