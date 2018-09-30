module LettersHelper
  def inbox_link
    content_tag(:div, class: "letter-link") do
      content_tag(:a,  href: letter_opener_letters_path, title: 'Inbox') do
        image_tag('letter_opener_stage/letter.svg', class: 'letter-icon')
      end

    end
  end
end
