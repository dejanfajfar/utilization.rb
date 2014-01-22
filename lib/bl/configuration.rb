require 'yaml'
require 'ostruct'

class Configuration
  $db_config_file = "../../config/"

  def initialize
    @loaded_configs = OpenStruct.new
  end

  def method_missing(meth, *args, &block)
    super if meth.empty?
    if configuration_exists?(meth)
      return @loaded_configs[meth] if @loaded_configs.to_h.has_key?(meth)
      @loaded_configs[meth] = OpenStruct.new load_configuration(meth)
      print @loaded_configs[meth].host
      return @loaded_configs
    else
      super
    end
  end

  private

  def configuration_exists? (config_name)
    File.exist? config_file_location(config_name)
  end

  def config_file_location (config_name)
    File.join(__dir__, $db_config_file, "#{config_name}.yaml")
  end

  def load_configuration(config_name)
    file_location = config_file_location(config_name)
    if File.exist? file_location
      config = YAML.load File.open file_location
      return config
    end
  end
end