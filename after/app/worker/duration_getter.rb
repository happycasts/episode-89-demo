class DurationGetter
  @queue = :video_info
  def self.perform(episode_id)
    episode = Episode.find(episode_id)
    sleep 10
    result = `avconv -i #{episode.asset_url} 2>&1`
    if result =~ /Duration: ([\d][\d]:[\d][\d]:[\d][\d].[\d]+)/
      episode.update_attributes(duration: $1.to_s)
    end
  end
end