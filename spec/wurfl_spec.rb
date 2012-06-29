require 'lib/wurfl.rb'

describe Wurfl do
    
    before(:each) do ||
        @wurfl = Wurfl.new('spec/mock-wurfl-2.3.1.xml')
    end

    it "Extract a phones details from a user agent string" do
        device = @wurfl.lookup "HTCGemini/140239 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)"
        device[:model_name].should == 'Gemini'
        device[:brand_name].should == 'HTC'
    end
    
    it "Cache a user agent to speed up to repeat lookups" do
        @wurfl.cache.has_key?(@wurfl.key).should be false
        @wurfl.lookup "HTCGemini/140239 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)"
        @wurfl.cache.has_key?(@wurfl.key).should be true
    end

end
