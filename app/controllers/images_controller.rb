class ImagesController < ApplicationController
    def new
      @image = Image.new
    end
  
    def create
      @image = Image.new(image_params)
      if @image.save
        redirect_to @image, notice: 'Image was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @image = Image.find(params[:id])
    end
  
    def edit
      @image = Image.find(params[:id])
    end
  
    def update
      @image = Image.find(params[:id])
      if @image.update(image_params)
        redirect_to @image, notice: 'Image was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      redirect_to images_url, notice: 'Image was successfully destroyed.'
    end
  
    private
      def image_params
        params.require(:image).permit(:image, :post_id)
      end
end
  