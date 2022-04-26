class AddQuantityToProducts < ActiveRecord::Migration[5.2]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')

    add_column :products, :uuid, :uuid, default: 'uuid_generate_v4()', null: false

    change_table :products do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute 'ALTER TABLE products ADD PRIMARY KEY (id);'
  end

  def def(_down)
    raise ActiveRecord::Irreversible
  end
end
