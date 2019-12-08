class JianshuController < ApplicationController
  # require 'open-uri'

  def handle_image
    articles = Article.all.order(created_at: :desc)
    articles.each do |article|
      # get Images
      images = article.raw_content.scan /class=\"uploaded-img\" src=\"https:\/\/upload-images(.+?)\"/

      unless images.empty?
        # save Images to cloud
        images.each do |image|
          # abort image.inspect
          name = image[0].match(/https:\/\/upload-images.jianshu.io\/upload_images\/(?<name>.*)/)[:name]
          name = File.basename(name, '.png')
          name = File.basename(name, '.jpg')
          Cloudinary::Uploader.upload(image[0], public_id: name, folder: "images/articles")
        end
        # update Article
        article.raw_content = article.raw_content.gsub('https://upload-images.jianshu.io/upload_images/', 'https://res.cloudinary.com/wukongsongcai/image/upload/images/articles/')
        article.raw_content = article.raw_content.gsub('contenteditable="true" class="kalamu-area"', '')
        article.save
      end
    end
  end
end
