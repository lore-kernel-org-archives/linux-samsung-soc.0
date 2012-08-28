From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Use non-secure MDMA1
Date: Tue, 28 Aug 2012 13:08:28 +0200
Message-ID: <5886686.Vz6SVkoRWm@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59879 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751956Ab2H1LIc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 07:08:32 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9G00ITVPM5Q9B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 20:08:31 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9G002CDPM50ZA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 20:08:31 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Using secure MDMA1 on TrustZone-enabled boards causes early boot crash,
so use non-secure instead.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/dma.c              | 2 +-
 arch/arm/mach-exynos/include/mach/map.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/dma.c b/arch/arm/mach-exynos/dma.c
index f60b66d..8858df5 100644
--- a/arch/arm/mach-exynos/dma.c
+++ b/arch/arm/mach-exynos/dma.c
@@ -261,7 +261,7 @@ static struct dma_pl330_platdata exynos_mdma1_pdata = {
 };
 
 static AMBA_AHB_DEVICE(exynos_mdma1,  "dma-pl330.2", 0x00041330,
-	EXYNOS4_PA_MDMA1, {EXYNOS4_IRQ_MDMA1}, &exynos_mdma1_pdata);
+	EXYNOS4_PA_NS_MDMA1, {EXYNOS4_IRQ_MDMA1}, &exynos_mdma1_pdata);
 
 static int __init exynos_dma_init(void)
 {
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
exynos/include/mach/map.h
index 51943f2..5df5910 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -89,7 +89,8 @@
 #define EXYNOS4_PA_L2CC			0x10502000
 
 #define EXYNOS4_PA_MDMA0		0x10810000
-#define EXYNOS4_PA_MDMA1		0x12840000
+#define EXYNOS4_PA_S_MDMA1		0x12840000
+#define EXYNOS4_PA_NS_MDMA1		0x12850000
 #define EXYNOS4_PA_PDMA0		0x12680000
 #define EXYNOS4_PA_PDMA1		0x12690000
 #define EXYNOS5_PA_MDMA0		0x10800000
-- 
1.7.12
