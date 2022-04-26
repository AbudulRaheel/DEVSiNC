# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_424_234_619) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'
  enable_extension 'uuid-ossp'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'cart_items', force: :cascade do |t|
    t.bigint 'carts_id', null: false
    t.string 'product_id'
    t.string 'price'
    t.string 'float'
    t.string 'quantity'
    t.string 'integer'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['carts_id'], name: 'index_cart_items_on_carts_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.string 'cart_id'
    t.string 'item_count'
    t.string 'integer'
    t.string 'total_bill'
    t.string 'float'
    t.string 'order_id'
    t.string 'string'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'comment_text'
    t.bigint 'product_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_comments_on_product_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'coupons', force: :cascade do |t|
    t.string 'coupon_id'
    t.string 'string'
    t.string 'coupon_name'
    t.string 'discount_percentage'
    t.float 'float'
    t.string 'valid_till'
    t.string 'date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'order_id'
    t.string 'string'
    t.datetime 'order_date'
    t.bigint 'user_id', null: false
    t.string 'payment_id'
    t.string 'amount'
    t.string 'float'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'descriptio'
    t.string 'price'
    t.string 'float'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'product_name'
    t.string 'quantity'
    t.uuid 'uuid', default: -> { 'uuid_generate_v4()' }
    t.index ['user_id'], name: 'index_products_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'full_name'
    t.string 'phone'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'cart_items', 'carts', column: 'carts_id'
  add_foreign_key 'comments', 'products'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'products', 'users'
end
