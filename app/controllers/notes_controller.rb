class NotesController < ApplicationController
  before_action :set_note, only: %i[show update destroy]

  # GET /notes

  # poria recibir el id por param pero ya lo tengo disponible para varaible @global
  def index
    @notes = Note.where(user_id: @user.id)
    render json: @notes
  end

  # GET /notes/1
  # el controlador usa rutas para acceder al recurso y lo regresa
  def show
    # @notes = Note.where(user_id: @user.id)
    if @note.user_id == @user.id
      render json: @note
    else
      render json: { error: 'no tienes autorizacion para ver este contenido' }
    end

    # @notes = Note.where(user_id: @user.id)
    # @buscado = note_params

    # render json: @buscado

    # render json: { error: :note_params }

    # regresar mis notas
    # regresa 1 de esas notas
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
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
