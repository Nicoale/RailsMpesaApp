class  WithdrawalsController < ApplicationController
    def new
    end
    def create
      @withdrawal = withdrawal.new(withdrawal_params)
      if @withdrawal.save
        redirect_to withdrawal_path(@withdrawal)
      else
        render 'new'
      end
    end
    def show
      @withdrawal = withdrawal.find(params[:phone_number])
    end
  
    private
    def withdrawal_params
      params.require(:withdrawal).permit( :phone_number, :agent_number,:amount, :pin )
    end
  end