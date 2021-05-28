require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require 'csv'
require 'json'
require 'time'

require './lib/test.rb'
require './lib/html.rb'
require './lib/reference.rb'
require './lib/version.rb'
require './lib/punctuation.rb'
require './lib/line.rb'
require './lib/date.rb'
require './lib/document.rb'

require './segments/una.rb'
require './segments/unh.rb'
require './segments/unb.rb'
require './segments/unt.rb'
require './segments/unz.rb'
require './segments/bgm.rb'
require './segments/ali.rb'
require './segments/dtm.rb'
require './segments/ftx.rb'
require './segments/rff.rb'
require './segments/nad.rb'
require './segments/tax.rb'
require './segments/lin.rb'
require './segments/pac.rb'
require './segments/qty.rb'
require './segments/imd.rb'
require './segments/pia.rb'
require './segments/mea.rb'
require './segments/pri.rb'
require './segments/gin.rb'
require './segments/cps.rb'
require './segments/pci.rb'
require './segments/loc.rb'
require './segments/inv.rb'

require './lib/run.rb'