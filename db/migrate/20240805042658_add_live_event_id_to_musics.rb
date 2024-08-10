class AddLiveEventIdToMusics < ActiveRecord::Migration[7.1]
  def change
    add_reference :musics, :live_event, foreign_key: true
  end
end
