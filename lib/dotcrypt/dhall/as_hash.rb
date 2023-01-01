# frozen_string_literal: true

module Dotcrypt::Dhall::AsHash
  refine Dhall::Record do
    def as_hash(*)
      to_h.transform_values(&:as_hash)
    end
  end

  refine Dhall::List do
    def as_hash(*)
      to_a.map(&:as_hash)
    end
  end

  refine Dhall::Text do
    def as_hash(*)
      to_s
    end
  end

  refine Dhall::Natural do
    def as_hash(*)
      to_i
    end
  end

  refine Dhall::Double do
    def as_hash(*)
      to_f
    end
  end

  refine Dhall::Builtins::None do
    def as_hash(*)
      nil
    end
  end
end
