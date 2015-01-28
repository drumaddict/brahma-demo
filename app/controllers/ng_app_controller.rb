class NgAppController < WebsiteController
  def index
     render :file => 'public/dist/index.html', :layout => false
    #@main_slider_banners = BannerZone.find_by_slug("main_slider").banners rescue []
    #@top_banners = BannerZone.find_by_slug("homepage_top").banners rescue []
    #@home_page_center_banner = BannerZone.find_by_slug("homepage_center").banners.first rescue nil

    #quotes=StaticPageType.find_by_slug('quotes').static_pages rescue []
    #@quote = quotes.offset(rand(quotes.count)).first rescue nil

    #@featured_incidents=StaticPage.incidents_all.featured.limit(8) rescue nil
    #@featured_incident_first=@featured_incidents.featured_first.limit(1).first rescue nil
  end
end