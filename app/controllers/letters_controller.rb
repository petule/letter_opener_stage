class LettersController < ApplicationController
  def index
    @letters = Letter.all
  end

  def show
    @letter = Letter.find_by_name(params[:id])
    render text: @letter.contents(params[:style])
  end

  def delete
    FileUtils.rm_rf("#{LetterOpenerStage.letters_location}/#{params[:id]}")
    redirect_to(letter_opener_letters_path, notice: 'The mail was deleted.')
  end
end
