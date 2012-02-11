From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH 2/2] ARM: SAMSUNG: Fix PMU platform device for EXYNOS SoC
Date: Sat, 11 Feb 2012 16:04:00 +0900
Message-ID: <019001cce88b$54f3e530$fedbaf90$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53834 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752486Ab2BKHEC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Feb 2012 02:04:02 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ7009O1VMOQ3C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 16:04:01 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ700AUFVMOW130@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 16:04:01 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com


Exynos4210, Exynos4212 has 2 core and Exynos4412 has 4 core and
each core has its own PMU IRQ. Configure these PMU IRQs for
performance monitor unit.

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/devs.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 32a6e39..3e38dc4 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1073,7 +1073,14 @@ struct platform_device s5p_device_onenand = {
 
 #ifdef CONFIG_PLAT_S5P
 static struct resource s5p_pmu_resource[] = {
-	DEFINE_RES_IRQ(IRQ_PMU)
+	[0] = DEFINE_RES_IRQ(IRQ_PMU),
+#if CONFIG_NR_CPUS > 1
+	[1] = DEFINE_RES_IRQ(IRQ_PMU_CPU1),
+#endif
+#if CONFIG_NR_CPUS > 2
+	[2] = DEFINE_RES_IRQ(IRQ_PMU_CPU2),
+	[3] = DEFINE_RES_IRQ(IRQ_PMU_CPU3),
+#endif
 };
 
 struct platform_device s5p_device_pmu = {
-- 
1.7.1
