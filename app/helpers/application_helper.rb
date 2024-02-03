module ApplicationHelper
  def turbo_native?
    request.user_agent.include?('Turbo Native')
  end
end
