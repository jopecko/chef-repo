#
# Cookbook Name:: inmobi-as
# Recipe:: ffmpeg
#
# Copyright 2012, InMobi
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ffmpeg"

# ln -s usr/local/bin/ffmpeg /usr/bin/ffmpeg
link "/usr/bin/ffmpeg" do
  to "#{node[:ffmpeg][:prefix]}/bin/ffmpeg"
end

