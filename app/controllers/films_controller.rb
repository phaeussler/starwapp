class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]
  
  # GET /films
  # GET /films.json
  def index
    # @films = Film.all
    @films = get_films()
  end

  # GET /films/1
  # GET /films/1.json
  def show
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(film_params)

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      # @film = Film.find(params[:id])
      @film = execute_request("films/#{params[:id]}")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      params.require(:film).permit(:name, :year, :director, :productor, :episode)
    end
    
    def get_films()
      response = execute_request("films")
      response['results'].sort_by { |f| [f['release_date']] }
    end

    # def get_film(id = '')
    #   response = execute_request("films/#{id}")
    # end
    
    

    # def execute_request(extra)
    #   require 'net/http'
      # require 'json'
    #   uri = URI("#{BASE_URL}/#{extra}")
    #   response = Net::HTTP.get(uri)
    #   JSON.parse(response)
    # end
end
