# Installation

```ruby

gem 'quandl_logger'

```




# Configuration


## Logger

```ruby

require 'quandl/logger'

file = ::Logger.new('/path/to/development.log')
Quandl::Logger.use(file)


```