# frozen_string_literal: true

FactoryBot.define do
  factory :ejecution_record do
    description 'MyString'
    scheduled_at '2018-05-20'
    estimated_duration 1
    finish_at '2018-05-20'
    comments 'MyString'
    machine nil
  end
end
