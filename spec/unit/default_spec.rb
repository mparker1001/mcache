# encoding: utf-8

require 'chefspec'
require 'chefspec/berkshelf'

describe 'mcache::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04') do |node|
      node.set['memory']['total'] = 400
      node.set['mcache']['listen_port'] = 5000
    end.converge(described_recipe)
  end

  it 'installs mcache' do
    expect(chef_run).to install_package('memcached')
  end

  it 'create template file with permissions and ownership' do
    expect(chef_run)
      .to create_template('/etc/memcached.conf')
      .with_mode('0644')
  end

  it 'populate config template with correct values' do
    expect(chef_run)
      .to render_file('/etc/memcached.conf')
      .with_content('-p 5000')
      .with_content('-m 300')
      .with_content('-l 127.0.0.1')
  end

  it 'start memcached service' do
    expect(chef_run).to enable_service('memcached')
    expect(chef_run).to start_service('memcached')
  end
end
