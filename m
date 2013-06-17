From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 25/38] ARM: SAMSUNG: Make legacy MFC support code depend on
 SAMSUNG_ATAGS
Date: Mon, 17 Jun 2013 18:34:10 +0200
Message-ID: <1371486863-12398-26-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10306 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256Ab3FQQey (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:54 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ0085OQ1L6450@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:52 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This allows to bypass compilation of static platform device and resource
definitions that require interrupts and base addresses to be defined
statically.

Cc: Jeongtae Park <jtp.park@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/s5p-dev-mfc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/s5p-dev-mfc.c b/arch/arm/plat-samsung/s5p-dev-mfc.c
index a93fb6f..ad51f85 100644
--- a/arch/arm/plat-samsung/s5p-dev-mfc.c
+++ b/arch/arm/plat-samsung/s5p-dev-mfc.c
@@ -17,10 +17,12 @@
 #include <linux/of_fdt.h>
 #include <linux/of.h>
 
+#include <plat/mfc.h>
+
+#ifdef CONFIG_SAMSUNG_ATAGS
 #include <mach/map.h>
 #include <mach/irqs.h>
 #include <plat/devs.h>
-#include <plat/mfc.h>
 
 static struct resource s5p_mfc_resource[] = {
 	[0] = DEFINE_RES_MEM(S5P_PA_MFC, SZ_64K),
@@ -61,6 +63,10 @@ struct platform_device s5p_device_mfc_r = {
 		.coherent_dma_mask	= DMA_BIT_MASK(32),
 	},
 };
+#else
+static struct platform_device s5p_device_mfc_l;
+static struct platform_device s5p_device_mfc_r;
+#endif
 
 struct s5p_mfc_reserved_mem {
 	phys_addr_t	base;
@@ -70,6 +76,7 @@ struct s5p_mfc_reserved_mem {
 
 static struct s5p_mfc_reserved_mem s5p_mfc_mem[2] __initdata;
 
+
 void __init s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
 				phys_addr_t lbase, unsigned int lsize)
 {
@@ -93,6 +100,7 @@ void __init s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
 	}
 }
 
+#ifdef CONFIG_SAMSUNG_ATAGS
 static int __init s5p_mfc_memory_init(void)
 {
 	int i;
@@ -111,6 +119,7 @@ static int __init s5p_mfc_memory_init(void)
 	return 0;
 }
 device_initcall(s5p_mfc_memory_init);
+#endif
 
 #ifdef CONFIG_OF
 int __init s5p_fdt_find_mfc_mem(unsigned long node, const char *uname,
-- 
1.8.2.1
