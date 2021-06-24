class DTM < Line
    attr_reader :date
    attr_reader :qualifier

    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (2005) Date/time/period qualifier
        @qualifier = define([1, 0], "2005", "Date/time/period qualifier", true)
        # (2380) Date/time/period
        @date = define([1, 1], "2380", "Date/time/period")
        # (2379) Date/time/period format qualifier
        @format = define([1, 2], "2379", "Date/time/period format qualfier", 
            true)
        # Set date reference
        @date.ref = interpret_date(@date.value, @format.value)
        # Push to elements
        push_elements([
            @qualfier, @date, @format
        ])
    end

    def html
        codes = [[1, 0]]
        typed = [[1, 1]]
        mssge = [[1, 2]]
        super(codes, typed, mssge)
    end
    
    def debug
        super
        puts "#{@qualifier.ref} = #{@date} (#{@format.ref}) #{interpret}"
        puts "\n"
    end

    def interpret
        return interpret_date(@date.value, @format.value)
    end
end