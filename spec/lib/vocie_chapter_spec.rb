require "spec_helper"
require 'voice_chapters'

describe Voice_Chapters do

  it "has a run method" do
    text = "In the beginning, God created the heavens and the earth.
            The earth was without form and void, and darkness was over the face of the deep.
            And the Spirit of God was hovering over the face of the waters."
    @voice_chapters = Voice_Chapters.new(text: text,
                                         marker: /([^.!?\s][^.!?]*(?:[.!?](?!['"]?\s|$)[^.!?]*)*[.!?]?['"]?(?=\s|$))/)
    expect(@voice_chapters.chapters).to eq([["In the beginning, God created the heavens and the earth."], ["The earth was without form and void, and darkness was over the face of the deep."], ["And the Spirit of God was hovering over the face of the waters."]])
  end
end