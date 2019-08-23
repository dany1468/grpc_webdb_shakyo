this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(File.dirname(this_dir), 'echo', 'proto')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'echo_services_pb'

class ServerImpl < Echo::EchoService::Service
  def echo(req, _call)
    Echo::EchoResponse.new(message: req.message)
  end
end

addr = "0.0.0.0:50051"
s = GRPC::RpcServer.new
s.add_http2_port(addr, :this_port_is_insecure)
s.handle(ServerImpl.new)
s.run_till_terminated
