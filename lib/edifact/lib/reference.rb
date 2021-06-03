EDIFACT_DOCUMENTS_PATH = "./codes/edifact_documents.csv"
EDIFACT_SEGMENTS_PATH  = "./codes/edifact_segments.csv"

Reference = Struct.new(
    :value,
    :ref,
    :desc,
    :code
)

$code_lists = {}
Dir["./codes/*.json"].each do |path|
    file = File.open(path)
    version = File.basename(path, ".json")
    $code_lists[version] = JSON.load(file)
    file.close
end

def lookup_tag(code_list, tag)
    return nil if tag == ""
    ref, desc = "", ""
    if $code_lists.key?(code_list) && $code_lists[code_list].key?(tag)
        ref  = $code_lists[code_list][tag]["title"]
        desc = $code_lists[code_list][tag]["description"]
    else
        return nil
    end
    return Reference.new(tag, ref, desc, tag)
end

def lookup_reference(code_list, code, value)
    return nil if value == ""
    ref, desc = "", ""
    csv_path = "./codes/#{code_list}/#{code}.csv"
    unless File.file?(csv_path)
        exists = (
            $code_lists.key?(code_list) &&
            $code_lists[code_list].key?(code) &&
            $code_lists[code_list][code].key?(value)
        )
        if exists
            ref  = $code_lists[code_list][code][value]["title"]
            desc = $code_lists[code_list][code][value]["description"]
        end
    else
        line = csv_reference(csv_path, value)
        unless line == []
            ref  = line[1]
            desc = line[2]
        end
    end
    return Reference.new(value, ref, desc, code)
end

def csv_reference(path, value)
    if File.file?(path)
        CSV.foreach(path, 'rb:utf-8') do |line|
            return line if (line[0] == value)
        end
    end
    return []
end

def read_document(path)
    lines = File.readlines(path, :encoding => 'utf-8')
    return lines
    #return lines.join.gsub("\n", "").gsub("\r", "")
end

def strip_csv_column(path, column)
    lines = File.readlines(path, :encoding => 'utf-8')
    return lines.map! { |line| line.split(",")[column] }
end

class Object
    def is_number?
        to_f.to_s == to_s || to_i.to_s == to_s
    end
end