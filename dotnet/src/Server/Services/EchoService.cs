using System;
using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.Extensions.Logging;

namespace Server
{
    public class EchoService : Echo.EchoService.EchoServiceBase
    {
        private readonly ILogger<EchoService> _logger;
        public EchoService(ILogger<EchoService> logger)
        {
            _logger = logger;
        }

        public override Task<Echo.EchoResponse> Echo(Echo.EchoRequest request, ServerCallContext context)
        {
            return Task.FromResult(new Echo.EchoResponse
            {
                Message = request.Message
            });
        }
    }
}
