local HTTPService = game:GetService("HttpService")

local Reqlink = {}

Reqlink.convertUrl = function(url)
	local newUrl = tostring(url)
	
	if newUrl == nil then
		print("Reqlink: URL conversion failed. Please ensure you have placed in your discord webhook url.")
	else
		if string.find(newUrl, "discord.com") then
			return string.gsub(newUrl, "discord.com","hooks.hyra.io")
		else
			print("Reqlink: Invalid webhook url.")
		end
	end
end

Reqlink.sendMessage = function(url, data)
	local success, response = pcall(function()
		local newdata = HTTPService:JSONEncode(data)
		HTTPService:PostAsync(url, newdata)
	end)
	
	if success then
		print("Reqlink: Message successfully sent.")
	else
		print("Reqlink: Error has been detected: "..response)
	end
end

return Reqlink
