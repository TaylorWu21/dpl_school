class SchoolsController < ApplicationController
  def index
  	# GET - show all the schools
  	@schools = School.all
  end

  def show
  	# GET - show a single school
  	@school = School.find(params[:id])
  end

  def edit
  	# GET - show a form to edit a school
  	@school = School.find(params[:id])
  end

  def update
  	# PUT - update records in a school
  	@school = School.find(params[:id])
  	if @school.update(school_params)
  		#updated school sucessfully
  		redirect_to school_path(@school)
  	else
  		#something went wrong
  		render :edit
  	end
  end

  def new
  	# GET - show a form to create a new school
  	@school = School.new
  end

  def create
  	# POST - creating a new school record in the db
  	@school = School.new(school_params)
  	if @school.save
  		#successful save in db
  		redirect_to schools_path
  	else
  		#something went wrong
  		render :new
  	end
  end

  def destroy
  	# DELETE - delete a single school out of db
  	School.find(params[:id]).destroy
  	redirect_to schools_path
  end

  private

  	def school_params
  		params.require(:school).permit(:name, :yearbuilt)
  	end

end
