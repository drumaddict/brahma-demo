class ThingsController <  AppController

before_filter :find_thing, only: [:show]
before_filter :find_type, only: [:index]


def index
  @things=Thing.all
end

def show
end



  protected
  def find_thing
    @thing= Thing.find(params[:id])
    @type=Type.find(params[:type_id])

    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != type_thing_path(@type,@thing)
      return redirect_to @thing, status: :moved_permanently
    end
  end

  def find_type

    @type=Type.find(params[:type_id])

    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != type_things_path(@type)
      return redirect_to @type, status: :moved_permanently
    end
  end

end