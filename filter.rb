
require 'rubygems'

require 'lib/log.rb'
require 'lib/wurfl.rb'

wurfl = Wurfl.new()

STDIN.read.split("\n").each do |entry|
    
    log = Log.new().parse entry

    if phone = wurfl.lookup( log.ua )
        puts [log.ip, log.status, log.method, log.ua, log.resource,
                phone[:device_os_version], phone[:device_os],
                phone[:brand_name], phone[:model_name],
                phone[:mobile_browser], phone[:mobile_browser_version]
        ].join("\t")
    else
        puts ['unknown', nil, nil, log.ua].join("\t")
    end

end
