#!/usr/bin/env ruby
require 'rmagick'
require 'optparse'

params = ARGV.getopts('','src:', 'alpha','x:0','y:0','text:Annotate here', 'src:', 'dst:', 'font:/usr/share/fonts/truetype/fonts-japanese-gothic.ttf', 'fill_color:#428b09','stroke_width:4','pointsize:30','stroke_color:white')
x = params["x"].to_i
y = params["y"].to_i
text = params["text"]
src=params["src"]
dst=params["dst"]
font=params["font"]

fill_color=params["fill_color"]
stroke_width=params["stroke_width"].to_i
pointsize=params["pointsize"].to_i
stroke_color=params["stroke_color"]

if src==nil or src.empty? or dst==nil or dst.empty? then
  p "src and dst must be filename"
  p params
  exit 1
end


img = Magick::ImageList.new(src)
dup_img = img.dup

draw = Magick::Draw.new

draw.annotate(dup_img, 0, 0, x, y, text) do
  self.font      = font
  self.fill      = fill_color
  self.stroke    = stroke_color
  self.stroke_width    = stroke_width
  self.pointsize = pointsize
  self.gravity   = Magick::NorthWestGravity
end

draw.annotate(dup_img, 0, 0, x, y, text) do
  self.font      = font
  self.fill      = fill_color
  self.stroke    = 'transparent'
  self.pointsize = pointsize
  self.gravity   = Magick::NorthWestGravity
end

dup_img.write(dst)
