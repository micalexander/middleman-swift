require 'middleman-core'

require 'middleman-swift/version'
require 'middleman-swift/template'

Middleman::Templates.register :swift, Middleman::Swift::Template
