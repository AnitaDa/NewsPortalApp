using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace SoftraySolution.WebAPI.Models
{
    public partial class PortalContext : DbContext
    {
        public PortalContext()
        {
        }

        public PortalContext(DbContextOptions<PortalContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Administrator> Administrators { get; set; }
        public virtual DbSet<AdministratorPost> AdministratorPosts { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<Rola> Rolas { get; set; }
        public virtual DbSet<UserN> UserNs { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=(local);Database=Portal;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Administrator>(entity =>
            {
                entity.ToTable("Administrator");

                entity.Property(e => e.FirstName).HasMaxLength(20);

                entity.Property(e => e.LastName).HasMaxLength(20);
            });

            modelBuilder.Entity<AdministratorPost>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("AdministratorPost");

                entity.HasOne(d => d.Administrator)
                    .WithMany()
                    .HasForeignKey(d => d.AdministratorId)
                    .HasConstraintName("FK__Administr__Admin__3F466844");

                entity.HasOne(d => d.Post)
                    .WithMany()
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("FK__Administr__PostI__403A8C7D");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.ToTable("Post");

                entity.Property(e => e.Content).IsUnicode(false);

                entity.Property(e => e.Phone).HasMaxLength(20);

                entity.Property(e => e.PostDate).HasColumnType("datetime");

                entity.Property(e => e.Title).HasMaxLength(100);
            });

            modelBuilder.Entity<Rola>(entity =>
            {
                entity.ToTable("Rola");

                entity.Property(e => e.RolaName).HasMaxLength(20);
            });

            modelBuilder.Entity<UserN>(entity =>
            {
                entity.ToTable("UserN");

                entity.Property(e => e.UserNid).HasColumnName("UserNId");

                entity.Property(e => e.Email).HasMaxLength(30);

                entity.Property(e => e.LozinkaHash).HasMaxLength(50);

                entity.Property(e => e.LozinkaSalt).HasMaxLength(50);

                entity.Property(e => e.UserName).HasMaxLength(30);

                entity.HasOne(d => d.Administrator)
                    .WithMany(p => p.UserNs)
                    .HasForeignKey(d => d.AdministratorId)
                    .HasConstraintName("FK_UserN_Administrator");

                entity.HasOne(d => d.Rola)
                    .WithMany(p => p.UserNs)
                    .HasForeignKey(d => d.RolaId)
                    .HasConstraintName("FK__UserN__RolaId__3C69FB99");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
