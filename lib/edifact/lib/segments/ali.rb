class ALI < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (3239) Country of origin, coded
        @country = define([1, 0], "3239", "Country of origin", true)
        # (9213) Type of duty regime, coded
        @duty_regime = define([2, 0], "3239", "Type of duty regime", true)
        # (4183) Special conditions, coded (5 lines)
        @special_conditions = [
            define([3, 0], "4183", "Special conditions"),
            define([4, 0], "4183", "Special conditions"),
            define([5, 0], "4183", "Special conditions"),
            define([6, 0], "4183", "Special conditions"),
            define([7, 0], "4183", "Special conditions"),
        ].compact
        # Push to elements
        push_elements([
            @country, @duty_regime, @special_conditions
        ].flatten)
    end

    def html
        coded = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
        super(coded)
    end

    def debug
        super
        puts "\n"
    end
end