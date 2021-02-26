class NotesController < ApplicationController
  before_action :set_note, only: %i[show update destroy]

  # GET /notes
  # muestra todos
  # @varaibleGlobal disponible
  def index
    @notes = Note.where(user_id: @user.id)
    render json: @notes
  end

  # GET /notes/1
  # revisa que la nota le pertenesca
  # mestra la nota
  def show
    if @note.user_id == @user.id
      render json: @note
    else
      render json: { error: 'no tienes autorizacion para ver este contenido' }
    end
  end

  # POST /notes
  # crear nueva nota
  def create
    @note = Note.new(note_params)
    @note.user_id = @user.id # asigna variable id a la nota para ser guardada
    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  # actualizar
  def update
    if @note.user_id == @user.id # es de la persona
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'no tienes autorizacion para actualizar este contenido' }
    end
  end

  # DELETE /notes/1
  # borrar una nota
  def destroy
    # comprobar que la nota es del usuario actual
    if @note.user_id == @user.id
      @note.destroy
    else
      render json: { error: 'no tienes autorizacion para borrar este contenido' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def note_params
    params.require(:note).permit(:user_id, :nombre, :precio)
  end
end
