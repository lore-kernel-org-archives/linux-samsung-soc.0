From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 2/3] ARM: Exynos4: Add ioremap interceptor for statically
 remapped regions
Date: Mon, 10 Oct 2011 13:41:28 +0530
Message-ID: <1318234289-22041-3-git-send-email-thomas.abraham@linaro.org>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36067 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752691Ab1JJIKJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 04:10:09 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU00L0VC0T1H40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 17:10:08 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSU001GXC0LKE30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 17:10:08 +0900 (KST)
In-reply-to: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

ioremap() request for statically remapped regions are intercepted and the
statically assigned virtual address is returned. For requests for which
there are no statically remapped regions, the requests are let through.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos4/cpu.c             |   16 ++++++++++++++++
 arch/arm/mach-exynos4/include/mach/io.h |    4 ++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 5b1765b..358624d 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -137,6 +137,22 @@ static struct map_desc exynos4_iodesc1[] __initdata = {
 	},
 };
 
+/*
+ * For all ioremap requests of statically mapped regions, intercept ioremap and
+ * return virtual address from the iodesc table.
+ */
+void __iomem *exynos4_ioremap(unsigned long phy, size_t size, unsigned int type)
+{
+	struct map_desc *desc = exynos4_iodesc;
+	unsigned int idx;
+
+	for (idx = 0; idx < ARRAY_SIZE(exynos4_iodesc); idx++, desc++)
+		if (desc->pfn == __phys_to_pfn(phy) && desc->type == type)
+			return (void __iomem *)desc->virtual;
+
+	return __arm_ioremap(phy, size, type);
+}
+
 static void exynos4_idle(void)
 {
 	if (!need_resched())
diff --git a/arch/arm/mach-exynos4/include/mach/io.h b/arch/arm/mach-exynos4/include/mach/io.h
index d5478d2..33c2890 100644
--- a/arch/arm/mach-exynos4/include/mach/io.h
+++ b/arch/arm/mach-exynos4/include/mach/io.h
@@ -22,5 +22,10 @@
 #define __mem_pci(a)	(a)
 
 #define IO_SPACE_LIMIT (0xFFFFFFFF)
+#define __arch_ioremap	exynos4_ioremap
+#define __arch_iounmap	__iounmap
+
+void __iomem *exynos4_ioremap(unsigned long phy, size_t size,
+					unsigned int type);
 
 #endif /* __ASM_ARM_ARCH_IO_H */
-- 
1.6.6.rc2
