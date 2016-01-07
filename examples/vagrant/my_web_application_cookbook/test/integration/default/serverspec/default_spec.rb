# Copyright 2015, Ben Vidulich
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

require 'spec_helper'

describe 'my_web_application::default' do
  describe iis_website('My Web Site') do
    it { should exist }
    it { should be_enabled }
    it { should be_running }
    it { should be_in_app_pool('DefaultAppPool') }
  end
end