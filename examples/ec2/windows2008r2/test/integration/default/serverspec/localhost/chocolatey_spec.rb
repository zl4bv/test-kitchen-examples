require 'spec_helper'

describe command('choco') do
  its(:stdout) { is_expected.to match(/Chocolatey/) }
end

