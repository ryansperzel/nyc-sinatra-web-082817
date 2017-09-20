class FiguresController < ApplicationController


  get '/' do
    redirect to '/figures'
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.create(name: params[:figure][:name])
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title|
        FigureTitle.create(title_id: title, figure_id: figure.id)
      end
    end
    if params[:title][:name]
      title = Title.create(name: params[:title][:name])
      FigureTitle.create(title_id: title.id, figure_id: figure.id)
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark|
        lm = Landmark.find(landmark)
        lm.figure_id = figure.id
        lm.save
      end
    end
    if params[:landmark][:name]
      landmark = Landmark.create(name: params[:landmark][:name])
      landmark.figure_id = figure.id
      landmark.save
    end
    redirect to "/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title|
        FigureTitle.create(title_id: title, figure_id: figure.id)
      end
    end
    if params[:title][:name]
      title = Title.create(name: params[:title][:name])
      FigureTitle.create(title_id: title.id, figure_id: figure.id)
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark|
        lm = Landmark.find(landmark)
        lm.figure_id = figure.id
        lm.save
      end
    end
    if params[:landmark][:name]
      landmark = Landmark.create(name: params[:landmark][:name])
      landmark.figure_id = figure.id
      landmark.save
    end
    redirect to "/figures"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end






end
