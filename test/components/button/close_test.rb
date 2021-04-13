# frozen_string_literal: true

require "test_helper"

class PrimerButtonCloseTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_renders
    render_inline(Primer::Button::Close.new)

    assert_selector("button[type='button'].close-button") do
      assert_selector(".octicon.octicon-x")
    end
  end

  def test_renders_as_submit
    render_inline(Primer::Button::Close.new(type: :submit))

    assert_selector("button[type='submit'].close-button") do
      assert_selector(".octicon.octicon-x")
    end
  end

  def test_renders_defaults_type_to_button
    without_fetch_or_fallback_raises do
      render_inline(Primer::Button::Close.new(type: :invalid))

      assert_selector("button[type='button'].close-button") do
        assert_selector(".octicon.octicon-x")
      end
    end
  end

  def test_does_not_render_content
    render_inline(Primer::Button::Close.new) { "content" }

    refute_text("content")
  end

  def test_does_not_render_as_block
    render_inline(Primer::Button::Close.new(block: true))

    refute_selector(".btn-block")
  end
end
