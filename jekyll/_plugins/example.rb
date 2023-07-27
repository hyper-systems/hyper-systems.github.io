module Jekyll

	class DataPage < Page
		def initialize(site, base, dir, name)
			@site = site
			@base = base
			@dir = dir
			@name = name
			self.process(@name)
			self.data ||= {} 
			self.data['layout'] = 'default'
			self.data['title'] = data
		end
	end
	
	class CategoryPageGenerator < Generator
		def generate(site)
			datas = site.data['devices']
			datas.each do |data|
				name = "#{data["vendor"].downcase.tr(" ","-") + "_" + data["product_code"].downcase}.html"
				page = Jekyll::DataPage.new(site, site.source, "/integrations", name)
        		page.data = data
				page.data['layout'] = 'device'
				site.pages << page
			end
		end
	end
end