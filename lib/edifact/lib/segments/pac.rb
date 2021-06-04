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
        # (7077) Item description type, coded
        @item_description_type = val(4, 0, "7077")
        # (7064) Type of packages
        @type_of_packages_a = val(4, 1)
        # (7143) Item number type, coded
        @item_number_type_a = val(4, 2, "7143")
        # (7064) Type of packages
        @type_of_packages_b = val(4, 3)
        # (7143) Item number type, coded
        @item_number_type_b = val(4, 4, "7143")
        # (8395) Returnable package freight payment responsibility, coded
        @returnable_payment = val(5, 0, "8395")
        # (8393) Returnable package load contents, coded
        @returnable_contents = val(5, 1, "8393")
    end

    def html
        coded = [[2, 0], [2, 1], [2, 2], [4, 0], [4, 2], [4, 4], [5, 0], [5, 1]]
        typed = [[1, 0], [3, 0], [3, 3], [4, 1], [4, 3]]
        mssge = [[3, 1], [3, 2]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (7224) Number of packages
        unless @number_of_packages == nil
            rows << ["7224", "Number of packages", @number_of_packages]
        end
        # (7075) Packaging level, coded
        unless @packaging_level == nil
            rows << coded_row("7075", "Packaging level", @packaging_level)
        end
        # (7233) Packaging related information, coded
        unless @packaging_information == nil
            rows << coded_row("7233", "Packaging related information",
                @packaging_information)
        end
        # (7073) Packaging terms and conditions, coded
        unless @packaging_terms == nil
            rows << coded_row("7073", "Packaging terms and conditions", 
                @packaging_terms)
        end
        # (7065) Type of packages identification
        unless @type_of_packages_id == nil
            rows << ["7065", "Type of packages identification", 
                @type_of_packages_id]
        end
        # (1131) Code list qualifier
        unless @code_list == nil
            rows << coded_row("1131", "Code list qualifiers", @code_row)
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << coded_row("3065", "Code list responsible agency", @agency)
        end
        # (7064) Type of packages
        unless @type_of_packages == nil
            rows << ["7064", "Type of packages", @type_of_packages]
        end
        # (7077) Item description type, coded
        unless @item_description_type == nil
            rows << coded_row("7077", "Item description type", 
                @item_description_type)
        end
        # (7064) Type of packages
        unless @type_of_packages_a == nil
            rows << ["7064", "Type of packages", @type_of_packages_a]
        end
        # (7143) Item number type, coded
        unless @item_number_type_a == nil
            rows << coded_row("7143", "Item number type", @item_number_type_a)
        end
        # (7064) Type of packages
        unless @type_of_packages_b == nil
            rows << ["7064", "Type of packages", @type_of_packages_b]
        end
        # (7143) Item number type, coded
        unless @item_number_type_b == nil
            rows << coded_row("7143", "Item number type", @item_number_type_b)
        end
        # (8395) Returnable package freight payment responsibility, coded
        unless @returnable_payment == nil
            rows << coded_row("8395", 
                "Returnable package freight payment responsibility", 
                @returnable_payment)
        end
        # (8393) Returnable package load contents, coded
        unless @returnable_contents == nil
            rows << coded_row("8393", "Returnable package load contents", 
                @returnable_contents)
        end
        return rows
    end

    def debug
        super
        puts "\n"
    end
end