class UNH < Line
    attr_reader :message_reference
    attr_reader :message_type
    attr_reader :message_version
    attr_reader :controlling_agency
    attr_reader :association_code

    def initialize(data, version, chars)
        super(data, version, chars)
        @message_version    = format_version # 0052
        # (0062) Message reference number
        @message_reference  = val(1, 0)
        # (0065) Message type
        @message_type       = ref("0065", val(2, 0), @message_version.ref)
        # (0051) Controlling agency, coded
        @controlling_agency = ref("0051", val(2, 3), @message_version.ref)
        # (0057) Association assigned code
        @association_code   = ref("0057", val(2, 4), @message_version.ref)
    end

    def html
        coded = []
        typed = [[1, 0]]
        mssge = [[2, 0], [2, 1], [2, 2], [2, 3], [2, 4]]
        super(coded, typed, mssge)
    end
    
    def format_version
        # (0052) Message version number
        @message_version_number = val(2, 1)
        # (0054) Message release number
        @message_release_number = val(2, 2)
        # Return version struct
        return Version.new(
            @message_version_number, 
            @message_release_number, 
            @message_version_number +
            @message_release_number
        )
    end

    def table
        rows = [header_row]
        # (0052) Message version number
        unless @message_reference == nil
            rows << ["0052", "Message version number", @message_version_number]
        end
        # (0054) Message release number
        unless @message_reference == nil
            rows << ["0054", "Message release number", @message_release_number]
        end
        # (0062) Message reference number
        unless @message_reference == nil
            rows << ["0062", "Message reference number", @message_reference]
        end
        # (0065) Message type
        unless @message_type == nil
            rows << coded_row("0065", "Message type", @message_type)
        end
        # (0051) Controlling agency, coded
        unless @controlling_agency == nil
            rows << coded_row("0051", "Controlling agency", @controlling_agency)
        end
        # (0057) Association assigned code
        unless @association_code == nil
            rows << coded_row("0057", "Association assigned code", 
                @association_code
            )
        end
        return rows
    end

    def debug
        super
        puts "Message type = " + @message_type.ref
        puts "Message description = " + @message_type.desc
        puts "Message version = " + @message_version.ref
        puts "\n"
    end
end