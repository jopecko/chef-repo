#
# Author:: InMobi
# Cookbook Name:: dsp
# Attributes:: apache2
#
# Copyright 2012, InMobi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# General settings
default['dsp']['apache2']['dir'] = "/var/www/html"
default['dsp']['apache2']['server_aliases'] = node['fqdn']

