module ActorsHelper
  def actor_options(cur_id)
    Actor.all.map do |x|
      cur_id == x.id ? [x.fn + " (текущий)", x.id] : [x.fn, x.id]
    end
  end

  def new_actor_form(form)
    form.fields_for(:actor, Actor.new) do |ar|
      render 'films/one_actor_form', ar: ar
    end
  end

  def exist_actor_form(form)
    form.fields_for(:actor) do |ar|
      render 'films/one_actor_form', ar: ar
    end
  end
end
