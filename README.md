Spree FlexiRate Extended
========================
Improves the Spree flexirate shipping calculation by providing more control over what existing flexirate offers. This gem will become obsolete: when this code (probably improved) get merged into spree or once spree has a better calculator.

The shipping rates can be added in any order and the calculator will do the sorting. The example below shows how the shipping rates are calculated.

      1 -- 2.00 (for items 1 & 2: it'll be $2.00)
      3 -- 4.00 (for 3,4,5: shipping will be $4.00)
      6 -- 8.00 (6 and above 8.00)

Installation
------------

Add this to your Gemfile:

      gem 'spree_flexirate_extended', :git => 'git://github.com/buddhi-desilva/spree_flexirate_extended.git'

Next run:

    bundle install
    rails g spree_flexirate_extended:install


To do / Planned
---------------
* Adding/Deleting shipping rate fields dynamically as the user keep entering more shipping rates (ranges)
* Validations for data types
* Register the FlexiRate-Extended as a separate calculator than replacing the existing flexirate calculator
* Maximum number of items? Not sure if it's necessary, yet will consider adding them
* Refactoring & cleaning up 
* Tests


Contribution
------------
Please feel free to fork, improve and send pull requests
