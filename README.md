# Cap::SSH

Initiate an SSH session from your Capistrano configured servers.

## Installation

Add this line to your application's Gemfile:

    gem 'cap-ssh', :require => false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cap-ssh

## Usage

Require the gem in your deployment script:

    # config/deploy.rb
    require 'cap-ssh'

To start an ssh session to your configured app server:

    cap ssh


To connect to a server in a different role:

    cap ssh ROLE=web

If you have multiple servers for a role you will be presented with a list of servers to choose from.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
