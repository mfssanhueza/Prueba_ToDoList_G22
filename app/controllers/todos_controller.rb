class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    redirect_to todos_path if @todo.save
  end

  def show
      @todo.completed ? @status = 'Realizada' : @status = 'Pendiente'
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo.delete
    redirect_to todos_path

  end

  def complete
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @done = []
    @incomplete = []
    @todos = Todo.all
    @todos.each do |todo|
      todo.completed ? @done.push(todo) : @incomplete.push(todo)
    end
  end

  private
  def set_todo
    @todo = Todo.find(params[:id])

  end
  def todo_params
    params.require(:todo).permit(:description, :completed)

  end
end
