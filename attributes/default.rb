default['yum']['main']['obsoletes'] = false
default[:mongodb][:package_version] = '2.4.9-mongodb_1'
default[:mongodb][:cluster_name] = 'vzdev'
default['mongodb']['config']['fork'] = 'true'
default['mongodb']['config']['logpath'] = '/data/mongos/log/mongos.log'
default[:mongodb][:instance_name] = 'mongos'
default['mongodb']['is_mongos'] = true

# set for mongo gem - new version breaks setting replica set and other things
# that require the use of a mongo connection.
default['mongodb']['ruby_gems'] = {
  :mongo => '1.12.0',
  :bson_ext => '1.12.0'
}

# added for testing shard collection creation.
default['mongodb']['sharded_collections'] = {
  'CB.coauthor_invite' => 'siteId',
  'CB.email' => '_id',
  'CB.feed_profile' => 'uid',
  'CB.feed_site' => 'sid',
  'CB.file' => '_id',
  'CB.guestbook' => 'siteId',
  'CB.journal' => 'siteId',
  'CB.link' => 'siteId',
  'CB.message' => 'userId',
  'CB.notification' => 'uid',
  'CB.photo' => 'siteId',
  'CB.profile' => '_id',
  'CB.site' => '_id',
  'CB.site_profile' => 'siteId',
  'CB.task' => 'siteId',
  'CB.test_user' => '_id',
  'CB.tribute' => 'siteId',
  'CB.visitor' => '_id'
}
