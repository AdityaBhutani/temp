class Event < ApplicationRecord
    validates :event_type, inclusion: {in: %w[PushEvent ReleaseEvent WatchEvent]}

    scope :public_events, -> { where(public: true) }
    scope :private_events, -> { where(public: false) }
    
    def serialize
        {
            id: id,
            event_type: event_type,
            public: public,
            repo_id: repo_id,
            actor_id: actor_id
        }
    end
end
