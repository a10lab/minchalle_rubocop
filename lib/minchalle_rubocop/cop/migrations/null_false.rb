require 'rubocop'

module RuboCop
  module Cop
    module Migrations
      class NullFalse < Base
        MSG = "Why don't use `null: false`, please check it and explain reason"

        def_node_matcher :add_column_found, '(:send _ :add_column ...)'
        def_node_matcher :create_table_with_column_found, '(:block (:send _ :create_table ...) (:args ...) (:begin $...) ...)'

        def on_send(node)
          add_column_found(node) do
            _, _, *args = *node
            add_offense(node) unless check_null_opt(args)
          end
        end

        def on_block(node)
          create_table_with_column_found(node) do |columns|
            columns.each do |column|
              _, method_name, *args = *column
              next if [:index, :timestamps].include?(method_name)

              add_offense(column) unless check_null_opt(args)
            end
          end
        end

        private

          def check_null_opt(args)
            args.each do |arg|
              next unless arg.hash_type?

              arg.each_child_node do |pair|
                return true if pair.children[0].value == :null
              end
            end

            false
          end
      end
    end
  end
end

