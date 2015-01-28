class TypesController <  WebsiteController

before_filter :find_type, :only => [:show]

def index

  @types =Type.all
end

def show
@things = @type.things
#@static_pages = Kaminari.paginate_array(@static_pages).page(params[:page]).per(15)

end


  protected
  def find_type
    @type = Type.find(params[:id])

    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != type_path(@type)
      return redirect_to @type, status: :moved_permanently
    end
  end

end


