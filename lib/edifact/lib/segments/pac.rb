class PAC < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (7224) Number of packages
        @number_of_packages = val(1, 0)
        # (7075) Packaging level, coded
        @packaging_level = val(2, 0, "7075")
        # (7233) Packaging related information, coded
        @packaging_information = val(2, 1, "7233")
        # (7073) Packaging terms and conditions, coded
        @packaging_terms = val(2, 2, "7073")
        # (7065) Type of packages identification
        @type_of_packages_id = val(3, 0)
        # (1131) Code list qualifier
        @code_list = val(3, 1, "1131")
        # (3055) Code list responsible agency, coded
        @agency = val(3, 2, "3055")
        # (7064) Type of packages
        @type_of_packages = val(3, 3)
        
#        # (7077) Item description type, coded
#        @agency = var(3, 2, "3055")
#
#        # (7064) Type of packages
#        # (7143) Item number type, coded
#        @agency = var(3, 2, "3055")
#        # (7064) Type of packages
#        # (7143) Item number type, coded
#        @agency = var(3, 2, "3055")
        
        # (8395) Returnable package freight payment responsibility, coded
        # (8393) Returnable package load contents, coded
    end

    def html
        coded = []
        super(coded)
    end

    def table
        rows = [header_row]
        
        return rows
    end

    def debug
        super
        puts "\n"
    end
end