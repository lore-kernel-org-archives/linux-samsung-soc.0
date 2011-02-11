From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/3] ARM: S5PV210: Add supplies for CIF camera on GONI board
Date: Fri, 11 Feb 2011 18:27:52 +0100
Message-ID: <1297445273-3829-3-git-send-email-s.nawrocki@samsung.com>
References: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:21430 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756889Ab1BKR17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Feb 2011 12:27:59 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LGG00KW1R6LRG60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 17:27:57 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGG000OVR6KYD@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 17:27:56 +0000 (GMT)
In-reply-to: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Add regulator supplies required for NOON010PC30 CIF sensor.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |   24 +++++++++++++++++++++---
 1 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 7a7cf6a..53b3b96 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -273,6 +273,18 @@ static struct regulator_consumer_supply goni_ldo5_consumers[] = {
 	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
 };
 
+static struct regulator_consumer_supply goni_ldo11_consumers[] = {
+	REGULATOR_SUPPLY("vddio", "0-0030"), /* "CAM_IO_2.8V" */
+};
+
+static struct regulator_consumer_supply goni_ldo13_consumers[] = {
+	REGULATOR_SUPPLY("vdda", "0-0030"), /* "CAM_A_2.8V" */
+};
+
+static struct regulator_consumer_supply goni_ldo14_consumers[] = {
+	REGULATOR_SUPPLY("vdd_core", "0-0030"), /* "CAM_CIF_1.8V" */
+};
+
 static struct regulator_init_data goni_ldo2_data = {
 	.constraints	= {
 		.name		= "VALIVE_1.1V",
@@ -371,8 +383,10 @@ static struct regulator_init_data goni_ldo11_data = {
 		.min_uV		= 2800000,
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 	},
+	.num_consumer_supplies	= ARRAY_SIZE(goni_ldo11_consumers),
+	.consumer_supplies	= goni_ldo11_consumers,
 };
 
 static struct regulator_init_data goni_ldo12_data = {
@@ -391,8 +405,10 @@ static struct regulator_init_data goni_ldo13_data = {
 		.min_uV		= 2800000,
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 	},
+	.num_consumer_supplies	= ARRAY_SIZE(goni_ldo13_consumers),
+	.consumer_supplies	= goni_ldo13_consumers,
 };
 
 static struct regulator_init_data goni_ldo14_data = {
@@ -401,8 +417,10 @@ static struct regulator_init_data goni_ldo14_data = {
 		.min_uV		= 1800000,
 		.max_uV		= 1800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 	},
+	.num_consumer_supplies	= ARRAY_SIZE(goni_ldo14_consumers),
+	.consumer_supplies	= goni_ldo14_consumers,
 };
 
 static struct regulator_init_data goni_ldo15_data = {
-- 
1.7.4
