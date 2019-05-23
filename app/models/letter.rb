class Letter
  attr_accessor :name, :updated_at, :type

  def initialize(attributes)
    @name = attributes[:name]
    @updated_at = attributes[:updated_at]
    @type = attributes[:type]
  end

  def self.by_type(type)
    if type.to_s == 'message'
      Letter.by_message
    else
      Letter.by_sms
    end
  end

  def self.by_sms
    LetterOpenerStage.on_file_system do
      letters = Dir.glob("#{LetterOpenerStage.letters_sms_location}/*").map do |folder|
        new name: File.basename(folder), updated_at: File.mtime(folder), type: 'sms'
      end
      letters.sort_by(&:updated_at).reverse
    end
  end

  def self.all
    LetterOpenerStage.on_file_system do
      letters = Dir.glob("#{LetterOpenerStage.letters_location}/*").map do |folder|
        new name: File.basename(folder), updated_at: File.mtime(folder)
      end
      letters.sort_by(&:updated_at).reverse
    end
  end

  def self.by_message
    LetterOpenerStage.on_file_system do
      letters = Dir.glob("#{LetterOpenerStage.letters_message_location}/*").map do |folder|
        new name: File.basename(folder), updated_at: File.mtime(folder), type: 'message'
      end
      letters.sort_by(&:updated_at).reverse
    end
  end

  def self.find_by_name(name)
    new(:name => name)
  end

  def default_style(type = 'message')
    @default_style ||= begin
      [:plain, :rich].detect do |style|
        File.exist? filepath(type, style)
      end
    end
  end

  def filepath(type = 'message', style = :plain)
    "#{LetterOpenerStage.send("letters_#{type}_location")}/#{name}/#{style}.html"
  end

  def contents(type = 'message', style = :plain)
    LetterOpenerStage.on_file_system do
      File.read(filepath(type, style))
    end
  end
end
