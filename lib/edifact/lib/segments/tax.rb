class TAX < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (5283) Duty/tax/fee function qualifier
        @tax_function = define([1, 0], "5283", 
            "Duty/tax/fee function qualifier", true)
        # (5153) Duty/tax/fee type, coded
        @tax_type = define([2, 0], "5153", "Duty/tax/fee type", true)
        # (1131) Code list qualifier
        # (3055) Code list responsible agency, coded
        # (5152) Duty/tax/fee type
        # (C533) DUTY/TAX/FEE ACCOUNT DETAIL
        # (5289) Duty/tax/fee account identification
        # (1131) Code list qualifier
        # (3055) Code list responsible agency, coded
        # (5286) Duty/tax/fee assessment basis
        # (C243) DUTY/TAX/FEE DETAIL
        # (5279) Duty/tax/fee rate identification
        # (1131) Code list qualifier
        # (3055) Code list responsible agency, coded
        # (5278) Duty/tax/fee rate 
        # (5273) Duty/tax/fee rate basis identification
        # (1131) Code list qualifier
        # (3055) Code list responsible agency, coded
        # (5305) Duty/tax/fee category, coded
        # (3446) Party tax identification number
        # Push to elements
        push_elements([
            @tax_function, @tax_type
        ])
    end

    def html
        coded = [[1, 0], [2, 0]]
        super(coded)
    end

    def debug
        super
        @tax_function.tap { |v| puts "Function = " + v.ref if v != nil }
        @tax_type.tap { |v| puts "Type = " + v.ref if v != nil }
        puts "\n"
    end
end