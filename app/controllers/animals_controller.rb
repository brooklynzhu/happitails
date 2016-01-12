class AnimalsController < ApplicationController

	def show
		@animal = Animal.find(params[:id])
		@shelter = Shelter.find(2)
		@client = @animal.client_id


	end

	def new
		@shelter = Shelter.find(params[:shelter_id])
		@animal = @shelter.animals.new
	end

	def create
		@shelter = Shelter.find(params[:shelter_id])
		@animal = @shelter.animals.new(safe_animal_params)
		if @animal.save
			flash[:notice] = "Animal has been added!"
			redirect_to shelter_path(@shelter)
		else
			flash[:notice] = "Error!"
			render :new
		end
	end

	def adopt
		@animal = Animal.find(params[:id])
		@shelter = Shelter.find(2)
		@clients = @shelter.clients

	end

	def complete_adoption
		@shelter = Shelter.find(2)
		@animal = Animal.find(params[:id])
		@animal.shelter_id = nil
		@animal.client_id = params[:client]
		@animal.save
		redirect_to shelter_path(@shelter)
	end

	def donate
		@animal = Animal.find(params[:animal_id])
		@client = @animal.client_id
		@shelter = Shelter.find(2)
	end

	def complete_donation
		@shelter = Shelter.find(2)
		@client = @animal.client_id
		@animal = Animal.find(params[:animal_id])
		@animal.client_id = nil
		@animal.shelter_id = params[:shelter]
		@animal.save
		redirect_to shelter_path(@shelter)
	end


	private

	def safe_animal_params
		params.require(:animal).permit(:name, :species, :photo, :client_id)
	end


end



