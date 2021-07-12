
ALTER TABLE [dbo].[Documents] ADD TechPartnerId int NULL --Do you require any type of integration with advertisers?
go

CREATE TABLE [dbo].[TechPartner](
	[Id] [int] NOT NULL,
	[LongId] [uniqueidentifier] NOT NULL,
	
	--About your Company
	[BussinessName] [nvarchar](max) NULL,
	[BussinessWebsite] [nvarchar](max) NULL,
	[HeadquartersCountryId] [int] NOT NULL, --Headquarters location
	[OperateRegionId] [int] NOT NULL, --Regions where you operate
	[CompanySizeId] [int] NOT NULL, --Company size
	--Social media page URL (x3 for Facebook, Linkedin, Twitter)
	[ProfileTwitter] [nvarchar](max) NULL,
	[ProfileFacebook] [nvarchar](max) NULL,
	[ProfileLinkedIn] [nvarchar](max) NULL,
	[IsLocalContact] [bit] NOT NULL, --Is there a local Australian or APAC contact? 
	[ContactName] [nvarchar](max) NULL,
	[ContactEmail] [nvarchar](max) NULL,
	[ContactPhone] [nvarchar](max) NULL,
	
	--About your Technology
	[TechnologyAddressId] [int] NOT NULL, --Business needs that your technology address
	[SolutionOfferingId] [int] NOT NULL, -- Type of solution offering
	[SolutionOfferingDescription] [nvarchar](max) NULL, --Solution offering description (this will be visible on your profile listing if your application is approved)
	[MinimumRequirements] [nvarchar](max) NULL, --Minimum requirements (for example, minimum number of users)
	[PlatformSupport] [nvarchar](max) NULL, --Which platforms does your technology support?
	[IsExternalAnalyticsDashboard] [bit] NOT NULL, --Is there an external analytics dashboard available for your clients? 
	[TypeIntegration] [int] NULL, --What type of integration is required?

	--Commercial model & needs
	[CommercialModels] [nvarchar](max) NULL, --What is your preferred commercial model(s)?
	[IntegrationFee] [decimal](18, 2) NULL, --Do you have an upfront integration fee?
	[MonthlyFee] [decimal](18, 2) NULL, --Do you have a monthly fee?
	[ContractRequirements] [nvarchar](max) NULL, --Do you have any contract requirements?
	[OtherDetails] [nvarchar](max) NULL, --Do you have any other details you wanted to include?

	--Common
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[DateApproved] [datetime] NULL,
	[Avatar] [uniqueidentifier] NULL,
	[Status] [int] NOT NULL,
	[OwnerId] [int] NOT NULL,

 CONSTRAINT [PK__TechPartner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[TechPartner] ADD  CONSTRAINT [DF__TechPartner__DateC]  DEFAULT (CONVERT([datetime],(sysdatetimeoffset() AT TIME ZONE N'AUS Eastern Standard Time'))) FOR [DateCreated]
GO

ALTER TABLE [dbo].[TechPartner] ADD  CONSTRAINT [DF__TechPartner__DateM]  DEFAULT (CONVERT([datetime],(sysdatetimeoffset() AT TIME ZONE N'AUS Eastern Standard Time'))) FOR [DateModified]
GO