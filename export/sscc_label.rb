require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'prawn'
require 'prawn/measurement_extensions'

require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/prawn_outputter'

class SSCC_Label < Prawn::Document
    def initialize(sscc = "")
        @sscc = sscc
        super(:page_size => "A5", :page_layout => :portrait)
        self.text(@sscc)
        self.barcode
    end

    def barcode
        barcode = Barby::Code128.new(Barby::Code128::FNC1 + @sscc)
        barcode.annotate_pdf(self, :unbleed => 0.25, :xdim => 1.5)
    end

    def save_to_file(path)
        self.render_file(path)
    end
end

label = SSCC_Label.new("00008012349999999997")
label.save_to_file("./test.pdf")