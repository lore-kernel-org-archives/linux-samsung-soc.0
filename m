From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 2/3] ARM: Exynos4: Add ioremap interceptor for statically remapped regions
Date: Tue,  1 Nov 2011 06:31:28 +0530
Message-ID: <1320109289-2730-3-git-send-email-thomas.abraham@linaro.org>
References: <1320109289-2730-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:33878 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753692Ab1KABCB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Oct 2011 21:02:01 -0400
Received: by mail-yw0-f46.google.com with SMTP id 7so1683397ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Oct 2011 18:02:01 -0700 (PDT)
In-Reply-To: <1320109289-2730-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>

ioremap() request for statically remapped regions are intercepted and the
statically assigned virtual address is returned. For requests for which
there are no statically remapped regions, the requests are let through.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos4/cpu.c             |   16 ++++++++++++++++
 arch/arm/mach-exynos4/include/mach/io.h |    5 +++++
 2 files changed, 21 insertions(+), 0 deletions(-)

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
index d5478d2..c1b21d5 100644
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
1.7.4.4
