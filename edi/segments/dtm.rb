class DTM < Line
    attr_reader :date
    attr_reader :qualifier

    def initialize(data, version, chars)
        super(data, version, chars)
        # (2005) Date/time/period qualifier
        @qualifier = val(1, 0, "2005")
        # (2380) Date/time/period
        @date      = val(1, 1)
        # (2379) Date/time/period format qualifier
        @format    = val(1, 2, "2379")
    end

    def html
        codes = [[1, 0]]
        typed = [[1, 1]]
        mssge = [[1, 2]]
        super(codes, typed, mssge)
    end

    def table
        rows = [header_row]
        # (2005) Date/time/period qualifier
        unless @qualifier == nil
            rows << coded_row("2005", "Date/time/period qualifier", @qualifier)
        end
        # (2380) Date/time/period
        unless @date == nil
            rows << ["2380", "Date/time/period", @date, interpret]
        end
        # (2379) Date/time/period format qualifier
        unless @format == nil
            rows << coded_row("2379", "Date/time/period format qualifier", 
                @format)
        end
        return rows
    end

    def debug
        super
        puts "#{@qualifier.ref} = #{@date} (#{@format.ref}) #{interpret}"
        puts "\n"
    end

    def interpret
        return interpret_date(@date, @format.value)
    end
end