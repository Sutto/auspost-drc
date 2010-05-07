# auspost-drc #

A rubygem for accessing the Australia Post Delivery Rate Calculator.

Please note that in order to use this service, you must agree to the [Australia Post DRC terms and conditions](http://www.edeliver.com.au/Templates/ifs/IFS_DRC_Terms.htm) - I take no responsibility for
how you use this library, it is simply a wrapper around the DRC api.

## Usage ##

    require 'aus_post/drc'
    
    result = AusPost::DRC.calculate(:length => 100, :height => 100, :width => 100,
      :destination => 'XXXX', :pickup => 'YYYY', :country => 'AU', :service_type => :express,
      :weight => 1, :quantity => 1)
      
The following are optional with the following defaults:

* `:quantity` - defaults to `1`
* `:service_type` - defaults to `:standard`
* `:country` - defaults to `'AU'`. As a 2 character country code

The calculator has the following methods:

- `result.charge` - charge as a float, nil on error
- `result.days` - days as integer, nil on error
- `result.charge_as_string` - charge as string, nil on error

With exception-throwing variants:

- `result.charge!` - charge as a float, throwing an error otherwise.
- `result.days!` - days as integer, throwing an error otherwise.
- `result.charge_as_string!` - charge as string, throwing an error otherwise.

## Note on Patches/Pull Requests ##
 
1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
5. Send me a pull request. Bonus points for topic branches.

## Copyright ##

Copyright (c) 2010 Darcy Laycock. See LICENSE for details.

Australia Post and other assorted trademarks are copyright Australia Post.
