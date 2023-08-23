module Api
    module V1
        class AnimalsController < ApplicationController
            def index
                # animals = Animal.order('created_at DESC');
                 # animals = Animal.page(1);
                 animals = Animal.page(1).per(20);
                 # animals = Animal.page(page).per(per_page)
                 render json: {status: 'SUCCESS', message: 'Loaded animals', data: animals}, status: :ok
             end
 
             def show
                 animal = Animal.find(params[:id])
                 render json: {status: 'SUCCESS', message: 'Loaded animals', data: animal}, status: :ok
             end
 
             def create
                 # animal = Animal.new(animal_params)
                 animal = Animal.new(animal_params)
                 authorize! :create, animal
 
                 if animal.save
                     render json: {status: 'SUCCESS', message: 'Animal Saved Successfully', data: animal}, status: :ok
                 else
                     render json: {status: 'ERROR', message: 'Animal not saved', data: animal.errors}, status: :unprocessable_entity
                 end
             end
 
             def destroy
                 animal = Animal.find(params[:id])
                 authorize! :destroy, animal
                 animal.destroy
                 render json: {status: 'SUCCESS', message: 'Animal successfully deleted', data: animal}, status: :ok
             end
 
             def update
                 animal = Animal.find(params[:id])
                 authorize! :update, animal
                 if animal.update(animal_params)
                     render json: {status: 'SUCCESS', message: 'Animal Updated Successfully', data: animal}, status: :ok
                 else
                     render json: {status: 'ERROR', message: 'Animal not updated', data: animal.errors}, status: :unprocessable_entity
                 end
             end
             
 
             private
             def animal_params
                 params.permit(:aname)
             end
 
             def page
                 page ||= params[:page] || 1
             end
 
             def per_page
                 per_page ||= params[:per_page] || 20
             end
        end
    end
end