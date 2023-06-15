class Dashboard < ActiveRecord::Base
end

class User < ActiveRecord::Base
  include Filterable

  belongs_to :role
  belongs_to :company
  has_many :tasks

  filterable do
    columns :name, :email
  end
end

class Role <ActiveRecord::Base
  include Filterable

  has_many :users

  filterable do
    associated_column :name, from: :users
  end
end

class Company < ActiveRecord::Base
  include Filterable

  has_many :projects
  has_many :users
  has_many :tasks, through: :projects

  filterable do
    column :title
    associated_column :deadline_on, from: :projects
  end
end

class Project < ActiveRecord::Base
  include Filterable

  belongs_to :company
  has_many :tasks

  filterable do
    associated_column :title, from: :tasks
    column :deadline_on
  end
end

class Task < ActiveRecord::Base
  include Filterable

  belongs_to :project
  belongs_to :user

  filterable do
    column :user_id
    column :finished_at
  end
end
