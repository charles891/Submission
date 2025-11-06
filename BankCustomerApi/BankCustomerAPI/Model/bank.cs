using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Model
{
    [Table("Banks", Schema = "training")] 
    public class Bank
    {
        [Key]
        public int BankId { get; set; }

        [Required, StringLength(100)]
        public string BankName { get; set; }

        [StringLength(255)]
        public string? HeadOfficeAddress { get; set; }

        public virtual ICollection<Branch>? Branches { get; set; }
    }
}
