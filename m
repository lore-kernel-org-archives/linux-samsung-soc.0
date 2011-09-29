From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/2] ARM: EXYNOS4: Add support PPI in external GIC
Date: Thu, 29 Sep 2011 16:24:38 +0900
Message-ID: <008f01cc7e78$d8d08020$8a718060$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25254 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753218Ab1I2HYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Sep 2011 03:24:39 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS9007VYWKAUKB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 16:24:38 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS900ANSWL1S360@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 16:24:38 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Marc Zyngier' <marc.zyngier@arm.com>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, chaos.youn@samsung.com

From: Changhwan Youn <chaos.youn@samsung.com>

To support PPI in external GIC of EXYNOS4 SoCs,
gic_arch_extn.irq_eoi, irq_unmask and irq_mask are
fixed. This patch is necessary because external GIC of EXYNOS4
cannot support register banking.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/cpu.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 2aa3df0..9d5a171 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -200,20 +200,25 @@ void __init exynos4_init_clocks(int xtal)
 	exynos4_setup_clocks();
 }
 
-static void exynos4_gic_irq_eoi(struct irq_data *d)
+static void exynos4_gic_irq_fix_base(struct irq_data *d)
 {
 	struct gic_chip_data *gic_data = irq_data_get_irq_chip_data(d);
 
 	gic_data->cpu_base = S5P_VA_GIC_CPU +
 			    (EXYNOS4_GIC_BANK_OFFSET * smp_processor_id());
+
+	gic_data->dist_base = S5P_VA_GIC_DIST +
+			    (EXYNOS4_GIC_BANK_OFFSET * smp_processor_id());
 }
 
 void __init exynos4_init_irq(void)
 {
 	int irq;
 
-	gic_init(0, IRQ_SPI(0), S5P_VA_GIC_DIST, S5P_VA_GIC_CPU);
-	gic_arch_extn.irq_eoi = exynos4_gic_irq_eoi;
+	gic_init(0, IRQ_PPI(0), S5P_VA_GIC_DIST, S5P_VA_GIC_CPU);
+	gic_arch_extn.irq_eoi = exynos4_gic_irq_fix_base;
+	gic_arch_extn.irq_unmask = exynos4_gic_irq_fix_base;
+	gic_arch_extn.irq_mask = exynos4_gic_irq_fix_base;
 
 	for (irq = 0; irq < MAX_COMBINER_NR; irq++) {
 
-- 
1.7.1
