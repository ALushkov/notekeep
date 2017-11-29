class AddDetailsToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :htmltitle, :string
    add_column :notes, :htmldescription, :string
    add_column :notes, :priority, :integer
  end
end
