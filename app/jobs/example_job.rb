class ExampleJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(*args)
    cable_ready["example-stream"].inner_html(
        selector: "#content",
        html: "Hello World this is the background job."
    )
    cable_ready.broadcast
  end
end
