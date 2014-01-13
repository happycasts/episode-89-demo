class Episode < ActiveRecord::Base
  def save_video_duration
    sleep 10
    result = `avconv -i #{self.asset_url} 2>&1`
    if result =~ /Duration: ([\d][\d]:[\d][\d]:[\d][\d].[\d]+)/
      self.update_attributes(duration: $1.to_s)
    end
  end
end
