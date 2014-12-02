locapi
======

Example of using advanced data model structure and private/public api interface

TargetGroup - tree structure

Location associated to LocationGroup 
Location also associated to country

Different pricing model based on Strategy pattern applied by Factory pattern

Tests
=====
rspec spec

Run
===
rails s

GET Routes
==========
/public/v1/locations/uk
/public/v1/locations/sk
/public/v1/locations/jp

/private/v1/locations/uk?token=abcd

/public/v1/target_groups/uk
/public/v1/target_groups/uk?token=abcd

POST
====
accepts all parameters and returns price for each
 
