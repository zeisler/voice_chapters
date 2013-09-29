# Voice Chapters

Using the Mac system text-to-speech Voice Chapters will create an audio file
with bookmarked chapters. It takes a regex capture
group to define the chapter markers and the gem will create a m4a/acc file.

## Installation

Add this line to your application's Gemfile:

    gem 'voice_chapters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voice_chapters

## Usage

    require 'voice_chapters'

    text = 'In the beginning, God created the heavens and the earth.2 The earth was without form and void, and darkness was over the face of the deep. And the Spirit of God was hovering over the face of the waters. 3 And God said, “Let there be light,” and there was light. 4 And God saw that the light was good. And God separated the light from the darkness. 5 God called the light Day, and the darkness he called Night. And there was evening and there was morning, the first day.'

    Voice_Chapters.new(text: text,
                       file_name: 'In_the_Beginning',
                       marker: /(\D+)/) # Mark by verse

    # Will save the file in the current directory under
    # /audio/:file_name.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
