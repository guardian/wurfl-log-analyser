require 'wurfl-lite'
require 'digest/md5'

class Wurfl

    attr_accessor :dictionary, :cache, :phone, :key

    def initialize(db='wurfl/wurfl-2.3.1.xml.gz')
        @dictionary = WURFL.new(db)
        @cache = {}
    end

    def lookup(ua_string)
        
        @key = Digest::MD5.hexdigest ua_string
        
        if @cache.has_key? @key
            return @cache[key]
        end

        if ua_string && ( phone = @dictionary[ ua_string ])
            @cache[@key] = {
                    :device_os => phone.device_os,
                    :device_os_version => phone.device_os_version,
                    :brand_name => phone.brand_name,
                    :model_name => phone.model_name,
                    :mobile_browser => phone.mobile_browser,
                    :mobile_browser_version => phone.mobile_browser_version,
                }
            return @cache[@key]
        end
    end

end

