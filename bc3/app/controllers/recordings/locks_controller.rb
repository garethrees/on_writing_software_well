class Recordings::LocksController < Recordings::BaseController
  def show
    if @recording.locked?
      render
    else
      redirect_to @recording
    end
  end

  def destroy
    @recording.unlock
    respond_to do |format|
      format.any(:html, :js) { redirect_to return_to_after_destroy_url }
      format.json { head :no_content }
    end
  end

  private
    def return_to_after_destroy_url
      if params[:return_to] == 'show'
        recordable_url(@recording)
      else
        edit_recordable_url(@recording)
      end
    end
end
