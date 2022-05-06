# frozen_string_literal: true

#  Dropcommentstable
class Dropcommentstable < ActiveRecord::Migration[5.2]
  def change
    drop_table :comments
  end
end
