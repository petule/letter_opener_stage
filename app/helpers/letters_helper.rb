module LettersHelper
  def inbox_link
    content_tag(:div, class: "letter-link", style: 'position: absolute; top: 0px; right: 0px;') do
      content_tag(:a,  href: letter_opener_letters_path, title: 'Inbox') do
        image_tag('letter_opener_stage/letter.svg', class: 'letter-icon', style: 'width: 25px;') + "(#{Letter.all.count})"
      end

    end
  end
end
