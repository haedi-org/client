class CPS < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (7164) Hierarchical id. number
        @hierarchical_number = val(1, 0)
        # (7166) Hierarchical parent id.
        @hierarchical_parent = val(2, 0)
        # (7075) Packaging level, coded
        @packaging_level     = val(3, 0, "7075")
    end

    def html
        coded = [[3, 0]]
        typed = []
        mssge = [[1, 0], [2, 0]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (7164) Hierarchical id. number
        unless @hierarchical_number == nil
            rows << ["7164", "Hierarchical id. number", @hierarchical_number]
        end
        # (7166) Hierarchical parent id.
        unless @hierarchical_parent == nil
            rows << ["7166", "Hierarchical parent id.", @hierarchical_parent]
        end
        # (7075) Packaging level, coded
        unless @packaging_level == nil
            rows << coded_row("7075", "Packaging level", @packaging_level)
        end
        return rows
    end

    def debug
        super
        @hierarchical_number.tap { |v| puts "Number = " + v if v != nil }
        @hierarchical_parent.tap { |v| puts "Parent = " + v if v != nil }
        @packaging_level.tap { |v| puts "Level = " + v.ref if v != nil }
        puts "\n"
    end
end