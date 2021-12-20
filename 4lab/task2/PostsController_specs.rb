require 'rspec'
require_relative 'PostsController'

RSpec.describe PostsController do
  it '#create' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Wow, it works!', 0)
    subject.create
    expect{ subject.show }.to output("Enter index of post: id:0 | \"Wow, it works!\"\n").to_stdout
  end

  it '#update' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Wow, it works!', 0, 'Something wrong...')
    subject.create
    subject.update
    expect{ subject.index }.to output("id:0 \n\"Something wrong...\"\n").to_stdout
  end

  it '#destroy' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Wow, it works!', 'We have launched', 0)
    subject.create
    subject.create
    subject.destroy
    expect{ subject.index }.to output("id:0 \n\"We have launched\"\n").to_stdout
  end

  it '#index' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Wow, it works!', 'We have launched')
    subject.create
    subject.create
    expect{ subject.index }.to output("id:0 \n\"Wow, it works!\"\nid:1 \n\"We have launched\"\n").to_stdout
  end

  it '#show' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Wow, it works!', 'We have launched', 1)
    subject.create
    subject.create
    expect{ subject.show }.to output("Enter index of post: id:1 | \"We have launched\"\n").to_stdout
  end
end