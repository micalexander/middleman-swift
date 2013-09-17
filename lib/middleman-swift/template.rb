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

        empty_directory File.join(location, 'source', options[:css_dir])
        copy_file 'source/css/screen.css.scss', File.join(location, 'source', options[:css_dir], 'screen.css.scss')
        copy_file 'source/css/partials/_font-styles.scss', File.join(location, 'source', options[:css_dir], 'partials/_font-styles.scss')
        copy_file 'source/css/partials/_swift-framework.scss', File.join(location, 'source', options[:css_dir], 'partials/_swift-framework.scss')
        copy_file 'source/css/partials/_page-about-us.scss', File.join(location, 'source', options[:css_dir], 'partials/_page-about.scss')
        copy_file 'source/css/partials/_page-contact-us.scss', File.join(location, 'source', options[:css_dir], 'partials/_page-contact.scss')
        copy_file 'source/css/partials/_page-home.scss', File.join(location, 'source', options[:css_dir], 'partials/_page-home.scss')
        copy_file 'source/css/partials/_reset.scss', File.join(location, 'source', options[:css_dir], 'partials/_reset.scss')
        copy_file 'source/css/partials/_sidebar.scss', File.join(location, 'source', options[:css_dir], 'partials/_sidebar.scss')
        copy_file 'source/css/ie.css.scss', File.join(location, 'source', options[:css_dir], 'ie.css.scss')
        copy_file 'source/css/print.css.scss', File.join(location, 'source', options[:css_dir], 'print.css.scss')
        copy_file 'source/css/fonts/.gitkeep', File.join(location, 'source', options[:css_dir], 'fonts/.gitkeep')

        empty_directory File.join(location, 'source', options[:js_dir])
        copy_file 'source/js/script.js', File.join(location, 'source', options[:js_dir], 'script.js')
        copy_file 'source/js/boxsizing.htc', File.join(location, 'source', options[:js_dir], 'boxsizing.htc')
        copy_file 'source/js/ie.js', File.join(location, 'source', options[:js_dir], 'ie.js')
        copy_file 'source/js/PIE.htc', File.join(location, 'source', options[:js_dir], 'PIE.htc')
        copy_file 'source/js/PIE.php', File.join(location, 'source', options[:js_dir], 'PIE.php')
        copy_file 'source/js/plugins.js', File.join(location, 'source', options[:js_dir], 'plugins.js')
        copy_file 'source/js/respond.min.js', File.join(location, 'source', options[:js_dir], 'respond.min.js')
        copy_file 'source/js/vendor/jquery-1.8.0.min.js', File.join(location, 'source', options[:js_dir], 'vendor/jquery-1.8.0.min.js')

        empty_directory File.join(location, 'source', options[:images_dir])
        copy_file 'source/img/icon/mic-icon.png', File.join(location, 'source', options[:images_dir], 'icon/mic-icon.png')
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
