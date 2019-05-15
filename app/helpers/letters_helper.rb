module LettersHelper
  def inbox_link
    content_tag(:div, class: "letter-link", style: 'position: absolute; top: 0px; right: 250px;') do
      content_tag(:a,  href: letter_opener_letters_path, title: 'Inbox', style: 'text-decoration: none') do
        image_tag('letter_opener_stage/letter.svg', class: 'letter-icon', style: 'width: 25px;') + "<strong>(#{Letter.all.count})</strong>".html_safe
      end
    end
  end
end
