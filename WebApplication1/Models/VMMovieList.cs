using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication1.Models
{
    public class VMMovieList
    {
        public IEnumerable<Movie> MoviesList { get; set; }
        public Movie Movie { get; set; }
    }
}
