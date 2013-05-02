class Vimeo < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1
      
      if $2.nil? then
          @width = 560
          @height = 420
      else
          @width = $3.to_i
          @height = $4.to_i
      end
    else
      raise "No Vimeo ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    "<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://player.vimeo.com/video/#{@id}\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>"
  end

  Liquid::Template.register_tag "vimeo", self
end
