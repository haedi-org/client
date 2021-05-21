class FTX < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (4451) Text subject qualifier
        @text_subject   = val(1, 0, "4451")
        # (4453) Text function, coded
        @text_function  = val(2, 0, "4453")
        # (4441) Free text identification
        @free_text_desc = val(3, 0)
        # (1131) Code list qualifier
        @code_list      = val(3, 1, "1131")
        # (3055) Code list responsible agency, coded
        @agency         = val(3, 2, "3055")
        # (4440) Free text
        @free_text      = len() > 4 ? @data[4] : nil
    end

    def table
        rows = [header_row]
        # (4451) Text subject qualifier
        unless @text_subject == nil
            rows << coded_row("4451", "Text subject qualifier", @text_subject)
        end
        # (4453) Text function, coded
        unless @text_function == nil
            rows << coded_row("4453", "Text function", @text_function)
        end
        # (4441) Free text identification
        unless @free_text_desc == nil
            rows << ["4441", "Free text identification", @free_text_desc]
        end
        # (1131) Code list qualifier
        unless @code_list == nil
            rows << coded_list("1131", "Code list qualifier", @code_list)
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << coded_list("3055", "Code list responsible agency", @agency)
        end
        # (4440) Free text
        unless @free_text == nil
            rows << ["4440", "Free text", @free_text.join("\n")]
        end
        return rows
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