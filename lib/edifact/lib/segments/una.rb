class UNA < Line
    def initialize(data, line_no, version, chars = nil)
        @version = version
        @line_no = line_no
        @raw = data
        @data = [["UNA"]]
        # (UNA1) Component data element separator
        @component_element_seperator = lookup("UNA1", @raw[3])
        # (UNA2) Data element separator
        @data_element_seperator = lookup("UNA2", @raw[4])
        # (UNA3) Decimal mark
        @decimal_mark = lookup("UNA3", @raw[5])
        # (UNA4) Release character
        @release_character = lookup("UNA4", @raw[6])
        # (UNA5) Repetition separator
        @repetition_seperator = lookup("UNA5", @raw[7])
        # (UNA6) Segment terminator
        @segment_terminator = lookup("UNA6", @raw[8])
        @chars = punctuation
    end

    def html
        clr, fwt = "#2B2B2B", "bold"
        style = "color: #{clr}; font-weight: #{fwt}"
        a = "<b style='#{style}'>#{@raw[0, 3]}</b>"
        clr, fwt = "#D512E2", "bold"
        style = "color: #{clr}; font-weight: #{fwt}"
        b = "<b style='#{style}'>#{@raw[3..-1]}</b>"
        return a + b
    end

    def table
        rows = [header_row(false)]
        chars = [@component_element_seperator, @data_element_seperator, 
            @decimal_mark, @release_character, @segment_terminator]
        chars.each do |char|
            rows << [char.code, char.ref, char.value, char.desc]
        end
        return rows
    end

    def lookup(code, value)
        csv = csv_reference("./codes/edifact_string_advice.csv", code)
        return Reference.new(value, "", "", code) if csv == []
        return Reference.new(value, csv[1], csv[2], code)
    end

    def punctuation
        return Punctuation.new(
            @component_element_seperator.value,
            @data_element_seperator.value,
            @decimal_mark.value,
            @release_character.value,
            @segment_terminator.value
        )
    end
end