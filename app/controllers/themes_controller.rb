class ThemesController < ApplicationController

  def themes
  end

  def mountain
    $background_path = "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1140&q=80"
    redirect_to '/themes'
  end

  def ocean
    $background_path = "https://images.unsplash.com/photo-1551342453-84c4a54b25d7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
    redirect_to '/themes'
  end

  def clouds
    $background_path = "https://images.unsplash.com/photo-1460411794035-42aac080490a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
    redirect_to '/themes'
  end

  def wall
    $background_path = "https://images.unsplash.com/photo-1531685250784-7569952593d2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"
    redirect_to '/themes'
  end

  def bee
    $background_path = "https://images.theconversation.com/files/310057/original/file-20200114-151829-sg9hr7.jpg"
    redirect_to '/themes'
  end

  def gradient
    $background_path = "https://images.unsplash.com/photo-1508615039623-a25605d2b022?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
    redirect_to '/themes'
  end

end
