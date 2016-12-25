# NuPack

Calculates estimated price given base price, type of material and number of people who worked on the job.

# Dependencies

Ruby 2.3

# Usage

First add the `lib/` of the project to your `$LOAD_PATH`. (This should be handled by rubygems/bundler)

Now you can do:

```
require 'nu_pack'
calculator = NuPack::Calculator.new(price: 1299.99, people: 3, material: 'food')
calculator.estimate #=> 1591.58
```

You can use your own flat markup. (Default is 5%)

```
calculator = NuPack::Calculator.new(price: 1299.99, flat_markup: 0.07, material: 'food')
calculator.estimater
```

You can use your own material markup calculator:

```
calculator = NuPack::Calculator.new(price: 1299.99, people: 3, material: 'food', material_markup_calculator: my_material_markup_calculator)
calculator.estimate
```

`my_material_markup_calculator` is an object that responds to `.markup_for(material)` and returns percentage fraction markup for the `material` in question.

# Tests

Run whole test suite with `ruby test/suite.rb`.

Run individual tests by running `*_test.rb` files under `test/`
