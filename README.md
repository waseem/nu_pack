# NuPack

Calculates estimated price given base price, type of material and number of people who worked on the job.

# Dependencies

Ruby 2.3

# Usage

First add the `lib/` of the project to your `$LOAD_PATH`. (This should be handled by rubygems/bundler)

Now you can do:

```
require 'nu_pack'
calculator = NuPack::Calculator.new(1299.99, 3, 'food') # NuPack::Calculator.new(base_price, people_for_job, material)
calculator.estimate #=> 1591.58
```

You can use your own material markup calculator:

```
calculator = NuPack::Calculator.new(1299.99, 3, 'food', my_material_markup_calculator)
calculator.estimate
```

`my_material_markup_calculator` is an object that responds to `.markup_for(material)` and returns percentage fraction markup for the `material` in question.

# Tests

Run whole test suite with `ruby test/suite.rb`.

Run individual tests by running `*_test.rb` files under `test/`
