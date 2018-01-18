class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]
  
  scope :today, -> { where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day) }
  scope :yesterday, -> { where(:created_at => 1.days.ago.beginning_of_day..1.days.ago.end_of_day) }

  scope :this_week, -> { where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week) }
  scope :this_month, -> { where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :this_year, -> { where(:created_at => Time.now.beginning_of_year..Time.now.end_of_year) }

  scope :last_hour, -> { where(:created_at => 1.hour.ago..Time.now) }
  scope :last_week, -> { where(:created_at => 1.weeks.ago.beginning_of_week..1.weeks.ago.end_of_week) }
  scope :last_month, -> { where(:created_at => 1.months.ago.beginning_of_month..1.months.ago.end_of_month) }
  scope :last_year, -> { where(:created_at => 1.years.ago.beginning_of_year..1.years.ago.end_of_year) }

  def index
    @visitors = Visitor.all
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
