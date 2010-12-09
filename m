From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH for 2.6.37] S5PV210: update MAX8998 platform data to get rid of
 WARN()
Date: Thu, 09 Dec 2010 16:11:01 +0100
Message-ID: <1291907461-27447-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25074 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751954Ab0LIPLH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 10:11:07 -0500
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LD600J7S26H0I50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Dec 2010 15:11:05 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LD600HJ626GN1@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Dec 2010 15:11:05 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

This patch adds new entries required by the new version of MAX8998
driver. Without them, the driver fails to init. See commit 50f19a4596

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

---

Hello,

This is quite important bugfix for 2.6.37 release. I'm really sorry that
I forgot to send it earlier.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center

---
 arch/arm/mach-s5pv210/mach-aquila.c |    6 ++++++
 arch/arm/mach-s5pv210/mach-goni.c   |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 28677ca..461aa035 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -378,6 +378,12 @@ static struct max8998_regulator_data aquila_regulators[] = {
 static struct max8998_platform_data aquila_max8998_pdata = {
 	.num_regulators	= ARRAY_SIZE(aquila_regulators),
 	.regulators	= aquila_regulators,
+	.buck1_set1	= S5PV210_GPH0(3),
+	.buck1_set2	= S5PV210_GPH0(4),
+	.buck2_set3	= S5PV210_GPH0(5),
+	.buck1_max_voltage1 = 1200000,
+	.buck1_max_voltage2 = 1200000,
+	.buck2_max_voltage = 1200000,
 };
 #endif
 
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index b1dcf96..e22d511 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -518,6 +518,12 @@ static struct max8998_regulator_data goni_regulators[] = {
 static struct max8998_platform_data goni_max8998_pdata = {
 	.num_regulators	= ARRAY_SIZE(goni_regulators),
 	.regulators	= goni_regulators,
+	.buck1_set1	= S5PV210_GPH0(3),
+	.buck1_set2	= S5PV210_GPH0(4),
+	.buck2_set3	= S5PV210_GPH0(5),
+	.buck1_max_voltage1 = 1200000,
+	.buck1_max_voltage2 = 1200000,
+	.buck2_max_voltage = 1200000,
 };
 #endif
 
-- 
1.7.1.569.g6f426
