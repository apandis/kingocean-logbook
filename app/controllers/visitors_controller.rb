class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]

  def index
    @visitors = Visitor.All
  end

  def show
  end

  def new
    @visitor = Visitor.new
  end

  def edit
  end

  def create
    @visitor = Visitor.new(visitor_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: 'Visitor was successfully created.' }
        format.json { render :show, status: :created, location: @visitor }
      else
        format.html { render :new }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to @visitor, notice: 'Visitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to visitors_url, notice: 'Visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    def visitor_params
      params.require(:visitor).permit(:name, :company, :purpose)
    end
end
