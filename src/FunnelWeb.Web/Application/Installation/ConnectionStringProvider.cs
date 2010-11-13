﻿using System.Configuration;
using System.Web;
using System.Web.Configuration;

namespace FunnelWeb.Web.Application.Installation
{
    public class ConnectionStringProvider : IConnectionStringProvider
    {
        public string ConnectionString
        {
            get
            {
                var config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                return config.AppSettings.Settings["funnelweb.configuration.database.connection"].Value;
            }
            set
            {
                var config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                config.AppSettings.Settings["funnelweb.configuration.database.connection"].Value = value;
                config.Save(ConfigurationSaveMode.Modified);
            }
        }
    }
}