require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end


  test 'valid project' do

    project = Project.new(code: SecureRandom.uuid, description: 'this is a description', name: 'project name', user_id: @user.id)
    assert project.valid?
  end

  test 'invalid without name' do

    project = Project.new(code: SecureRandom.uuid, description: 'this is a description', user_id: @user.id)
    refute project.valid?, 'project is valid without a name'
    assert_not_nil project.errors[:name], 'no validation error for name present'
  end

  test 'invalid without code' do

    project = Project.new(name: 'project name', description: 'this is a description', user_id: @user.id)
    refute project.valid?, 'project is valid without a code'
    assert_not_nil project.errors[:code], 'no validation error for code present'
  end

  test 'invalid without user' do

    project = Project.new(name: 'project name', description: 'this is a description',code: SecureRandom.uuid)
    refute project.valid?, 'project is valid without a user'
    assert_not_nil project.errors[:user_id], 'no validation error for user present'
  end


end
