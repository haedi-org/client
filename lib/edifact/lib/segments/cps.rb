class CPS < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (7164) Hierarchical id. number
        @hierarchical_number = define([1, 0], "7164", "Hierarchical id. number")
        # (7166) Hierarchical parent id.
        @hierarchical_parent = define([2, 0], "7166", "Hierarchical parent id.")
        # (7075) Packaging level, coded
        @packaging_level = define([3, 0], "7075", "Packaging level", true)
        # Push to elements
        push_elements([
            @hierarchical_number, @hierarchical_parent, @packaging_level
        ])
    end

    def html
        coded = [[3, 0]]
        typed = []
        mssge = [[1, 0], [2, 0]]
        super(coded, typed, mssge)
    end

    def debug
        super
        @hierarchical_number.tap { |v| puts "Number = " + v if v != nil }
        @hierarchical_parent.tap { |v| puts "Parent = " + v if v != nil }
        @packaging_level.tap { |v| puts "Level = " + v.ref if v != nil }
        puts "\n"
    end
end