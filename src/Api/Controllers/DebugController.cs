using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers;

[ApiController]
[Route("[controller]")]
public class DebugController : ControllerBase
{
    private readonly ILogger<DebugController> _logger;
    private readonly IConfiguration _configuration;

    public DebugController(ILogger<DebugController> logger, IConfiguration configuration)
    {
        _logger = logger;
        _configuration = configuration;
    }

    [HttpGet("GetSecretSetting")]
    public string GetSecretSetting()
    {
        var value = _configuration.GetSection("MySecretSetting").Get<string>();
        return value;
    }
}