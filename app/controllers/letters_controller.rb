class LettersController < ApplicationController
  LetterOpenerStage.configuration.skip_actions.each do |action|
    skip_before_action action
  end

  def index
    @letters = Letter.all
  end

  def show
    @letter = Letter.find_by_name(params[:id])
    render file: @letter.filepath(params[:style]), layout: false
  end

  def delete
    FileUtils.rm_rf("#{LetterOpenerStage.letters_location}/#{params[:id]}")
    redirect_to(letter_opener_letters_path, notice: 'The mail was deleted.')
  end
end
