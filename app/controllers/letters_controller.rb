class LettersController < ApplicationController
  LetterOpenerStage.configuration.skip_actions.each do |action|
    skip_before_action action
  end

  def index
    @letters = Letter.by_type(params[:type])
  end

  def show
    @letter = Letter.find_by_name(params[:id])
    render file: @letter.filepath(params[:type], params[:style]), layout: false
  end

  def delete
    FileUtils.rm_rf("#{LetterOpenerStage.send("letters_#{params[:type]}_location")}/#{params[:id]}")
    redirect_to(letter_opener_letters_path(type: params[:type] ), notice: "The #{params[:type]} was deleted.")
  end
end
