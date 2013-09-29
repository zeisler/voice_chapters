require "spec_helper"
require 'voice_chapters'

describe Voice_Chapters do

  before do
    text = "In the beginning, God created the heavens and the earth.
            The earth was without form and void, and darkness was over the face of the deep.
            And the Spirit of God was hovering over the face of the waters.
            And God said, “Let there be light,” and there was light.
            And God saw that the light was good. And God separated the light from the darkness.
            God called the light Day, and the darkness he called Night.
            And there was evening and there was morning, the first day."
    @file_name = "In_The_Beginning"
    @file_path = ("#{File.expand_path('audio',Dir.pwd)}/#{@file_name}.m4a")
    @voice_chapters = Voice_Chapters.new(text: text,
                                         file_name: @file_name,
                                         marker: /([^.!?\s][^.!?]*(?:[.!?](?!['"]?\s|$)[^.!?]*)*[.!?]?['"]?(?=\s|$))/)
  end

  it "parses text by expression" do
    expect(@voice_chapters.chapters.length).to eq(8)
  end

  it "makes a file in audio directory named from param" do

    expect(File.exist?(@file_path)).to eq(true)
  end

  it "has chapters" do
    result = Chapter.chapters @file_path
    expect(result.length).to eq(8)
  end
end