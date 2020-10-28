require 'import_csv_data.rb'
class HomeController < ApplicationController
	def dashboard		
	end

	def import_csv_form
		
	end

	def import_csv
		if params[:type].present? && params[:file].present?
			ImportCsvData.import_movies(params[:file]) if params[:type] == "Movie"
			ImportCsvData.import_movies(params[:file]) if params[:type] == "Review"
			redirect_to root_path, notice: 'File processed successfully.'
		else
			redirect_to root_path, notice: 'Something Went wrong.'
		end
	end
end
