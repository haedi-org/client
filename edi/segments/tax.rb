class TAX < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (5283) Duty/tax/fee function qualifier
        @tax_function = val(1, 0, "5283")
        # (5153) Duty/tax/fee type, coded
        @tax_type = val(2, 0, "5153")
    end

    def table
        rows = [header_row]
        # (5283) Duty/tax/fee function qualifier
        unless @tax_function == nil
            rows << coded_row("5283", "Duty/tax/fee function qualifier", @tax_function)
        end
        # (5153) Duty/tax/fee type, coded
        unless @tax_type == nil
            rows << coded_row("5153", "Duty/tax/fee type", @tax_type)
        end
        return rows
    end

    def debug
        super
        @tax_function.tap { |v| puts "Function = " + v.ref if v != nil }
        @tax_type.tap { |v| puts "Type = " + v.ref if v != nil }
        puts "\n"
    end
end