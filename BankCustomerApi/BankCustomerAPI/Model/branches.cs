using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Model
{
    [Table("Branches", Schema = "training")]
    public class Branch
    {
        [Key]
        public int BranchId { get; set; }

        public int BankId { get; set; }

        public string BranchName { get; set; }

        [ForeignKey("BankId")]
        public Bank Bank { get; set; }

       
        public ICollection<Account> Accounts { get; set; } = new List<Account>();
    }
}
