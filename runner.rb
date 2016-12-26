$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'nu_pack'

# Should be 1591.58
p NuPack::Calculator.new(price: 1299.99, people: 3, material: 'food').estimate

