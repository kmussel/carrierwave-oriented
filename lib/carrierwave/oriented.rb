# encoding: utf-8

require 'carrierwave'
require 'oriented'
require 'hooks'

module CarrierWave
  module Oriented    
    module ClassMethods
      include CarrierWave::Mount

      # See +CarrierWave::Mount#mount_uploader+ for documentation
      #
      def mount_uploader(column, uploader, options={}, &block)
        if _props[column]
          warn "Defining property for an uploader is deprecated at #{caller[2]}"
          _props.delete(column)
        end

        uploader_property = if options[:mount_on]
                              _props[options[:mount_on]]
                            else
                              property column
                              column
                            end

        super

        alias_method :read_uploader,  :read_attribute
        alias_method :write_uploader, :write_attribute

        pre_hook = :save # ::Oriented.const_defined?(:Validations) ? :valid? : :save
        define_hook :before_save
        define_hook :after_save
        define_hook :after_destroy
        
        before_save "write_#{column}_identifier".to_sym
        before_save "store_#{column}!".to_sym
        after_destroy "remove_#{column}!".to_sym


        uploader_property
      end
      
    end
  end # Oriented
end # CarrierWave

Oriented::Vertex::ClassMethods.send :include, CarrierWave::Oriented::ClassMethods
