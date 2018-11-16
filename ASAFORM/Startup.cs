using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ASAFORM.Startup))]
namespace ASAFORM
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
