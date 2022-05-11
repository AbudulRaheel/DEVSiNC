# frozen_string_literal: true

# ConvertProductSerialNoToUuid
class ConvertProductSerialNoToUuid < ActiveRecord::Migration[5.2]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')

    change_table :products do |t|
      t.remove :serial_no
    end
    add_column :products, :uuid, :uuid, default: 'uuid_generate_v4()', null: false
  end

  def def(_down)
    raise ActiveRecord::Irreversible
  end
end
