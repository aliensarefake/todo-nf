class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new

  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      redirect_to root_path
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to root_path, status: :see_other
  end

  def toggle_done
    @todo = Todo.find(params[:id])
    @todo.done = !@todo.done

      render :index, status: :unprocessable_entity
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end

end
