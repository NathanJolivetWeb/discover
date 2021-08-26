class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
  end
end
