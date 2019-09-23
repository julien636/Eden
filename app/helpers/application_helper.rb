module ApplicationHelper
  def youtube_video(url)
    render :partial => 'static_pages/video', :locals => { :url => url }
  end 

end
