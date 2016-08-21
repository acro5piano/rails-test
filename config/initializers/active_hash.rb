# If you extend ActiveRecord::Base, it will not work.
# If you want to extend ActiveRecord::Base so all your AR models can belong to ActiveHash::Base objects,
# you can use the belongs_to_active_hash method:

ActiveRecord::Base.extend ActiveHash::Associations::ActiveRecordExtensions
