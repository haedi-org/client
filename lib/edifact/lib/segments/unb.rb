# Example (D13A):
# UNB+UNOC:3+O0013000089TEVES+O0013009096BIP-XPRS-AI-P+170308:2018+000000003'

class UNB < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (0001) Syntax identifier
        @syntax_identifier = val(1, 0, "0001")
        # (0002) Syntax version number
        @syntax_version = val(1, 1, "0002")
        # (0080) Service code list directory version number
        @code_list_version = val(1, 2)
        # (0133) Character encoding, coded
        @character_encoding = val(1, 3, "0133")
        # (0004) Interchange sender identification
        @sender_id = val(2, 0)
        # (0007) Identification code qualifier
        @sender_id_qualifier = val(2, 1, "0007")
        # (0008) Interchange sender internal identification
        @sender_internal_id = val(2, 2)
        # (0042) Interchange sender internal sub-identification
        @sender_internal_sub_id = val(2, 3)
        # (0010) Interchange recipient identification
        @recipient_id = val(3, 0)
        # (0007) Identification code qualifier
        @recipient_id_qualifier = val(3, 1, "0007")
        # (0014) Interchange recipient internal identification
        @recipient_internal_id = val(3, 2)
        # (0046) Interchange recipient internal sub-identification
        @recipient_internal_sub_id = val(3, 3)
        # (0017) Date of preparation - YYMMDD (101)
        @preparation_date = val(4, 0)
        # (0019) Time of preparation - HHMM (401)
        @preparation_time = val(4, 1)
        # (0020) Interchange control reference
        @control_reference = val(4, 2)
        # (0022) Recipient reference/password
        @recipient_reference = val(5, 0)
        # (0025) Recipient reference/password qualifier
        @recipient_reference_qualifier = val(5, 1, "0025")
        # (0026) Application reference
        @application_reference = val(5, 2)
        # (0029) Processing priority code
        @priority_code = val(5, 3, "0029")
        # (0031) Acknowledgement request
        @acknowledgement_request = val(5, 4, "0031")
        # (0032) Interchange agreement identifier
        @agreement_identifier = val(5, 5)
        # (0035) Test indicator
        @test_indicator = val(5, 6, "0035")
    end

    def date
        return nil if @preparation_date == nil
        return case @preparation_date.length
            when 6; interpret_date(@preparation_date, "101")
            when 8; interpret_date(@preparation_date, "102")
            else; @preparation_date
        end
    end

    def time
        return nil if @preparation_time == nil
        return interpret_date(@preparation_time, "401")
    end

    def html
        coded = [[2, 1], [3, 1], [5, 1], [5, 4], [5, 6]]
        typed = [[2, 0], [2, 2], [2, 3], [3, 0], [3, 2], [3, 3], [4, 2], [5, 0]]
        mssge = [[1, 0], [1, 1], [1, 3], [4, 0], [4, 1]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (0001) Syntax identifier
        unless @syntax_identifier == nil
            rows << coded_row("0001", "Syntax identifier", @syntax_identifier)
        end
        # (0002) Syntax version number
        unless @syntax_version == nil
            rows << coded_row("0002", "Syntax version number", @syntax_version)
        end
        # (0080) Service code list directory version number
        unless @code_list_version == nil
            rows << ["0080", "Service code list directory version number", 
                @code_list_version]
        end
        # (0133) Character encoding, coded
        unless @character_encoding == nil
            rows << coded_row("0133", "Character encoding",
                @character_encoding)
        end
        # (0004) Interchange sender identification
        unless @sender_id == nil
            rows << ["0004", "Interchange sender identification", @sender_id]
        end
        # (0007) Identification code qualifier
        unless @sender_id_qualifier == nil
            rows << coded_row("0007", "Sender identification code qualifier", 
                @sender_id_qualifier)
        end
        # (0008) Interchange sender internal identification
        unless @sender_internal_id == nil
            rows << ["0008", "Interchange sender internal identification", 
                @sender_internal_id]
        end
        # (0042) Interchange sender internal sub-identification
        unless @sender_internal_sub_id == nil
            rows << ["0042", "Interchange sender internal sub-identification", 
                @sender_internal_sub_id]
        end
        # (0010) Interchange recipient identification
        unless @recipient_id == nil
            rows << ["0010", "Interchange recipient identification", 
                @recipient_id]
        end
        # (0007) Identification code qualifier
        unless @recipient_id_qualifier == nil
            rows << coded_row("0007", "Recipient identification code qualifier", 
                @recipient_id_qualifier)
        end
        # (0014) Interchange recipient internal identification
        unless @recipient_internal_id == nil
            rows << ["0014", "Interchange recipient internal identification", 
                @recipient_internal_id]
        end
        # (0046) Interchange recipient internal sub-identification
        unless @recipient_internal_sub_id == nil
            rows << ["0046", 
                "Interchange recipient internal sub-identification", 
                @recipient_internal_sub_id]
        end
        # (0017) Date of preperation - YYMMDD (101)
        unless @preparation_date == nil
            rows << ["0017", "Date", @preparation_date, date]
        end
        # (0019) Time of preperation - HHMM (401)
        unless @preparation_time == nil
            rows << ["0019", "Time", @preparation_time, time]
        end
        # (0020) Interchange control reference
        unless @control_reference == nil
            rows << ["0020", "Interchange control reference",
                @control_reference]
        end
        # (0022) Recipient reference/password
        unless @recipient_reference == nil
            rows << ["0022", "Recipient reference/password", 
                @recipient_reference]
        end
        # (0025) Recipient reference/password qualifier
        unless @recipient_reference_qualifier == nil
            rows << coded_row("0025", "Recipient reference/password qualifier", 
                @recipient_reference_qualifier)
        end
        # (0026) Application reference
        unless @application_reference == nil
            rows << ["0026", "Application reference", @application_reference]
        end
        # (0029) Processing priority code
        unless @priority_code == nil
            rows << coded_row("0029", "Processing priority code", 
                @priority_code)
        end
        # (0031) Acknowledgement request
        unless @acknowledgement_request == nil
            rows << coded_row("0031", "Acknowledgement request", 
                @acknowledgement_request)
        end
        # (0032) Interchange agreement identifier
        unless @agreement_identifier == nil
            rows << ["0032", "Interchange agreement identifier", 
                @agreement_identifier]
        end
        # (0035) Test indicator
        unless @test_indicator == nil
            rows << coded_row("0035", "Test indicator", @test_indicator)
        end
        return rows
    end

    def debug
        super
        @syntax_identifier.tap { |v| puts "Syntax = " + v.value if v != nil }
        @syntax_version.tap { |v| puts "Version = " + v.value if v != nil }
        @code_list_version.tap { |v| puts "Code list = " + v if v != nil }
        @character_encoding.tap { |v| puts "Encoding = " + v.ref if v != nil }
        puts "\n"
    end
end