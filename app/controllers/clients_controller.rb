class ClientsController < ApplicationController

	def show

		@client = Client.find(params[:id])
		@shelter = Shelter.find((2))
		@pets = @client.animals

	end

	def new
		@shelter = Shelter.find(2)
		@client = @shelter.clients.new

	end

	def create
		@shelter = Shelter.find(2)
		@client = @shelter.clients.new(safe_client_params)
		if @client.save
			flash[:notice] = "Client has been added!"
			redirect_to shelter_path(@shelter)
		else
			flash[:notice] = "Error!"
			render :new
		end
	end



	private

	def safe_client_params
		params.require(:client).permit(:name, :age, :photo)
	end

end