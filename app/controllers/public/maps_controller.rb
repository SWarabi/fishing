class Public::MapsController < ApplicationController
  def map
  # respond_to以下の記述によって、
  # remote: trueのアクセスに対して、
  # map.js.erbが変えるようになります。
  respond_to do |format|
    format.js
      end
  end
end
