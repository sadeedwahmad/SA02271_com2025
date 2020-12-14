require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @project = projects(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { description: @task.description, name: @task.name, project_id: @project.id, start_time: @task.start_time, end_time: @task.end_time} }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { description: @task.description, name: @task.name, project_id: @project.id, start_time: @task.start_time, end_time: @task.end_time } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  test 'should not save empty task' do
    task = Task.new
    task.save
    refute task.valid?
  end

  test 'should save task' do
    task = Task.new
    task.name =  'Task1'
    task.description= 'some text £$%^1232342354'
    task.complete= false
    task.start_time= '2020-12-02 22:11:11'
    task.end_time= '2020-12-03 23:11:11'
    task.project_id= @project.id
    task.save
    assert task.valid?
  end


end
