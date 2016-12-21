require 'spec_helper'

require 'active_record'

silence_warnings do
  ActiveRecord::Migration.verbose = false
  ActiveRecord::Base.logger = Logger.new(nil)
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
end

ActiveRecord::Base.connection.instance_eval do
  create_table :users do |t|
    t.string :sex
    t.string :role
    t.string :status
  end
end

class User < ActiveRecord::Base
end

RSpec.describe User do

  def user!(sex=nil, role=nil, status=nil)
    User.create sex: sex, role: role, status: status
  end

  describe '.deep_count' do

    before(:all) do
      User.create sex: 'male',   role: 'user',  status: 'disabled'
      User.create sex: 'male',   role: 'user',  status: 'enabled'
      User.create sex: 'male',   role: 'user',  status: 'enabled'
      User.create sex: 'male',   role: 'admin', status: 'enabled'
      User.create sex: 'female', role: 'admin', status: 'enabled'
    end

    context 'without group' do
      it { expect(described_class.all.deep_count).to eq 5 }
    end

    context 'grouped by one column' do
      it do
        expect(described_class.group(:sex).deep_count).to eq 'male' => 4, 'female' => 1
      end
    end

    context 'grouped by two columns' do
      it do
        expect(described_class.group(:sex, :role).deep_count)
            .to eq 'female' => { 'admin' => 1 },
                   'male' => { 'admin' => 1, 'user' => 3 }
      end

      it do
        expect(described_class.group(:role, :sex).deep_count)
            .to eq 'admin' => { 'female' => 1, 'male' => 1 }, 'user' => { 'male' => 3 }
      end
    end

    context 'grouped by three columns' do
      it do
        expect(described_class.group(:sex, :role, :status).deep_count)
            .to eq 'female' => { 'admin' => { 'enabled' => 1 } },
                   'male' => { 'admin' => {'enabled' => 1 }, 'user' => { 'disabled' => 1, 'enabled' => 2 } }
      end
    end
  end
end