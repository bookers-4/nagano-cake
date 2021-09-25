class AddFuriganaLastToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :furigana_last, :string
  end
end
