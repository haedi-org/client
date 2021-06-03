class ALI < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (3239) Country of origin, coded
        @country = val(1, 0, "3239")
        # (9213) Type of duty regime, coded
        @duty_regime = val(2, 0, "9213")
        # (4183) Special conditions, coded (5 lines)
        @special_conditions = [
            val(3, 0, "4183"),
            val(4, 0, "4183"),
            val(5, 0, "4183"),
            val(6, 0, "4183"),
            val(7, 0, "4183")
        ].compact
    end

    def html
        coded = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
        super(coded)
    end

    def table
        rows = [header_row]
        # (3239) Country of origin, coded
        unless @country == nil
            rows << coded_row("3239", "Country of origin", @country)
        end
        # (9213) Type of duty regime, coded
        unless @duty_regime == nil
            rows << coded_row("9213", "Type of duty regime", @duty_regime)
        end
        # (4183) Special conditions, coded (5 lines)
        @special_conditions.each do |condition|
            rows << coded_row("4183", "Special conditions", condition)
        end
        return rows
    end

    def debug
        super
        puts "\n"
    end
end