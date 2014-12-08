require 'ruby-progressbar'

module Enumerable
  def each_with_progressbar(options = { format: "%t: |%B| %p%% %c/%C %E" })
    return to_enum(:each_with_progressbar) unless block_given?
    options.merge!(total: length) if respond_to?(:length)
    progressbar = ProgressBar.create(options)
    each do |blk|
      progressbar.increment
      yield blk
    end
  end

  alias :each_with_pb :each_with_progressbar
  alias :each_with_progress_bar :each_with_progressbar
end
