require "cap-ssh/version"


Capistrano::Configuration.instance(true).load do

  namespace :ssh do
    
    desc <<-DESC
      Start an ssh session to your servers.\
      By default will choose a server from your 'app' role. Use the 'ROLE'\
      enivornment variable to choose a different role. If more than one\
      server exists for a given role then you will be prompted to choose\
      the server from a list.
    DESC
    task :default do 
      start
    end

    task :start do
      role = (ENV['ROLE'] || :app).to_sym
      servers = roles[role].servers

      # pick server from a list
      if servers.size > 1
        puts "Pick a server to connect to:"
        servers.each_with_index do |server, i|
          puts "\t#{i + 1}: #{server.host}"
        end
        default = 1
        selected = Capistrano::CLI.ui.ask("Enter number (#{default})")
        selected = default if selected.empty?
        server = servers[selected.to_i - 1]
      else
        server = servers.first
      end

      logger.info "Deploy Directory: #{deploy_to}"

      Capistrano::SSH.connection_strategy(server, self) do |host, user, connection_options|
        start_session(host, user, connection_options)
      end
    end



    def start_session(*args)
      Kernel.exec connect_command(*args)
    end

    def connect_command(host, user, connection_options)
      [
        'ssh ',
        user ? "#{user}@" : nil,
        host,
        connection_options[:port] ? ":#{connection_options[:port]}" : nil,
        connection_options[:forward_agent] ? " -a" : nil
      ].reject(&:nil?).join('')
    end
    
  end
end