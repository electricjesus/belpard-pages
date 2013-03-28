#!/usr/bin/ruby

require 'nokogiri'
require 'open-uri'

def recursiveProcess (k, build = "xpaths")
	out = ""
	k.each do |i|
		out << "<reference name=\"#{i['reference']}\">"		
		out << recursiveProcess(i["children"]) unless i["children"].nil?
		out << "</reference>"
		out << "\n"
	end
	out
end

Dir.glob("./*.html") do |fname| # all of these files are assumed 1column.phtml
	# Open file
	doc = Nokogiri::HTML(open(fname))
	puts "Processing #{fname}.."

	# parentHandle = (find CUSTOM_HANDLE comment in file, if none revert to default)

	buildingBlocks = [ #blank template
		{ "reference" => "root", "template" => "page/1column.phtml", "children" => [
				{ "reference" => "head", "template" => "page/html/head.phtml", "children" =>[] },
				{ "reference" => "header", "template" => "page/html/header.phtml", "children" =>[] }, 
				{ "reference" => "global_notices", "template" => "page/html/notices.phtml", "children" =>[] },
				{ "reference" => "global_messages", "template" => nil, "children" =>[] },
				{ "reference" => "breadcrumbs", "template" => "page/html/breadcrumbs.phtml", "children" =>[] },
				{ "reference" => "content", "template" => "", "children" =>[
				] },
				{ "reference" => "footer", "template" => "page/html/footer.phtml", "children" =>[] },
				{ "reference" => "before_body_end", "template" => "page/html/before_body_end.phtml", "children" =>[] },
			] 
		}
		
	]

	# on images, insert path php
	

	#puts buildingBlocks.inspect

	layout = recursiveProcess(buildingBlocks)
	puts layout

	#build

	#doc.xpath('//head').each do |link|
	#	puts link
	#end
	#doc.xpath('//script').each do |link|
	#	puts link.attribute('src')
	#end
	
	
end





