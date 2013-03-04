module Sangaku
  module Errors
    class OpenPolygonError < StandardError
      def initialize
        super "Expected poly to be closed."
      end
    end
  end
end
