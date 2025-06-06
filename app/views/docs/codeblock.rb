# frozen_string_literal: true

class Views::Docs::Codeblock < Views::Base
  def view_template
    component = "Codeblock"
    div(class: "max-w-2xl mx-auto w-full py-10 space-y-10") do
      render Docs::Header.new(title: "Codeblock", description: "A component for displaying highlighted code.")

      Heading(level: 2) { "Usage" }

      render Docs::VisualCodeExample.new(title: "With clipboard", context: self) do
        <<~RUBY
          code = <<~CODE
              def hello_world
                puts "Hello, world!"
              end
            CODE
          div(class: 'w-full') do
            Codeblock(code, syntax: :ruby)
          end
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Without clipboard", context: self) do
        <<~RUBY
          code = <<~CODE
              def hello_world
                puts "Hello, world!"
              end
            CODE
          div(class: 'w-full') do
            Codeblock(code, syntax: :ruby, clipboard: false)
          end
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Custom message", description: "Copy the code to see the message", context: self) do
        <<~RUBY
          code = <<~CODE
              def hello_world
                puts "Hello, world!"
              end
            CODE
          div(class: 'w-full') do
            Codeblock(code, syntax: :ruby, clipboard_success: "Nice one!")
          end
        RUBY
      end

      render Components::ComponentSetup::Tabs.new(component_name: component)

      render Docs::ComponentsTable.new(component_files(component))
    end
  end
end
