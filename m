From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: S5PC110: disable unused power regulators on Goni	board
Date: Tue, 15 Feb 2011 10:06:23 +0100
Message-ID: <1297760784-8486-2-git-send-email-m.szyprowski@samsung.com>
References: <1297760784-8486-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35412 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752211Ab1BOJGh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Feb 2011 04:06:37 -0500
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LGN007MOIMYUQ60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 09:06:35 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGN0064BIMWAI@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 09:06:33 +0000 (GMT)
In-reply-to: <1297760784-8486-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

A lot of power regulator has been enabled by default causing the board
to consume a lot of power. This patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 43c1c1b..10f754b 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -292,7 +292,6 @@ static struct regulator_init_data goni_ldo3_data = {
 		.min_uV		= 1100000,
 		.max_uV		= 1100000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -311,6 +310,7 @@ static struct regulator_init_data goni_ldo5_data = {
 		.min_uV		= 2800000,
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 	},
 	.num_consumer_supplies = ARRAY_SIZE(goni_ldo5_consumers),
 	.consumer_supplies = goni_ldo5_consumers,
@@ -341,7 +341,6 @@ static struct regulator_init_data goni_ldo8_data = {
 		.min_uV		= 3300000,
 		.max_uV		= 3300000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -351,7 +350,6 @@ static struct regulator_init_data goni_ldo9_data = {
 		.min_uV		= 2800000,
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -371,7 +369,6 @@ static struct regulator_init_data goni_ldo11_data = {
 		.min_uV		= 2800000,
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -381,7 +378,6 @@ static struct regulator_init_data goni_ldo12_data = {
 		.min_uV		= 1200000,
 		.max_uV		= 1200000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -391,7 +387,6 @@ static struct regulator_init_data goni_ldo13_data = {
 		.min_uV		= 2800000,
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -401,7 +396,6 @@ static struct regulator_init_data goni_ldo14_data = {
 		.min_uV		= 1800000,
 		.max_uV		= 1800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -411,7 +405,6 @@ static struct regulator_init_data goni_ldo15_data = {
 		.min_uV		= 3300000,
 		.max_uV		= 3300000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
@@ -421,7 +414,6 @@ static struct regulator_init_data goni_ldo16_data = {
 		.min_uV		= 1800000,
 		.max_uV		= 1800000,
 		.apply_uV	= 1,
-		.always_on	= 1,
 	},
 };
 
-- 
1.7.1.569.g6f426
