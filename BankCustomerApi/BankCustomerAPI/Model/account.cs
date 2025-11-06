using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Model
{
    [Table("Accounts", Schema = "training")]
    public class Account
    {
        [Key]
        public int AccountId { get; set; }

        // Foreign keys
        public int UserId { get; set; }

        [ForeignKey("UserId")]
        public User User { get; set; }

        public int BranchId { get; set; }

        [ForeignKey("BranchId")]
        public Branch Branch { get; set; }

        // Account details
        [Required, StringLength(50)]
        public string AccountType { get; set; }  

        [Required, StringLength(3)]
        public string Currency { get; set; } = "INR";

        [Column(TypeName = "decimal(18,2)")]
        public decimal Balance { get; set; } = 0.00M;

        public bool IsMinorAccount { get; set; } = false;
        public bool IsPOA { get; set; } = false;

        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
