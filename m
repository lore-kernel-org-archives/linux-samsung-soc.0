From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV210: Use REGULATOR_SUPPLY macro for regulator consumers
Date: Fri, 28 Jan 2011 18:29:20 +0900
Message-ID: <1296206960-28148-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37610 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529Ab1A1Jzr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jan 2011 04:55:47 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

To use REGULATOR_SUPPLY macro is cleaner for initializing regulator
consumer supply.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |   52 +++++++++++-----------------------
 arch/arm/mach-s5pv210/mach-goni.c   |   52 +++++++++++-----------------------
 2 files changed, 34 insertions(+), 70 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 461aa03..38b3d67 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -296,13 +296,11 @@ static struct regulator_init_data aquila_ldo17_data = {
 };
 
 /* BUCK */
-static struct regulator_consumer_supply buck1_consumer[] = {
-	{	.supply	= "vddarm", },
-};
+static struct regulator_consumer_supply buck1_consumer =
+	REGULATOR_SUPPLY("vddarm", NULL);
 
-static struct regulator_consumer_supply buck2_consumer[] = {
-	{	.supply	= "vddint", },
-};
+static struct regulator_consumer_supply buck2_consumer =
+	REGULATOR_SUPPLY("vddint", NULL);
 
 static struct regulator_init_data aquila_buck1_data = {
 	.constraints	= {
@@ -313,8 +311,8 @@ static struct regulator_init_data aquila_buck1_data = {
 		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
 				  REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies	= ARRAY_SIZE(buck1_consumer),
-	.consumer_supplies	= buck1_consumer,
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &buck1_consumer,
 };
 
 static struct regulator_init_data aquila_buck2_data = {
@@ -326,8 +324,8 @@ static struct regulator_init_data aquila_buck2_data = {
 		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
 				  REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies	= ARRAY_SIZE(buck2_consumer),
-	.consumer_supplies	= buck2_consumer,
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &buck2_consumer,
 };
 
 static struct regulator_init_data aquila_buck3_data = {
@@ -388,26 +386,14 @@ static struct max8998_platform_data aquila_max8998_pdata = {
 #endif
 
 static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[] = {
-	{
-		.dev_name	= "5-001a",
-		.supply		= "DBVDD",
-	}, {
-		.dev_name	= "5-001a",
-		.supply		= "AVDD2",
-	}, {
-		.dev_name	= "5-001a",
-		.supply		= "CPVDD",
-	},
+	REGULATOR_SUPPLY("DBVDD", "5-001a"),
+	REGULATOR_SUPPLY("AVDD2", "5-001a"),
+	REGULATOR_SUPPLY("CPVDD", "5-001a"),
 };
 
 static struct regulator_consumer_supply wm8994_fixed_voltage1_supplies[] = {
-	{
-		.dev_name	= "5-001a",
-		.supply		= "SPKVDD1",
-	}, {
-		.dev_name	= "5-001a",
-		.supply		= "SPKVDD2",
-	},
+	REGULATOR_SUPPLY("SPKVDD1", "5-001a"),
+	REGULATOR_SUPPLY("SPKVDD2", "5-001a"),
 };
 
 static struct regulator_init_data wm8994_fixed_voltage0_init_data = {
@@ -456,15 +442,11 @@ static struct platform_device wm8994_fixed_voltage1 = {
 	},
 };
 
-static struct regulator_consumer_supply wm8994_avdd1_supply = {
-	.dev_name	= "5-001a",
-	.supply		= "AVDD1",
-};
+static struct regulator_consumer_supply wm8994_avdd1_supply =
+	REGULATOR_SUPPLY("AVDD1", "5-001a");
 
-static struct regulator_consumer_supply wm8994_dcvdd_supply = {
-	.dev_name	= "5-001a",
-	.supply		= "DCVDD",
-};
+static struct regulator_consumer_supply wm8994_dcvdd_supply =
+	REGULATOR_SUPPLY("DCVDD", "5-001a");
 
 static struct regulator_init_data wm8994_ldo1_data = {
 	.constraints	= {
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index e22d511..db16d72 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -436,13 +436,11 @@ static struct regulator_init_data goni_ldo17_data = {
 };
 
 /* BUCK */
-static struct regulator_consumer_supply buck1_consumer[] = {
-	{	.supply	= "vddarm", },
-};
+static struct regulator_consumer_supply buck1_consumer =
+	REGULATOR_SUPPLY("vddarm", NULL);
 
-static struct regulator_consumer_supply buck2_consumer[] = {
-	{	.supply	= "vddint", },
-};
+static struct regulator_consumer_supply buck2_consumer =
+	REGULATOR_SUPPLY("vddint", NULL);
 
 static struct regulator_init_data goni_buck1_data = {
 	.constraints	= {
@@ -453,8 +451,8 @@ static struct regulator_init_data goni_buck1_data = {
 		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
 				  REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies	= ARRAY_SIZE(buck1_consumer),
-	.consumer_supplies	= buck1_consumer,
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &buck1_consumer,
 };
 
 static struct regulator_init_data goni_buck2_data = {
@@ -466,8 +464,8 @@ static struct regulator_init_data goni_buck2_data = {
 		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
 				  REGULATOR_CHANGE_STATUS,
 	},
-	.num_consumer_supplies	= ARRAY_SIZE(buck2_consumer),
-	.consumer_supplies	= buck2_consumer,
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &buck2_consumer,
 };
 
 static struct regulator_init_data goni_buck3_data = {
@@ -528,26 +526,14 @@ static struct max8998_platform_data goni_max8998_pdata = {
 #endif
 
 static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[] = {
-	{
-		.dev_name	= "5-001a",
-		.supply		= "DBVDD",
-	}, {
-		.dev_name	= "5-001a",
-		.supply		= "AVDD2",
-	}, {
-		.dev_name	= "5-001a",
-		.supply		= "CPVDD",
-	},
+	REGULATOR_SUPPLY("DBVDD", "5-001a"),
+	REGULATOR_SUPPLY("AVDD2", "5-001a"),
+	REGULATOR_SUPPLY("CPVDD", "5-001a"),
 };
 
 static struct regulator_consumer_supply wm8994_fixed_voltage1_supplies[] = {
-	{
-		.dev_name	= "5-001a",
-		.supply		= "SPKVDD1",
-	}, {
-		.dev_name	= "5-001a",
-		.supply		= "SPKVDD2",
-	},
+	REGULATOR_SUPPLY("SPKVDD1", "5-001a"),
+	REGULATOR_SUPPLY("SPKVDD2", "5-001a"),
 };
 
 static struct regulator_init_data wm8994_fixed_voltage0_init_data = {
@@ -596,15 +582,11 @@ static struct platform_device wm8994_fixed_voltage1 = {
 	},
 };
 
-static struct regulator_consumer_supply wm8994_avdd1_supply = {
-	.dev_name	= "5-001a",
-	.supply		= "AVDD1",
-};
+static struct regulator_consumer_supply wm8994_avdd1_supply =
+	REGULATOR_SUPPLY("AVDD1", "5-001a");
 
-static struct regulator_consumer_supply wm8994_dcvdd_supply = {
-	.dev_name	= "5-001a",
-	.supply		= "DCVDD",
-};
+static struct regulator_consumer_supply wm8994_dcvdd_supply =
+	REGULATOR_SUPPLY("DCVDD", "5-001a");
 
 static struct regulator_init_data wm8994_ldo1_data = {
 	.constraints	= {
-- 
1.7.1
