From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH for 2.6.38] ARM: S5PC110: update max8998_platform_data
Date: Tue, 15 Feb 2011 10:01:04 +0100
Message-ID: <1297760464-7639-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19360 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753598Ab1BOJBY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Feb 2011 04:01:24 -0500
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LGN001OFIEA1B@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 09:01:22 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGN00FB5IE9RQ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 09:01:22 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Max8998 PMIC driver's platform data has been changed once again in
commit 735a3d9efdc. This patch fixes build break caused by that commit.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |    9 ++++++---
 arch/arm/mach-s5pv210/mach-goni.c   |    9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 461aa035..1236e19 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -381,9 +381,12 @@ static struct max8998_platform_data aquila_max8998_pdata = {
 	.buck1_set1	= S5PV210_GPH0(3),
 	.buck1_set2	= S5PV210_GPH0(4),
 	.buck2_set3	= S5PV210_GPH0(5),
-	.buck1_max_voltage1 = 1200000,
-	.buck1_max_voltage2 = 1200000,
-	.buck2_max_voltage = 1200000,
+	.buck1_voltage1	= 1200000,
+	.buck1_voltage2	= 1200000,
+	.buck1_voltage3	= 1200000,
+	.buck1_voltage4	= 1200000,
+	.buck2_voltage1	= 1200000,
+	.buck2_voltage2	= 1200000,
 };
 #endif
 
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index e22d511..2beeb66 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -521,9 +521,12 @@ static struct max8998_platform_data goni_max8998_pdata = {
 	.buck1_set1	= S5PV210_GPH0(3),
 	.buck1_set2	= S5PV210_GPH0(4),
 	.buck2_set3	= S5PV210_GPH0(5),
-	.buck1_max_voltage1 = 1200000,
-	.buck1_max_voltage2 = 1200000,
-	.buck2_max_voltage = 1200000,
+	.buck1_voltage1	= 1200000,
+	.buck1_voltage2	= 1200000,
+	.buck1_voltage3	= 1200000,
+	.buck1_voltage4	= 1200000,
+	.buck2_voltage1	= 1200000,
+	.buck2_voltage2	= 1200000,
 };
 #endif
 
-- 
1.7.1.569.g6f426
