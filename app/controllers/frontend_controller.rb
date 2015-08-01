require "#{Brahma::controllers_dir}/frontend_controller"
class FrontendController <  Brahma::ApplicationController

  before_filter :website_init

    def website_init
        @main_menu=NavigationNode.roots.where(type: 'NavigationNode').first
        @main_slider_images = MediaCollection.find_by_slug("main-slider").media rescue []
        @page_types= PageType.find_all_by_generation(1)

       # @side_menu = Menu.find_by_slug("side_menu").menu_items.at_depth(0) rescue []
       # @info_menu=Menu.find_by_slug("info_menu").menu_items.at_depth(1) rescue []
       # did_you_knows=StaticPageType.find_by_slug('kserate-oti').static_pages rescue []
       # @did_you_know = did_you_knows.offset(rand(did_you_knows.count)).first rescue nil
       # inner_pages_banners = BannerZone.find_by_slug("inner_pages_banners").banners.active
       # @inner_pages_banner = inner_pages_banners.offset(rand(inner_pages_banners.count)).first rescue nil

    end

end