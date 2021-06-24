class MOA < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
		# (5025) Monetary amount type code qualifier
        @monetary_amount_qualifier = define([1, 0], "5025", 
            "Monetary amount type code qualifier", true)
		# (5004) Monetary amount
        @monetary_amount = define([1, 1], "5004", "Monetary amount")
		# (6345) Currency identification code
        @currency_code = define([1, 2], "6345", "Currency identification code")
		# (6343) Currency type code qualifier
        @currency_code_qualifier = define([1, 3], "6343", 
            "Currency type code qualifier", true)
		# (4405) Status description code
        @status_code = define([1, 4], "4405", "Status description code", true)
        # Push to element
        push_elements([
            @monetary_amount_qualifier, @monetary_amount, @currency_code,
            @currency_code_qualifier, @status_code
        ])
    end

    def html
        coded = [[1, 0], [1, 3], [1, 4]]
        typed = [[1, 1], [1, 2]]
        super(coded, typed)
    end

    def debug
        super
        puts "\n"
    end
end