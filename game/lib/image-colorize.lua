
function newPaddedImageData(filename)
	local source = love.image.newImageData(filename)
	local w, h = source:getWidth(), source:getHeight()
	local newData = {}
	newData.w, newData.h = w, h
	
	-- Find closest power-of-two.
	local wp = math.pow(2, math.ceil(math.log(w)/math.log(2)))
	local hp = math.pow(2, math.ceil(math.log(h)/math.log(2)))
	
	-- Only pad if needed:
	if wp ~= w or hp ~= h then
		local padded = love.image.newImageData(wp, hp)
		padded:paste(source, 0, 0)
		newData.data = padded
		return newData
	end
	
	newData.data = source
	return newData
end

function newPaddedImage(imageData)
	local newImageData = {}
	newImageData.h = imageData.h
	newImageData.w = imageData.w
	newImageData.img = love.graphics.newImage(imageData.data)
	return newImageData
end

function imageBW(image)
	local newImage = {}
	newImage.h = image.h
	newImage.w = image.w
	newImage.data = love.image.newImageData(image.data:getWidth(), image.data:getHeight())
	local r, g, b, a, avg
	for i=0, image.w-1, 1 do
		for j=0, image.h-1, 1 do
			r, g, b ,a = image.data:getPixel(i, j)
			avg = (r+g+b)/3
			newImage.data:setPixel(i, j, avg, avg, avg, a)
		end
	end
	return newImage
end

function imageBrightness(image, brightness)
	local newImage = {}
	newImage.h = image.h
	newImage.w = image.w
	newImage.data = love.image.newImageData(image.data:getWidth(), image.data:getHeight())
	local r, g, b, a
	for i=0, image.w-1, 1 do
		for j=0, image.h-1, 1 do
			r, g, b ,a = image.data:getPixel(i, j)
			r = math.max(0, math.min(255, r+brightness))
			g = math.max(0, math.min(255, g+brightness))
			b = math.max(0, math.min(255, b+brightness))
			newImage.data:setPixel(i, j, r, g, b, a)
		end
	end
	return newImage
end

function imageSaturate(image, saturation)
	local newImage = {}
	newImage.h = image.h
	newImage.w = image.w
	newImage.data = love.image.newImageData(image.data:getWidth(), image.data:getHeight())
	local r, g, b, a, avg
	for i=0, image.w-1, 1 do
		for j=0, image.h-1, 1 do
			r, g, b ,a = image.data:getPixel(i, j)
			avg = (r+g+b)/3
			r = math.max(0, math.min(255, avg+(r-126)*saturation))
			g = math.max(0, math.min(255, avg+(g-126)*saturation))
			b = math.max(0, math.min(255, avg+(b-126)*saturation))
			newImage.data:setPixel(i, j, r, g, b, a)
		end
	end
	return newImage
end

function imageShift(image)
	local newImage = {}
	newImage.h = image.h
	newImage.w = image.w
	newImage.data = love.image.newImageData(image.data:getWidth(), image.data:getHeight())
	local r, g, b, a
	for i=0, image.w-1, 1 do
		for j=0, image.h-1, 1 do
			r, g, b ,a = image.data:getPixel(i, j)
			newImage.data:setPixel(i, j, g, b, r, a)
		end
	end
	return newImage
end

function imageInvert(image)
	local newImage = {}
	newImage.h = image.h
	newImage.w = image.w
	newImage.data = love.image.newImageData(image.data:getWidth(), image.data:getHeight())
	local r, g, b, a
	for i=0, image.w-1, 1 do
		for j=0, image.h-1, 1 do
			r, g, b ,a = image.data:getPixel(i, j)
			newImage.data:setPixel(i, j, 255-r, 255-g, 255-b, a)
		end
	end
	return newImage
end
