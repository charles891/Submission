
CREATE TABLE Roles (
    RoleId INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(255)
);

CREATE TABLE Permissions (
    PermissionId INT IDENTITY(1,1) PRIMARY KEY,
    PermissionName VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(255)
);

CREATE TABLE RolePermissions (
    RoleId INT NOT NULL,
    PermissionId INT NOT NULL,
    PRIMARY KEY (RoleId, PermissionId),
    FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
    FOREIGN KEY (PermissionId) REFERENCES Permissions(PermissionId)
);

CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    RoleId INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
);

CREATE TABLE Banks (
    BankId INT IDENTITY(1,1) PRIMARY KEY,
    BankName VARCHAR(100) NOT NULL UNIQUE,
    HeadOfficeAddress VARCHAR(255)
);

CREATE TABLE Branches (
    BranchId INT IDENTITY(1,1) PRIMARY KEY,
    BankId INT NOT NULL,
    BranchName VARCHAR(100) NOT NULL,
    BranchAddress VARCHAR(255),
    FOREIGN KEY (BankId) REFERENCES Banks(BankId)
);

CREATE TABLE Accounts (
    AccountId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    BranchId INT NOT NULL,
    AccountType VARCHAR(50) NOT NULL CHECK (AccountType IN ('Saving', 'Current', 'TermDeposit')),
    Currency CHAR(3) NOT NULL DEFAULT 'INR',
    Balance DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    IsMinorAccount BIT DEFAULT 0,
    IsPOA BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (BranchId) REFERENCES Branches(BranchId)
);
