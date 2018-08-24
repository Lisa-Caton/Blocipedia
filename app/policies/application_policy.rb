class ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end
  #This means no1 should be able to access index

  def show?
    false #<-This was the default
    # scope.where(:id => wiki.id).exists?
  end
  #It should only show if the record exists

  def create?
    false
  end
  #Create should not be available
  #This is where the actual record is created
  #Actual logic goes here (true or false)

  def new?
    create?
  end
  #Mapping 'new' to the 'create'
  #'new' is viewing a form for that action (create)

  def update?
    false
  end

  def edit?
    update?
  end
  #'edit' is just an alias for 'update'
  #same thing happening here with 'update'

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
