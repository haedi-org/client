# Example (D13A):
# UNB+UNOC:3+O0013000089TEVES+O0013009096BIP-XPRS-AI-P+170308:2018+000000003'

class UNB < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (0001) Syntax identifier
        @syntax_identifier = define([1, 0], "0001", "Syntax identifier", true)
        # (0002) Syntax version number
        @syntax_version = define([1, 1], "0002", "Syntax version number", true)
        # (0080) Service code list directory version number
        @code_list_version = define([1, 2], "0080", 
            "Service code list directory version number")
        # (0133) Character encoding, coded
        @character_encoding = define([1, 3], "0133", "Character encoding", true)
        # (0004) Interchange sender identification
        @sender_id = define([2, 0], "0004", "Interchange sender identification")
        # (0007) Identification code qualifier
        @sender_id_qualifier = define([2, 1], "0007", 
            "Identification code qualifier", true)
        # (0008) Interchange sender internal identification
        @sender_internal_id = define([2, 2], "0008", 
            "Interchange sender internal identification")
        # (0042) Interchange sender internal sub-identification
        @sender_internal_sub_id = define([2, 3], "0042", 
            "Interchange sender internal sub-identification")
        # (0010) Interchange recipient identification
        @recipient_id = define([3, 0], "0010", 
            "Interchange recipient identification")
        # (0007) Identification code qualifier
        @recipient_id_qualifier = define([3, 1], "0007", 
            "Identification code qualifier", true)
        # (0014) Interchange recipient internal identification
        @recipient_internal_id = define([3, 2], "0014", 
            "Interchange recipient internal identification")
        # (0046) Interchange recipient internal sub-identification
        @recipient_internal_sub_id = define([3, 3], "0046", 
            "Interchange recipient internal sub-identification")
        # (0017) Date of preparation - YYMMDD (101)
        @preparation_date = define([4, 0], "0017", "Date of preparation")
        # (0019) Time of preparation - HHMM (401)
        @preparation_time = define([4, 1], "0019", "Time of preparation")
        # (0020) Interchange control reference
        @control_reference = define([4, 2], "0020", 
            "Interchange control reference")
        # (0022) Recipient reference/password
        @recipient_reference = define([5, 0], "0022", 
            "Recipient reference/password")
        # (0025) Recipient reference/password qualifier
        @recipient_reference_qualifier = define([5, 1], "0025", 
            "Recipient reference/password qualifier", true)
        # (0026) Application reference
        @application_reference = define([5, 2], "0026", "Application reference")
        # (0029) Processing priority code
        @priority_code = define([5, 3], "0029", "Processing priority code", 
            true)
        # (0031) Acknowledgement request
        @acknowledgement_request = define([5, 4], "0031", 
            "Acknowledgement request", true)
        # (0032) Interchange agreement identifier
        @agreement_identifier = define([5, 5], "0032", 
            "Interchange agreement identifier")
        # (0035) Test indicator
        @test_indicator = define([5, 6], "0035", "Test indicator", true)
        # Push to elements
        push_elements([
            @syntax_identifier, @syntax_version, @code_list_version, 
            @character_encoding, @sender_id, @sender_id_qualifier, 
            @sender_internal_id, @sender_internal_sub_id, @recipient_id, 
            @recipient_id_qualifier, @recipient_internal_id, 
            @recipient_internal_sub_id, @preparation_date, @preparation_time, 
            @control_reference, @recipient_reference, 
            @recipient_reference_qualifier, @application_reference, 
            @priority_code, @acknowledgement_request, @agreement_identifier, 
            @test_indicator
        ])
    end

    def date
        return nil if @preparation_date == nil
        return case @preparation_date.value.length
            when 6; interpret_date(@preparation_date.value, "101")
            when 8; interpret_date(@preparation_date.value, "102")
            else; @preparation_date
        end
    end

    def time
        return nil if @preparation_time == nil
        return interpret_date(@preparation_time.value, "401")
    end

    def html
        coded = [[2, 1], [3, 1], [5, 1], [5, 4], [5, 6]]
        typed = [[2, 0], [2, 2], [2, 3], [3, 0], [3, 2], [3, 3], [4, 2], [5, 0]]
        mssge = [[1, 0], [1, 1], [1, 3], [4, 0], [4, 1]]
        super(coded, typed, mssge)
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