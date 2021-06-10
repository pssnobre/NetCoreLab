using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace WebApplication1.Models
{
    public partial class Movie
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "The field is required.")]
        public string Title { get; set; }
        [Required(ErrorMessage = "The field is required.")]
        public string Description { get; set; }
        public int? Year { get; set; }
        public int? Category { get; set; }

        public virtual Category CategoryNavigation { get; set; }
    }
}
