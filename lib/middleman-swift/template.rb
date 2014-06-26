require 'middleman-core/templates'

module Middleman
  module Swift

    class Template < Middleman::Templates::Base
      class_option 'css_dir',
        default: 'css',
        desc: 'The path to the css files'
      class_option 'js_dir',
        default: 'js',
        desc: 'The path to the javascript files'
      class_option 'images_dir',
        default: 'img',
        desc: 'The path to the image files'

      def self.source_root
        File.join(File.dirname(__FILE__), 'template')
      end

      def build_scaffold
        template 'shared/Gemfile.tt', File.join(location, 'Gemfile')
        template 'shared/config.tt', File.join(location, 'config.rb')
        copy_file 'source/index.html.slim', File.join(location, 'source/index.html.slim')
        copy_file 'source/layouts/layout.slim', File.join(location, 'source/layouts/layout.slim')
        copy_file 'source/404.html.slim', File.join(location, 'source/404.html.slim')
        copy_file 'source/crossdomain.xml', File.join(location, 'source/crossdomain.xml')
        copy_file 'source/humans.txt', File.join(location, 'source/humans.txt')
        copy_file 'source/robots.txt', File.join(location, 'source/robots.txt')
        puts  "css dir #{options[:css_dir]}"
        puts  "location #{location}"
        empty_directory File.join(location, 'source', options[:css_dir])
        copy_file 'source/css/screen.css.scss', File.join(location, 'source', options[:css_dir], 'screen.css.scss')
        copy_file 'source/css/framework/_swift-framework.scss', File.join(location, 'source', options[:css_dir], 'framework/_swift-framework.scss')
        copy_file 'source/css/framework/_reset.scss', File.join(location, 'source', options[:css_dir], 'framework/_reset.scss')
        copy_file 'source/css/framework/_typography.scss', File.join(location, 'source', options[:css_dir], 'framework/_typography.scss')
        copy_file 'source/css/modules/.gitkeep', File.join(location, 'source', options[:css_dir], 'modules/.gitkeep')
        copy_file 'source/css/global/_global.scss', File.join(location, 'source', options[:css_dir], 'global/_global.scss')
        copy_file 'source/css/pages/_page-home.scss', File.join(location, 'source', options[:css_dir], 'pages/_page-home.scss')
        copy_file 'source/css/partials/_sidebar.scss', File.join(location, 'source', options[:css_dir], 'partials/_sidebar.scss')
        copy_file 'source/css/overrides/.gitkeep', File.join(location, 'source', options[:css_dir], 'overrides/.gitkeep')
        copy_file 'source/css/vendors/.gitkeep', File.join(location, 'source', options[:css_dir], 'vendors/.gitkeep')
        copy_file 'source/css/fonts/_fonts.scss', File.join(location, 'source', options[:css_dir], 'fonts/_fonts.scss')
        copy_file 'source/css/ie.css.scss', File.join(location, 'source', options[:css_dir], 'ie.css.scss')
        copy_file 'source/css/print.css.scss', File.join(location, 'source', options[:css_dir], 'print.css.scss')

        empty_directory File.join(location, 'source', options[:js_dir])
        copy_file 'source/js/framework/.gitkeep', File.join(location, 'source', options[:js_dir], 'framework/.gitkeep')
        copy_file 'source/js/modules/.gitkeep', File.join(location, 'source', options[:js_dir], 'modules/.gitkeep')
        copy_file 'source/js/vendors/.gitkeep', File.join(location, 'source', options[:js_dir], 'vendors/.gitkeep')
        copy_file 'source/js/overrides/.gitkeep', File.join(location, 'source', options[:js_dir], 'overrides/.gitkeep')
        copy_file 'source/js/pages/.gitkeep', File.join(location, 'source', options[:js_dir], 'pages/.gitkeep')
        copy_file 'source/js/boxsizing.htc', File.join(location, 'source', options[:js_dir], 'boxsizing.htc')
        copy_file 'source/js/PIE.htc', File.join(location, 'source', options[:js_dir], 'PIE.htc')
        copy_file 'source/js/PIE.php', File.join(location, 'source', options[:js_dir], 'PIE.php')
        copy_file 'source/js/respond.min.js', File.join(location, 'source', options[:js_dir], 'respond.min.js')
        copy_file 'source/js/script.js', File.join(location, 'source', options[:js_dir], 'script.js')
        copy_file 'source/js/ie.js', File.join(location, 'source', options[:js_dir], 'ie.js')

        empty_directory File.join(location, 'source', options[:images_dir])
        copy_file 'source/img/icon/.gitkeep', File.join(location, 'source', options[:images_dir], 'icon/.gitkeep')
        replace_css_img_dir
      end

      private
      def replace_css_img_dir
        f = File.open(File.join(location, 'source', options[:css_dir], 'screen.css.scss'), 'r')
        buf = f.read
        buf.gsub!(/IMG_DIR/, options[:images_dir])
        f.close

        f = File.open(File.join(location, 'source', options[:css_dir], 'screen.css.scss'), 'w')
        f.write(buf)
        f.close
      end
    end
  end
end

Middleman::Templates.register :swift, Middleman::Swift::Template
