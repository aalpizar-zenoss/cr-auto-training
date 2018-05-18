require 'yaml'

class Locator

  attr_reader :selectors

  def load_selectors
    @selectors ||= YAML.load(File.read("#{__dir__}/locators.yml"))
  end

  def self.method_missing(m, *args, &block)
    create_method(m)
  end

  def self.create_method(name)
    self.class.instance_eval do
      define_method(name.to_s) { instance.selectors[name.to_s] }
    end
  end

  private

  def initialize
    load_selectors
  end

  def self.instance
    @instance ||= new
  end
end
