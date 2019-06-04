class TodosController < ApplicationController
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
      @todo = Todo.find(params[:id])
      @todo.completed ? @status = 'Realizada' : @status = 'Pendiente'
  end

  def edit
      @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    redirect_to todos_path

  end

  def complete
    @todo = Todo.find(params[:id])
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
  def todo_params
    params.require(:todo).permit(:description, :completed)

  end
end
