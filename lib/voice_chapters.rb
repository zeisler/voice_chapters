#require "voice_chapters/version"
require_relative "voice"
require 'digest/sha1'
require_relative 'afinfo'
require 'chapter'

class Voice_Chapters
  attr_reader :chapters
  def initialize(text:nil, marker:nil, file_name:file_name)
    @text = text
    @file_name = file_name
    chapter_marker(marker)
    create_uuid
    create_audio_folder
    create_audio_for_chapters
    create_audio_for_text
    set_chapter_marker
    clean_chapter_file
  end

  def create_audio_folder
    Dir.mkdir(File.expand_path('audio',Dir.pwd)) unless File.directory? File.expand_path('audio',Dir.pwd)
  end

  def chapter_marker(expression)
    @chapters = @text.scan expression
  end

  def create_uuid
    @uuid = (Digest::SHA1.hexdigest @text)[0...8]
  end

  def file_name
    @file_names[@uuid] = @chapters
  end

  def create_audio_for_chapters
    @chapter_files = []
    @chapters.each_with_index do |chapter, index|
      @chapter_files << "#{@uuid}-#{index}.aiff"
      Voice.new({ string: chapter,
                  "output-file" => "#{save_dir}/#{@chapter_files.last}" })
    end
  end

  def chapters_mark_hash
    @chapter_files.each_with_index.map do |file, index|
      {'title' => @chapters[index].first[0..18] + '...', 'duration' => get_file_duration(file)}
    end
  end

  def get_file_duration(file)
    (Afinfo.duration("#{save_dir}/#{file}").to_f * 1000).ceil
  end

  def create_audio_for_text
    Voice.new({ string: @text,
                "output-file" => "'#{save_dir}/#{@file_name}.m4a'",
                "file-format" => "m4af" })
  end

  def set_chapter_marker
    file = "#{save_dir}/#{@file_name}.m4a"
    chapters = chapters_mark_hash
    puts "Chapter.set_chapters('#{file}', #{chapters})"
    Chapter.set_chapters(file, chapters)
  end

  def save_dir
    File.expand_path('audio',Dir.pwd)
  end

  def clean_chapter_file
    @chapter_files.each do |file|
      File.delete "#{save_dir}/#{file}"
    end
  end

end
