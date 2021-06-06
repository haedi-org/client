class PAC < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (7224) Number of packages
        @number_of_packages = define([1, 0], "7224", "Number of packages")
        # (7075) Packaging level, coded
        @packaging_level = define([2, 0], "7075", "Packaging level", true)
        # (7233) Packaging related information, coded
        @packaging_information = define([2, 1], "7233", 
            "Packaging related information", true)
        # (7073) Packaging terms and conditions, coded
        @packaging_terms = define([2, 2], "7073", 
            "Packaging terms and conditions", true)
        # (7065) Type of packages identification
        @type_of_packages_id = define([3, 0], "7065", 
            "Type of packages identification")
        # (1131) Code list qualifier
        @code_list = define([3, 1], "1131", "Code list qualifier", true)
        # (3055) Code list responsible agency, coded
        @agency = define([3, 2], "3055", "Code list responsible agency", true)
        # (7064) Type of packages
        @type_of_packages = define([3, 3], "7064", "Type of packages")
        # (7077) Item description type, coded
        @item_description_type = define([4, 0], "7077", "Item description type", 
            true)
        # (7064) Type of packages
        @type_of_packages_a = define([4, 1], "7064", "Type of packages")
        # (7143) Item number type, coded
        @item_number_type_a = define([4, 2], "7143", "Item number type", true)
        # (7064) Type of packages
        @type_of_packages_b = define([4, 3], "7064", "Type of packages")
        # (7143) Item number type, coded
        @item_number_type_b = define([4, 4], "7143", "Item number type", true)
        # (8395) Returnable package freight payment responsibility, coded
        @returnable_payment = define([5, 0], "8395", 
            "Returnable package freight payment responsibility", true)
        # (8393) Returnable package load contents, coded
        @returnable_contents = define([5, 1], "8393", 
            "Returnable package load contents", true)
        # Push to elements
        push_elements([
            @number_of_packages, @packaging_level, @packaging_information,
            @packaging_terms, @type_of_packages_id, @code_list, @agency,
            @type_of_packages, @item_description_type, @type_of_packages_a,
            @item_number_type_a, @type_of_packages_b, @item_number_type_b,
            @returnable_payment, @returnable_contents
        ])
    end

    def html
        coded = [[2, 0], [2, 1], [2, 2], [4, 0], [4, 2], [4, 4], [5, 0], [5, 1]]
        typed = [[1, 0], [3, 0], [3, 3], [4, 1], [4, 3]]
        mssge = [[3, 1], [3, 2]]
        super(coded, typed, mssge)
    end

    def debug
        super
        puts "\n"
    end
end