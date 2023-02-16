class BookPresenter
    def initialize(model)
        @model = model
    end

    def release_date
        @model.release_date&.to_date
    end
end