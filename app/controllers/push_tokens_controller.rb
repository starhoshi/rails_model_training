class PushTokensController < ApplicationController
  before_action :set_push_token, only: [:show, :edit, :update, :destroy]

  # GET /push_tokens
  # GET /push_tokens.json
  def index
    @push_tokens = PushToken.all
  end

  # GET /push_tokens/1
  # GET /push_tokens/1.json
  def show
  end

  # GET /push_tokens/new
  def new
    @push_token = PushToken.new
  end

  # GET /push_tokens/1/edit
  def edit
  end

  # POST /push_tokens
  # POST /push_tokens.json
  def create
    @push_token = PushToken.new(push_token_params)

    respond_to do |format|
      if @push_token.save
        format.html { redirect_to @push_token, notice: 'Push token was successfully created.' }
        format.json { render :show, status: :created, location: @push_token }
      else
        format.html { render :new }
        format.json { render json: @push_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /push_tokens/1
  # PATCH/PUT /push_tokens/1.json
  def update
    respond_to do |format|
      if @push_token.update(push_token_params)
        format.html { redirect_to @push_token, notice: 'Push token was successfully updated.' }
        format.json { render :show, status: :ok, location: @push_token }
      else
        format.html { render :edit }
        format.json { render json: @push_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_tokens/1
  # DELETE /push_tokens/1.json
  def destroy
    @push_token.destroy
    respond_to do |format|
      format.html { redirect_to push_tokens_url, notice: 'Push token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_push_token
      @push_token = PushToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def push_token_params
      params.require(:push_token).permit(:user_id, :os, :push_token)
    end
end
