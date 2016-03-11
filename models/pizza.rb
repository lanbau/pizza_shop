class Pizza < ActiveRecord::Base
  def nice_name
    "Hello #{name} #{sauce}"
  end

  def style_class
    if cheese
      "cheesy"
    else
      "non_cheesy"
    end
  end
end
