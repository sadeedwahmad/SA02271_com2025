require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @user = users(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
  get new_project_url
  assert_response :success
  end



  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { code: @project.code, description: @project.description, name: @project.name, user_id: @user.id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
  assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { code: @project.code, description: @project.description, name: @project.name, user_id: @user.id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end

  test 'should not save empty project' do
    project = Project.new
    project.save
    refute project.valid?
  end

  test 'should save valid project' do
    project = Project.new
    project.name = 'Project name'
    project.code=  'ishdf879we9opfsh8f'
    project.description= 'I love ruby on rails and toast'
    project.user_id = @user.id
    project.save
    assert project.valid?
  end

  #secure uuid used for code, so projects always different
  test 'should save duplicate project' do
    project = Project.new
    project.name = 'Project name'
    project.code=  SecureRandom.uuid
    project.description= 'I love ruby on rails and toast'
    project.user_id = @user.id
    project.save
    assert project.valid?

    project2= Project.new
    project2.name = 'Project name'
    project2.code=   SecureRandom.uuid
    project2.description= 'I love ruby on rails and toast'
    project2.user_id = @user.id
    project2.save
    assert project2.valid?

    end






end
