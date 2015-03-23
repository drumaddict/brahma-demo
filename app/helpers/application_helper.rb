module ApplicationHelper

    def flash_alert flash
      if flash.present?
        message = flash[:error] || flash[:notice] || flash[:success]  || flash[:alert] || flash[:info]
        flash_class = "danger" if (flash[:error]  ||  flash[:alert])
        flash_class = "info" if ( flash[:notice]  || flash[:info] )
        flash_class = "success" if flash[:success]
        flash_div = content_tag(:div, message, class: "alert alert-#{flash_class} auto-dissapear text-center")
        content_tag(:div, flash_div, class: 'col-md-12')
      end
  end

end
