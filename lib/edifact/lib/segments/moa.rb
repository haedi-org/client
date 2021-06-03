class MOA < Line
    def initialize(data, version, chars)
        super(data, version, chars)
		# (5025) Monetary amount type code qualifier
        @monetary_amount_qualifier = val(1, 0, "5025")
		# (5004) Monetary amount
        @monetary_amount = val(1, 1)
		# (6345) Currency identification code
        @currency_code = val(1, 2)
		# (6343) Currency type code qualifier
        @currency_code_qualifier = val(1, 3, "6343")
		# (4405) Status description code
        @status_code = val(1, 4, "4405")
    end

    def html
        coded = [[1, 0], [1, 3], [1, 4]]
        typed = [[1, 1], [1, 2]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (5025) Monetary amount type code qualifier
        unless @monetary_amount_qualifier == nil
            rows << coded_row("5025", "Monetary amount type code qualifier", 
                @monetary_amount_qualifier)
        end
		# (5004) Monetary amount
        unless @monetary_amount == nil
            rows << ["5004", "Monetary amount", @monetary_amount]
        end
		# (6345) Currency identification code
        unless @currency_code == nil
            rows << ["6345", "Currency identification code", @currency_code]
        end
		# (6343) Currency type code qualifier
        unless @currency_code_qualifier == nil
            rows << coded_row("6343", "Currency type code qualifier", 
                @currency_code_qualifier)
        end
		# (4405) Status description code
        unless @status_code == nil
            rows << coded_row("4405", "Status description code", @status_code)
        end
        return rows
    end

    def debug
        super
        puts "\n"
    end
end