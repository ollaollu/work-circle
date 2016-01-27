class TipsController < ApplicationController
  before_action :set_tip, :except => ["index", "new", "create"]
  #before_action :authenticate_user!

  def index
    if params[:search]
      selected_date = Date.parse(params[:search])
      @tips = Tip.search(selected_date)
        respond_to do |format|
          format.html
          format.js
        end
    else
      selected_date = Date.current
      params[:search] = selected_date
      @tips = Tip.search(selected_date)
        respond_to do |format|
          format.html
          format.js
        end
    end
  end

  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    if @tip.save
      respond_to do |format|
        format.html {redirect_to @tips, notice: "Tip created successfully"}
        format.js
      end
    else
      respond_to do |format|
        format.html {render :new, alert: "Tip was not created"}
        format.js {render 'fail.js.erb'}
      end
    end
  end

  def edit
  end

  def update
    if @tip.update(tip_params)
      respond_to do |format|
        format.html {redirect_to @tip, notice: "Tip updated"}
        format.js
      end
    else
      respond_to do |format|
        format.html {render :edit, alert: "Tip update failed"}
        format.js {render 'fail.js.erb'}
      end
    end
  end

  def destroy
    @tip.destroy
    respond_to do |format|
      format.html {redirect_to @tips, notice: "Tip deleted"}
      format.js
    end
  end


  protected

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params.require(:tip).permit(:sport, :country, :league, :teams, :bet, :odds, :status, :tip_date, :game_time)
  end
end
