# frozen_string_literal: true

module MarkdownHelper
  class CustomRender < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def md_format(text)
    renderer = CustomRender.new(render_options)
    Redcarpet::Markdown.new(renderer, extensions).render(text)
  end

  private

  def render_options
    {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow' }
    }
  end

  def extensions
    {
      autolink: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true
    }
  end
end
