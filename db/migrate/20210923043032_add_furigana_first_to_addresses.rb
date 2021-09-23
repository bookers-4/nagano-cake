class AddFuriganaFirstToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :furigana_first, :string
  end
end
