class WebsiteController <  Base::WebsiteController

before_filter :website_init

  private
  def website_init

     # @main_menu = Menu.find_by_slug("main_menu").menu_items.at_depth(0) rescue []
     # @side_menu = Menu.find_by_slug("side_menu").menu_items.at_depth(0) rescue []
     # @info_menu=Menu.find_by_slug("info_menu").menu_items.at_depth(1) rescue []
     # did_you_knows=StaticPageType.find_by_slug('kserate-oti').static_pages rescue []
     # @did_you_know = did_you_knows.offset(rand(did_you_knows.count)).first rescue nil
     # inner_pages_banners = BannerZone.find_by_slug("inner_pages_banners").banners.active
     # @inner_pages_banner = inner_pages_banners.offset(rand(inner_pages_banners.count)).first rescue nil

  end


end


