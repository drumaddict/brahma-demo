class Api::TypesController < Api::BaseController

  private
  def type_params
    params.require(:type).permit(:title, :description)
  end

  def query_params
    params.permit(:title, :description)
  end


end