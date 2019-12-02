class ImagesController < ApplicationController
  def create
    # uploaded_io = params[:file0]
    file = Cloudinary::Uploader.upload(params[:file0])
    render plain: ["#{file['secure_url']}"].to_s
    # file_name = SecureRandom.uuid + File.extname(uploaded_io.original_filename)
    # File.open(Rails.root.join('public', 'assets', 'uploads', file_name), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end
    # render plain: ["#{file_name}"].to_s
  end
end
