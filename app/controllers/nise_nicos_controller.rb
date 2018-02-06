class NiseNicosController < ApplicationController
  def index
    data = ['NAblOQAwdNA', 'se81FHyNQzg', 'UeMNFTo0Fx0', 'Shh9iIP-90Y']
    @movie = data.sample
  end
end
