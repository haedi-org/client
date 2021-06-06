class FTX < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (4451) Text subject qualifier
        @text_subject = define([1, 0], "4451", "Text subject qualifier", true)
        # (4453) Text function, coded
        @text_function  = define([2, 0], "4453", "Text function", true)
        # (4441) Free text identification
        @free_text_desc = define([3, 0], "4441", "Free text identification")
        # (1131) Code list qualifier
        @code_list = define([3, 1], "1131", "Code list qualifier", true)
        # (3055) Code list responsible agency, coded
        @agency = define([3, 2], "3055", "Code list responsible agency", true)
        # (4440) Free text
        @free_text = define([4], "4440", "Free text")
        # Push to elements
        push_elements([
            @text_subject, @text_function, @free_text_desc, @code_list, @agency, 
            @free_text
        ])
    end

    def debug
        super
        @text_subject.tap { |v| puts "Subject = " + v.ref if v != nil }
        @free_text_desc.tap { |v| puts "Description = " + v if v != nil }
        @free_text_function.tap { |v| puts "Function = " + v if v != nil }
        @code_list.tap { |v| puts "Code list = " + v.ref if v != nil }
        @agency.tap { |v| puts "Agency = " + v.ref if v != nil }
        @free_text.tap { |v| puts "Free text = " + v.join(" ") if v != nil }
        puts "\n"
    end
end