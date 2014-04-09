require 'spec_helper'

describe Photo do
  it { should have_many :tags }
  it { should have_many :users }
end
