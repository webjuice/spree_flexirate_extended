Spree FlexiRate Extended
========================
Improves the Spree flexirate shipping calculation by providing more ranges than what the current flexirate offers. This gem will be obsolete once, either this code (probably improved) get merged into spree or once spree has a better calculator.


Installation
------------

Add this to your Gemfile:

      gem 'spree_flexirate_extended', :git => 'git://github.com/buddhi-desilva/spree_flexirate_extended.git'

Next run:

    bundle install
    rails g spree_flexirate_extended:install


To do / Planned
---------------
* Add JS based fields dynamically as the user keep entering more ranges
* Register the FlexiRate-Extended as a separate calculator than replacing the existing flexirate calculator
* Maximum number of items? Not sure if it's necessary, yet will consider adding them
* Refactoring & cleaning up 
* Tests


Contribution
------------
Please feel free to fork, improve and send pull requests
