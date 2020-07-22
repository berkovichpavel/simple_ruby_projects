require 'rspec'
require '../lib/gallows.rb'

describe Gallows do
  it 'user wins the game' do
    game = Gallows.new('Answer')
    game.next_step('a')
    game.next_step('b')
    game.next_step('c')
    game.next_step('w')
    game.next_step('n')
    game.next_step('p')
    game.next_step('s')
    game.next_step('e')
    game.next_step('v')
    game.next_step('r')
    expect(game.status).to eq 1
    expect(game.errors).to eq 4
  end

  it 'user loses the game' do
    game = Gallows.new('liberty')
    game.next_step('l')
    game.next_step('a')
    game.next_step('s')
    game.next_step('у')
    game.next_step('t')
    game.next_step('u')
    game.next_step('n')
    game.next_step('r')
    game.next_step('l')
    game.next_step('p')
    game.next_step('z')
    game.next_step('c')
    expect(game.status).to eq -1
    expect(game.errors).to eq 7
  end

end
