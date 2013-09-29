class Afinfo

  def self.file(file_name)
    `afinfo #{file_name}`
  end

  def self.duration(file_name)
    (self.file(file_name).scan /duration:\s(\d+.\d+)/).flatten.first
  end

end