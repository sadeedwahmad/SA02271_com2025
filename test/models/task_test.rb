require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
    @task = tasks(:one)
  end



  test 'valid task' do
    task = Task.new( description:"this is a task", name: "task name", project_id: @project.id, start_time: '2020-12-02 22:11:11', end_time:  '2020-12-03 23:11:11')
    assert task.valid?
  end

  test 'invalid without name' do
    task = Task.new( description:"this is a task", project_id: @project.id, start_time: '2020-12-02 22:11:11', end_time:  '2020-12-03 23:11:11')
    refute task.valid?, 'task is valid without a name'
    assert_not_nil task.errors[:name], 'no validation error for name present'
  end

  test 'invalid without project' do
    task = Task.new( description:"this is a task", name: "task name", start_time: '2020-12-02 22:11:11', end_time:  '2020-12-03 23:11:11')
    refute task.valid?, 'task is valid without a project'
    assert_not_nil task.errors[:project_id], 'no validation error for project present'
  end

  test 'invalid without starttime' do
    task = Task.new( description:"this is a task",name: "task name", project_id: @project.id, end_time:  '2020-12-03 23:11:11')
    refute task.valid?, 'task is valid without a startTime'
    assert_not_nil task.errors[:start_time], 'no validation error for startime present'
  end

  test 'invalid without endtime' do
    task = Task.new( description:"this is a task",name: "task name", project_id: @project.id, start_time: '2020-12-02 22:11:11')
    refute task.valid?, 'task is valid without a endtime'
    assert_not_nil task.errors[:end_time], 'no validation error for endtime present'
  end

end
