class Api::ThingsController < Api::BaseController

  private
  def thing_params
    params.require(:thing).permit(:title, :description, :published, :featured, :type_id)
  end

  # Returns the allowed parameters for searching
  # Override this method in each API controller
  # to permit additional parameters to search on
  # @return [Hash]
  def query_params
     params.permit(:title, :description, :featured, :published, :type_id)
  end

  end