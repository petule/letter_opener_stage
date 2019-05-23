module LettersHelper
  def inbox_link
    content_tag(:div, class: "letter-link", style: 'position: absolute; top: 0px; right: 250px;') do
      content_tag(:a,  href: letter_opener_letters_path(type: 'message'), title: 'Inbox', style: 'text-decoration: none') do
        image_tag('letter_opener_stage/letter.svg', class: 'letter-icon', style: 'width: 25px;') + "<strong>(#{Letter.by_message.count})</strong>".html_safe
      end
    end
  end

  def sms_link
    content_tag(:div, class: "letter-link", style: 'position: absolute; top: 0px; right: 190px;') do
      content_tag(:a,  href: letter_opener_letters_path(type: 'sms'), title: 'Inbox', style: 'text-decoration: none') do
        image_tag('letter_opener_stage/sms.png', class: 'letter-icon', style: 'width: 25px;') + "<strong>(#{Letter.by_sms.count})</strong>".html_safe
      end
    end
  end
end
