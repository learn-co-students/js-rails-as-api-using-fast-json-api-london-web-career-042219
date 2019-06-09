class SightingsController < ApplicationController
  def show
    @sighting = Sighting.find(params[:id])
    render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
  
    options = {}
    options[:include] = [:bird, :location]
    render json: SightingSerializer.new(@sighting, options).serializable_hash
  end

  def index
    @sightings = Sighting.all
    options = {}
    options[:include] = [:bird, :location]
    render json: SightingSerializer.new(@sightings, options).serializable_hash
  end
  
  end