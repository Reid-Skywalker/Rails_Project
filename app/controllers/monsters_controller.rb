# frozen_string_literal: true

class MonstersController < ApplicationController
  def index
    @monsters = Monster.order(:name)
  end

  # GET /breeds/:id
  def show
    @monster = Monster.find(params[:id])
  end
end
