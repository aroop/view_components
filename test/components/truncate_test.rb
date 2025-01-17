# frozen_string_literal: true

require "test_helper"

class PrimerTruncateTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_renders_truncated_content
    render_inline(Primer::Truncate.new) { "content" }

    assert_selector(".css-truncate.css-truncate-overflow", text: "content")
  end

  def test_renders_truncated_span
    render_inline(Primer::Truncate.new(tag: :span)) { "content" }

    assert_selector("span.css-truncate.css-truncate-overflow", text: "content")
  end

  def test_renders_truncated_inline
    render_inline(Primer::Truncate.new(inline: true)) { "content" }

    assert_selector(".css-truncate.css-truncate-target", text: "content")
  end

  def test_renders_truncated_inline_expandable
    render_inline(Primer::Truncate.new(inline: true, expandable: true)) { "content" }

    assert_selector(".css-truncate.css-truncate-target.expandable", text: "content")
  end

  def test_does_not_render_expandable_when_not_inline
    render_inline(Primer::Truncate.new(expandable: true)) { "content" }

    assert_selector(".css-truncate", text: "content")
    refute_selector(".expandable")
  end

  def test_renders_custom_max_width
    render_inline(Primer::Truncate.new(max_width: 100)) { "content" }

    assert_selector(".css-truncate", text: "content", style: "max-width: 100px;")
  end
end
