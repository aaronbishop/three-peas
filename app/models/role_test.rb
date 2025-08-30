class RoleTest < ApplicationRecord
  enum :status, { foo: 0, bar: 1 }
end
