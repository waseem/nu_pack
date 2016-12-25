# NuPack

Calculates estimated price given base price, type of material and number of people who worked on the job.

# Dependencies

Ruby 2.3

# Usage

First add the library to your `$LOAD_PATH`. (This should be handled by rubygems/bundler)

Now you can do:

```
require 'nu_pack'
calculator = NuPack::Calculator.new(1299.99, 3, 'food') # NuPack::Calculator.new(base_price, people_for_job, material)
calculator.estimate #=> 1591.58
```

# Tests

`ruby test/nu_pack_test.rb`
