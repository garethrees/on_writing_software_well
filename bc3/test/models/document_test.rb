require 'test_helper'

class DocumentTest < ApplicationModelTest
  setup { Current.person = people('37s_david') }

  test 'create document with first version' do
    recording = buckets(:anniversary).record Document.new(title: 'Funk!', content: 'Town')
    document = recording.recordable

    assert_equal 'Funk!', document.title
    assert_equal 'Town', document.content.to_s
  end

  test 'updating a document will keep the old version around through past recordables' do
    recording = buckets(:anniversary).record Document.new(title: 'Funk!', content: 'Town')

    travel 5.seconds

    recording.update! recordable: Document.new(title: 'New order', content: 'This first')

    current_document = recording.reload.recordable_versions.first

    assert_equal 'New order', current_document.title
    assert_equal 'This first', current_document.content.to_s

    previous_document = recording.reload.recordable_versions.second

    assert_equal 'Funk!', previous_document.title
    assert_equal 'Town', previous_document.content.to_s
  end

  test 'creating a document invalidates exports' do
  end

  test 'updating a document invalidates exports' do
  end
end
