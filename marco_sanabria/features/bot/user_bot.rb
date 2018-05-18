module Bot
  class User

    include Capybara::DSL
    extend Capybara::DSL

    def self.click_on(element)
      element.click
    end

    def self.type_on(textbox, text)
      textbox.set(text)
    end
  end
end
