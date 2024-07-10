class User < ApplicationRecord
  serialize :hobbies, Array, coder: YAML
end
