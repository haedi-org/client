class TAX < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (5283) Duty/tax/fee function qualifier
        @tax_function = define([1, 0], "5283", 
            "Duty/tax/fee function qualifier", true)
        # (5153) Duty/tax/fee type, coded
        @tax_type = define([2, 0], "5153", "Duty/tax/fee type", true)
        # Push to elements
        push_elements([
            @tax_function, @tax_type
        ])
    end

    def debug
        super
        @tax_function.tap { |v| puts "Function = " + v.ref if v != nil }
        @tax_type.tap { |v| puts "Type = " + v.ref if v != nil }
        puts "\n"
    end
end