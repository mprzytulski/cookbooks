#
# Cookbook Name:: dbmail
# Recipe:: default
#
# Author:: John Ko <git@johnko.ca>
# Copyright 2014, John Ko
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

package 'dbmail'

directory "#{node['dbmail']['dbmail']['pid_directory']}" do
  owner "#{node['dbmail']['dbmail']['effective_user']}"
  group "#{node['dbmail']['dbmail']['effective_group']}"
  mode '0700'
end

template "#{node['dbmail']['conf_dir']}/dbmail.conf" do
  source "dbmail.conf.erb"
  owner 'root'
  group 0
  mode '0600'
  if node['dbmail']['enable_imapd'] == 'yes'
    notifies :restart, 'svc[dbmail-imapd]'
  end
  if node['dbmail']['enable_lmtpd'] == 'yes'
    notifies :restart, 'svc[dbmail-lmtpd]'
  end
  if node['dbmail']['enable_pop3d'] == 'yes'
    notifies :restart, 'svc[dbmail-pop3d]'
  end
  if node['dbmail']['enable_sieved'] == 'yes'
    notifies :restart, 'svc[dbmail-timsieved]'
  end
end

if node['dbmail']['enable_imapd'] == 'yes'
  svc 'dbmail-imapd' do
    supports status: true, restart: true
    action [ :enable, :start ]
  end
end

if node['dbmail']['enable_lmtpd'] == 'yes'
  svc 'dbmail-lmtpd' do
    supports status: true, restart: true
    action [ :enable, :start ]
  end
end

  if node['dbmail']['enable_pop3d'] == 'yes'
  svc 'dbmail-pop3d' do
    supports status: true, restart: true
    action [ :enable, :start ]
  end
end

if node['dbmail']['enable_sieved'] == 'yes'
  svc 'dbmail-timsieved' do
    supports status: true, restart: true
    action [ :enable, :start ]
  end
end
