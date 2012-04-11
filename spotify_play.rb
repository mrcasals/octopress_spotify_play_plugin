# A Liquid tag for Jekyll sites that allows embedding Spotify Play buttons
# by: Marc Riera (mrcasals)
#
# Source url: https://github.com/mrcasals/spotify_play_plugin
# Post: http://mrcasals.github.com/blog/2012/04/11/my-first-octopress-plugin-spotify-play-button/
#
# Example usage: 
#   {% spotify spotify:track:556BL7XJ7PFXX8r3ozKYVa %} // embeds Spotify Play
#                                                      // Button
#

require 'cgi'

module Jekyll
  class SpotifyPlay < Liquid::Tag
    def initialize(tag_name, text, token)
      super
      @spotify_uri = text
    end

    def render(context)
      html_output_for @spotify_uri
    end

    def html_output_for(spotify_uri)
"<div class='spotify_play_button'>
<iframe src='https://embed.spotify.com/?uri=#{spotify_uri}' width='300' height='380' frameborder='0' allowtransparency='true'></iframe>
</div>"
    end
  end
end

Liquid::Template.register_tag('spotify', Jekyll::SpotifyPlay)
