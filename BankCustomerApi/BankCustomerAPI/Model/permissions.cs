using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Model
{
    [Table("Permissions", Schema = "training")]
    public class Permission
    {
        [Key]
        public int PermissionId { get; set; }

        [Required, StringLength(50)]
        public string PermissionName { get; set; }

        [StringLength(255)]
        public string? Description { get; set; }
    }
}
