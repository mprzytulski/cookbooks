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

# Enable section
default['dbmail']['enable_imapd']  = 'no'
default['dbmail']['enable_lmtpd']  = 'no'
default['dbmail']['enable_pop3d']  = 'no'
default['dbmail']['enable_sieved'] = 'no'
default['dbmail']['conf_dir'] = '/usr/local/etc'

# DBMAIL
default['dbmail']['dbmail']['dburi'] = 'sqlite:///var/tmp/dbmail.db'
default['dbmail']['dbmail']['authdriver'] = '' # for the DB: sql, ldap
#default['dbmail']['dbmail']['max_db_connections'] = '10'
default['dbmail']['dbmail']['table_prefix'] = 'dbmail_'
default['dbmail']['dbmail']['encoding'] =             'utf8'
default['dbmail']['dbmail']['default_msg_encoding'] = 'utf8'
#default['dbmail']['dbmail']['postmaster'] = 'DBMAIL-MAILER'
default['dbmail']['dbmail']['sendmail'] = '/usr/sbin/sendmail'
default['dbmail']['dbmail']['file_logging_levels'] = '7'
default['dbmail']['dbmail']['syslog_logging_levels'] = '31'
default['dbmail']['dbmail']['query_time_info'] = '10'
default['dbmail']['dbmail']['query_time_notice'] = '20'
default['dbmail']['dbmail']['query_time_warning'] = '30'
default['dbmail']['dbmail']['query_timeout'] = '300'
default['dbmail']['dbmail']['effective_user']  = 'nobody'
default['dbmail']['dbmail']['effective_group'] = 'nogroup'
default['dbmail']['dbmail']['bindip'] = '0.0.0.0' # IPv4 only - all IP's
#default['dbmail']['dbmail']['bindip'] = '::' # IPv4 and IPv6 - all IP's (linux)
#default['dbmail']['dbmail']['bindip'] = '::' # IPv6 only - all IP's (BSD)
#default['dbmail']['dbmail']['bindip'] = '0.0.0.0,::' # IPv4 and IPv6 - all IP's (BSD)
#default['dbmail']['dbmail']['backlog'] = '128'
default['dbmail']['dbmail']['timeout'] = '300'
default['dbmail']['dbmail']['login_timeout'] = '60'
default['dbmail']['dbmail']['resolve_ip'] = 'no'
default['dbmail']['dbmail']['authlog']    = 'no'
default['dbmail']['dbmail']['logfile']       = '/var/log/dbmail.log'
default['dbmail']['dbmail']['errorlog']      = '/var/log/dbmail.err'
default['dbmail']['dbmail']['pid_directory'] = '/var/run/dbmail'
#default['dbmail']['dbmail']['library_directory'] = '/usr/lib/dbmail'
default['dbmail']['dbmail']['tls_cafile'] = ''
default['dbmail']['dbmail']['tls_cert'] = ''
default['dbmail']['dbmail']['tls_key'] = ''
default['dbmail']['dbmail']['tls_ciphers'] = ''
default['dbmail']['dbmail']['hash_algorithm'] = 'SHA1' # generating unique ids for message parts
#default['dbmail']['dbmail']['header_cache_readonly'] = 'yes' # prevent new unknown header-names from being cached

# LMTP
default['dbmail']['lmtp']['port'] = '24'
#default['dbmail']['lmtp']['tls_port'] = ''

# POP
default['dbmail']['pop']['port'] = '110'
#default['dbmail']['pop']['tls_port'] = '995'
#default['dbmail']['pop']['banner'] = 'DBMAIL pop3 server ready to rock'
default['dbmail']['pop']['pop_before_smtp'] = 'no'

# HTTP
default['dbmail']['http']['port'] = '41380'
default['dbmail']['http']['bindip'] = '127.0.0.1'
default['dbmail']['http']['admin'] = 'admin:secret'

# IMAP
#default['dbmail']['imap']['banner' = 'imap 4r1 server (dbmail 2.3.x)'
default['dbmail']['imap']['port'] = '143'
#default['dbmail']['imap']['tls_port'] = '993'
default['dbmail']['imap']['timeout'] = '4000'
default['dbmail']['imap']['imap_before_smtp'] = 'no'
#default['dbmail']['imap']['idle_timeout'] = '30'
#default['dbmail']['imap']['idle_interval'] = '10'
#default['dbmail']['imap']['capability'] = 'IMAP4 IMAP4rev1 AUTH=LOGIN ACL RIGHTS=texk NAMESPACE CHILDREN SORT QUOTA THREAD=ORDEREDSUBJECT UNSELECT IDLE'
#default['dbmail']['imap']['max_message_size'] = ''

# SIEVE
default['dbmail']['sieve']['port'] = '2000'
default['dbmail']['sieve']['tls_port'] = ''

# LDAP
default['dbmail']['ldap']['port'] = '389'
default['dbmail']['ldap']['version'] = '3'
default['dbmail']['ldap']['hostname'] = 'ldap'
default['dbmail']['ldap']['base_dn'] = 'ou=People,dc=mydomain,dc=com'
#default['dbmail']['ldap']['URI'] = 'ldap://127.0.0.1:389'
#default['dbmail']['ldap']['URI'] = 'ldapi://%2fvar%2frun%2fopenldap%2fldapi/'
default['dbmail']['ldap']['bind_dn'] = ''
default['dbmail']['ldap']['bind_pw'] = ''
default['dbmail']['ldap']['scope'] = 'SubTree'
default['dbmail']['ldap']['referrals'] = 'yes' # AD users may want to set this to 'no' if you are seeing 'Operations errors'
default['dbmail']['ldap']['user_objectclass'] = 'top,account,dbmailUser'
default['dbmail']['ldap']['forw_objectclass'] = 'top,account,dbmailForwardingAddress'
default['dbmail']['ldap']['cn_string'] = 'uid'
default['dbmail']['ldap']['field_passwd'] = 'userPassword'
default['dbmail']['ldap']['field_uid'] = 'uid'
default['dbmail']['ldap']['field_nid'] = 'uidNumber'
default['dbmail']['ldap']['min_nid'] = '10000'
default['dbmail']['ldap']['max_nid'] = '15000'
default['dbmail']['ldap']['field_cid'] = 'gidNumber'
default['dbmail']['ldap']['min_cid'] = '10000'
default['dbmail']['ldap']['max_cid'] = '15000'
default['dbmail']['ldap']['field_mail'] = 'mail' # a comma-separated list of attributes to match when searching for users or forwards that match a delivery address. A match on any of them is a hit.
default['dbmail']['ldap']['field_quota'] = 'mailQuota' # field that holds the mail-quota size for a user.
default['dbmail']['ldap']['field_fwdtarget'] = 'mailForwardingAddress' # field that holds the forwarding address.
#default['dbmail']['ldap']['query_string'] = '(mail=%s)' # override the query string used to search for users or forwards with a delivery address.

# DELIVERY
default['dbmail']['delivery']['SIEVE'] = 'yes'
default['dbmail']['delivery']['SUBADDRESS'] = 'yes'
default['dbmail']['delivery']['SIEVE_VACATION '] = 'yes'
default['dbmail']['delivery']['SIEVE_NOTIFY'] = 'yes'
default['dbmail']['delivery']['SIEVE_DEBUG'] = 'no'
default['dbmail']['delivery']['AUTO_NOTIFY'] = 'no'
default['dbmail']['delivery']['AUTO_REPLY'] = 'no'
#default['dbmail']['delivery']['AUTO_NOTIFY_SUBJECT'] = '' # Defaults to "NEW MAIL NOTIFICATION"
#default['dbmail']['delivery']['AUTO_NOTIFY_SENDER'] = '' # Defaults to POSTMASTER from the DBMAIL section.
default['dbmail']['delivery']['suppress_duplicates'] = 'no'
default['dbmail']['delivery']['quota_failure'] = 'hard' # Soft or hard bounce on over-quota delivery
