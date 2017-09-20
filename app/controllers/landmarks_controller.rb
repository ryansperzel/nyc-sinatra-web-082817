class LandmarksController < ApplicationController

  get '/' do
    redirect to '/landmarks'
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.create(name: params[:landmark][:name])
    if params[:landmark][:figure_id]
      fig = Figure.find(params[:landmark][:figure_id])
      landmark.figure_id = fig.id
      landmark.save
    elsif params[:figure][:name]
      new_fig = Figure.create(name: params[:figure][:name])
      landmark.figure_id = new_fig.id
      landmark.save
    end

    redirect to '/landmarks'
  end


  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    if params[:landmark][:figure_id]
      fig = Figure.find(params[:landmark][:figure_id])
      landmark.figure_id = fig.id
      landmark.save
    elsif params[:figure][:name]
      new_fig = Figure.create(name: params[:figure][:name])
      landmark.figure_id = new_fig.id
      landmark.save
    end
    redirect to "/landmarks/#{@landmark.id}"
  end







end
