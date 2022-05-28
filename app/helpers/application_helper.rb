# frozen_string_literal: true

module ApplicationHelper
  def md_format(text)
    options = { no_intra_emphasis: true, fenced_code_blocks: true, autolink: true, strikethrough: true,
                hard_wrap: true, disable_indented_code_blocks: true }
    Markdown.new(text, options).to_html
  end
end
