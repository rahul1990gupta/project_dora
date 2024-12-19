class ResumeparserController < ApplicationController
  def index
  end

  def create
    uploaded_file = params[:file]
    if uploaded_file
      file_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end
      flash[:notice] = "File uploaded successfully!"
    else
      flash[:alert] = "Please select a file to upload."
    end
    redirect_to resumeparser_index_path
  end
end
