class ZombiesController < ApplicationController
  before_action :set_zombie, only: [:show, :edit, :update, :destroy]

  # GET /zombies
  # GET /zombies.json
  def index
     
      #if current_admin
     #@zombies = Zombie.all
    #@rotten_zombies = Zombie.where(rotten: true)
   #else if current_user
    role= current_user.role
    if role == "Contributor"
    @zombies = Zombie.where(user_id:  current_user.id)
    else    
    @zombies = Zombie.all
    @rotten_zombies = Zombie.where(rooten: true)
     #end 
  #end
  end
  end  
  # GET /zombies/1
  # GET /zombies/1.json
  def user
      @users = User.all
  end
    def show
  end

  # GET /zombies/new
  def new
    role= current_user.role
    if role == "Subscriber"
    flash[:notice]= "No puedes crear un nuevo zombie"
    redirect_to zombies_path
    else    
    @zombie = Zombie.new
  end
  end

  # GET /zombies/1/edit
  def edit
  end

  # POST /zombies
  # POST /zombies.json
  def create
    @zombie = Zombie.new(zombie_params)
    @zombie.user_id = current_user.id  

    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: 'Zombie creado' }
        format.json { render :show, status: :created, location: @zombie }
      else
        format.html { render :new }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    respond_to do |format|
      if @zombie.update(zombie_params)
        format.html { redirect_to @zombie, notice: '¡El Zombie ha sido actualizado exitosamente!' }
        format.json { render :show, status: :ok, location: @zombie }
      else
        format.html { render :edit }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.destroy
    respond_to do |format|
      format.html { redirect_to zombies_url, notice: '¡Eliminado!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombie
      @zombie = Zombie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zombie_params
      params.require(:zombie).permit(:name, :bio, :age, :email, :rooten, :avatar)
    end
end
