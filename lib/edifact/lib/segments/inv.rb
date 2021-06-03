class INV < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (4501) Inventory movement direction, coded
        @movement_direction = val(1, 0, "4501")
        # (7491) Type of inventory affected, coded
        @inventory_type = val(2, 0, "7491")
        # (4499) Reason for inventory movement, coded
        @movement_reason = val(3, 0, "4499")
        # (4503) Inventory balance method, coded
        @balance_method = val(4, 0, "4503")
        # (4403) Instruction qualifier
        @instruction_qualifier = val(5, 0, "4403")
        # (4401) Instruction, coded
        @instruction_coded = val(5, 1, "4401")
        # (1131) Code list qualifier
        @code_list = val(5, 2, "1131")
        # (3055) Code list responsible agency, coded
        @agency = val(5, 3, "3055")
        # (4400) Instruction
        @instruction = val(5, 4)
    end

    def html
        coded = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [5, 1]]
        typed = [[5, 4]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (4501) Inventory movement direction, coded
        unless @movement_direction == nil
            rows << coded_row("4501", "Inventory movement direction", 
                @movement_direction)
        end
        # (7491) Type of inventory affected, coded
        unless @inventory_type == nil
            rows << coded_row("7491", "Type of inventory affected", 
                @inventory_type)
        end
        # (4499) Reason for inventory movement, coded
        unless @movement_reason == nil
            rows << coded_row("4499", "Reason for inventory movement", 
                @movement_reason)
        end
        # (4503) Inventory balance method, coded
        unless @balance_method == nil
            rows << coded_row("4503", "Inventory balance method", 
                @balance_method)
        end
        # (4403) Instruction qualifier
        unless @instruction_qualifier == nil
            rows << coded_row("4403", "Instruction qualifier", 
                @instruction_qualifier)
        end
        # (4401) Instruction, coded
        unless @instruction_coded == nil
            rows << coded_row("4401", "Instruction", @instruction_coded)
        end
        # (1131) Code list qualifier
        unless @code_list == nil
            rows << coded_row("1131", "Code list qualifier", @code_list)
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << coded_row("3055", "Code list responsible agency", @agency)
        end
        # (4400) Instruction
        unless @instruction == nil
            rows << ["4400", "Instruction", @instruction]
        end
        return rows
    end

    def debug
        super
        @movement_direction.tap { |v| puts "Direction = " + v.ref if v != nil }
        @inventory_type.tap { |v| puts "Inv type = " + v.ref if v != nil }
        @movement_reason.tap { |v| puts "Reason = " + v.ref if v != nil }
        @balance_method.tap { |v| puts "Method = " + v.ref if v != nil }
        @instruction_qualifier.tap { |v| puts "Qual = " + v.ref if v != nil }
        @instruction_coded.tap { |v| puts "Coded = " + v.ref if v != nil }
        @code_list.tap { |v| puts "Code list = " + v.ref if v != nil }
        @agency.tap { |v| puts "Agency = " + v.ref if v != nil }
        @instruction.tap { |v| puts "Instruction = " + v if v != nil }
        puts "\n"
    end
end