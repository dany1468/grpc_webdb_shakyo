this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(File.dirname(this_dir), 'echo', 'proto')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'echo_services_pb'

client = Echo::EchoService::Stub.new('localhost:50051', :this_channel_is_insecure)
resp = client.echo(Echo::EchoRequest.new(message: 'hello grpc!!'))

p resp.message
