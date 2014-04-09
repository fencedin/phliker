require 'spec_helper'

describe User do
  it { should have_many :tags}
  it { should have_many :photos}

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }


end
