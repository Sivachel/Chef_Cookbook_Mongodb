#
# Cookbook:: mongod
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongod::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'updates all sources' do
      expect(chef_run).to update_apt_update('update')
    end

    it 'should add mongo to the sources list' do
      expect(chef_run).to add_apt_repository('mongodb-org')
    end

    it 'should install mongod' do
      expect(chef_run).to upgrade_package 'mongodb-org'
    end

    it "should create a mongod.conf template in /etc/mongod.conf" do
      expect(chef_run).to create_template("/etc/mongod.conf")
    end

    it "should create a mongod.service template in /lib/systemd/system/mongod.service" do
      expect(chef_run).to create_template("/lib/systemd/system/mongod.service")
    end

    it "Mongodb service should be started" do
      expect(chef_run).to start_service("mongod")
    end

    it "Mongodb service should be enabled" do
      expect(chef_run).to enable_service("mongod")
    end
  end
end
