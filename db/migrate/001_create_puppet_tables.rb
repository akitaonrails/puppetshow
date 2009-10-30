class CreatePuppetTables < ActiveRecord::Migration
  def self.up
    Puppet::Rails.init
  end

  def self.down
    Puppet::Rails.teardown
  end
end
