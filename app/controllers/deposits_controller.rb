# frozen_string_literal: true

class DepositsController < ApplicationController
  def new; end

  def create
    @deposit = deposit.new(deposit_params)
    if @deposit.save
      redirect_to deposit_path(@deposit)
    else
      render 'new'
    end
  end

  def show
    @deposit = deposit.find(params[:phone_number])
  end

    private

  def deposit_params
    params.require(:deposit).permit(:phone_number, :new_deposit, :balance, :pin)
  end
  end
