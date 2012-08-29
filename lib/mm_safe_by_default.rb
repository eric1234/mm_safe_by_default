require 'mongo_mapper'
require 'mongo_mapper/plugins/safe_by_default'

MongoMapper::Document.plugin MongoMapper::Plugins::SafeByDefault
MongoMapper::EmbeddedDocument.plugin MongoMapper::Plugins::SafeByDefault