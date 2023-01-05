class Api::V1::ConversationsController < ApplicationController
  before_action :set_api_v1_conversation, only: %i[ show update destroy ]

  # GET /api/v1/conversations
  def index
    @api_v1_conversations = Api::V1::Conversation.all

    render json: @api_v1_conversations
  end

  # GET /api/v1/conversations/1
  def show
    render json: @api_v1_conversation
  end

  # POST /api/v1/conversations
  def create
    @api_v1_conversation = Api::V1::Conversation.new(api_v1_conversation_params)

    if @api_v1_conversation.save
      render json: @api_v1_conversation, status: :created, location: @api_v1_conversation
    else
      render json: @api_v1_conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/conversations/1
  def update
    if @api_v1_conversation.update(api_v1_conversation_params)
      render json: @api_v1_conversation
    else
      render json: @api_v1_conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/conversations/1
  def destroy
    @api_v1_conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_conversation
      @api_v1_conversation = Api::V1::Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_conversation_params
      params.fetch(:api_v1_conversation, {})
    end
end
