class NotesController < ApplicationController
  
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.where(user_id: current_user)
  end
  
  def show

	end
  
  def new
    @note = current_user.notes.build
  end
  
  def create
    @note = current_user.notes.build(params_note)

    if @note.save
      redirect_to @note
    else
      render 'new'  
    end
  end
  
  def edit

  end
    
  def update
    if @note.update(params_note) 
      redirect_to @note
    else
      render 'edit'  
    end  
  end
  
  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private 

  def find_note
    @note=Note.find(params[:id])
  end

  def params_note
    params.require(:note).permit(:title, :content)
  end


end
