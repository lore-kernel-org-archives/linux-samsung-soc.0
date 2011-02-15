From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: S5PC110: add power consumers for hsotg for Goni board
Date: Tue, 15 Feb 2011 10:06:24 +0100
Message-ID: <1297760784-8486-3-git-send-email-m.szyprowski@samsung.com>
References: <1297760784-8486-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35412 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752559Ab1BOJGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Feb 2011 04:06:39 -0500
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LGN007MOIMYUQ60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 09:06:36 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGN0064KIMXAI@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 09:06:33 +0000 (GMT)
In-reply-to: <1297760784-8486-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

This patch adds definitions for power consumers for s3c-hsotg driver
on Goni board. The consumers are defined as arrays, because later more
entries for MIPI and ADC will be defined.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 10f754b..796625c 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -269,10 +269,18 @@ static void __init goni_tsp_init(void)
 /* MAX8998 regulators */
 #if defined(CONFIG_REGULATOR_MAX8998) || defined(CONFIG_REGULATOR_MAX8998_MODULE)
 
+static struct regulator_consumer_supply goni_ldo3_consumers[] = {
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
+};
+
 static struct regulator_consumer_supply goni_ldo5_consumers[] = {
 	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
 };
 
+static struct regulator_consumer_supply goni_ldo8_consumers[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
+};
+
 static struct regulator_init_data goni_ldo2_data = {
 	.constraints	= {
 		.name		= "VALIVE_1.1V",
@@ -292,7 +300,10 @@ static struct regulator_init_data goni_ldo3_data = {
 		.min_uV		= 1100000,
 		.max_uV		= 1100000,
 		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 	},
+	.num_consumer_supplies = ARRAY_SIZE(goni_ldo3_consumers),
+	.consumer_supplies = goni_ldo3_consumers,
 };
 
 static struct regulator_init_data goni_ldo4_data = {
@@ -341,7 +352,10 @@ static struct regulator_init_data goni_ldo8_data = {
 		.min_uV		= 3300000,
 		.max_uV		= 3300000,
 		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 	},
+	.num_consumer_supplies = ARRAY_SIZE(goni_ldo8_consumers),
+	.consumer_supplies = goni_ldo8_consumers,
 };
 
 static struct regulator_init_data goni_ldo9_data = {
-- 
1.7.1.569.g6f426
