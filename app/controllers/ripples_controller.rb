class RipplesController < ApplicationController
  before_action :set_ripple, only: [:show]

  # GET /ripples
  # GET /ripples.json
  def index
    
    session[:page] ||= 0
    first_displayed_entry = session[:page] * 10
    last_displayed_entry = first_displayed_entry + 9
    @ripples = Ripple.order(created_at: :desc)
    @ripples = @ripples[first_displayed_entry..last_displayed_entry]
    
  end

  # GET /ripples/1
  # GET /ripples/1.json
  def show
  end

  # GET /ripples/new
  def new
    @ripple = Ripple.new
  end

  
  # POST /ripples
  # POST /ripples.json
  def create
    @ripple = Ripple.new(ripple_params)

    respond_to do |format|
      if @ripple.save
        format.html { redirect_to action: "index", notice: 'Ripple was successfully created.' }
        format.json { render :show, status: :created, location: @ripple }
      else
        format.html { render :new }
        format.json { render json: @ripple.errors, status: :unprocessable_entity }
      end
    end
  end

  
  
  def next10
      total_pages = getPageCount
      if session[:page] < total_pages - 1
        session[:page] += 1
        respond_to do |format|
          format.html {redirect_to ripples_url}
          format.json {head :no_content}
        end
      else
        self.oldest
      end
  end
    
    def previous10
      if session[:page] > 0
        session[:page] -= 1
        respond_to do |format|
          format.html {redirect_to ripples_url}
          format.json {head :no_content}
        end
      else
        self.newest
      end
    end
    
    
    def newest
      session[:page] = 0
      Ripple.order(created_at: :desc)
      respond_to do |format|
        format.html {redirect_to ripples_url}
        format.json {head :no_content}
      end
    end
    
    
    def oldest
      
      session[:page] = Ripple.all.count / 10
      Ripple.order(created_at: :asc)
      respond_to do |format|
        format.html {redirect_to ripples_url}
        format.json {head :no_content}
      end
    end
    
end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ripple
      @ripple = Ripple.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ripple_params
      params.require(:ripple).permit(:name, :url, :message)
    end
    
    def getPageCount
      total_ripples = Ripple.all.count
      if (total_ripples % 10 == 0)
        total_pages = total_ripples / 10
      else
        total_pages = total_ripples / 10 + 1
      end
      return total_pages
    end
    
    