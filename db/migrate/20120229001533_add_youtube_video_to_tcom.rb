class AddYoutubeVideoToTcom < ActiveRecord::Migration
  def self.up
    add_column :tcoms, :youtube_video, :string
  end

  def self.down
    remove_column :tcoms, :youtube_video
  end
end
