module World
  def self.setup_schema
    Sequel::Model.db.instance_eval do
      create_table! :people do
        primary_key :id
        int         :owner_id
        text        :state_function
        varchar     :first_name
        varchar     :last_name
        datetime    :created_at
      end
    end
  end
end
