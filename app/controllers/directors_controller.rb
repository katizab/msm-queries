class DirectorsController < ApplicationController
  
  def index
      render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch ("the_id")

    matching_records = Director.where({ :id=> the_id })
    
    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest

    min_dob = Director.maximum(:dob)

    youngest = Director.where({ :dob=> min_dob })

    @minimum_dob = min_dob
    @director_name = youngest.at(0)
    
    render({ :template => "director_templates/youngest"})
  end

  def eldest
    max_dob = Director.minimum(:dob)

    eldest = Director.where({ :dob=> max_dob })

    @minimum_dob = max_dob
    @director_name_old = eldest.at(0)
    
    render({ :template => "director_templates/eldest"})
  end
end
