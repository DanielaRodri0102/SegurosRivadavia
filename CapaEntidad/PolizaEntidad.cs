using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class PolizaEntidad
    {
        public int id { get; set; }
        public String cobertura { get; set; }
        public int idAsociado { get; set; }
        public int idVehiculo { get; set; }
    }
}
