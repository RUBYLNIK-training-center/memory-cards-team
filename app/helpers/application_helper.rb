# frozen_string_literal: true

module ApplicationHelper
  def md_format(text)
    options = %i[no_intra_emphasis fenced_code_blocks autolink strikethrough
                 hard_wrap disable_indented_code_blocks]
    Markdown.new(text, *options).to_html
  end
end
