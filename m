From: Changhwan Youn <chaos.youn@samsung.com>
Subject: [PATCH 4/7] ARM: GIC: move gic_chip_data structure declaration to header
Date: Mon, 20 Jun 2011 16:34:15 +0900
Message-ID: <1308555258-4322-5-git-send-email-chaos.youn@samsung.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58668 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753369Ab1FTHlZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 03:41:25 -0400
In-Reply-To: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, Changhwan Youn <chaos.youn@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>

Since Samsung EXYNOS4210 cannot support register banking in GIC,
so needs to update CPU interface base address.
The 'gic_chip_data' is used for it, this patch moves gic_chip_data
structure declaraton to arch/arm/include/asm/hardware/gic.h to use
it.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
---
 arch/arm/common/gic.c               |    6 ------
 arch/arm/include/asm/hardware/gic.h |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
index 4ddd0a6..23564ed 100644
--- a/arch/arm/common/gic.c
+++ b/arch/arm/common/gic.c
@@ -38,12 +38,6 @@ static DEFINE_SPINLOCK(irq_controller_lock);
 /* Address of GIC 0 CPU interface */
 void __iomem *gic_cpu_base_addr __read_mostly;
 
-struct gic_chip_data {
-	unsigned int irq_offset;
-	void __iomem *dist_base;
-	void __iomem *cpu_base;
-};
-
 /*
  * Supported arch specific GIC irq extension.
  * Default make them NULL.
diff --git a/arch/arm/include/asm/hardware/gic.h b/arch/arm/include/asm/hardware/gic.h
index 0691f9d..435d3f8 100644
--- a/arch/arm/include/asm/hardware/gic.h
+++ b/arch/arm/include/asm/hardware/gic.h
@@ -41,6 +41,12 @@ void gic_secondary_init(unsigned int);
 void gic_cascade_irq(unsigned int gic_nr, unsigned int irq);
 void gic_raise_softirq(const struct cpumask *mask, unsigned int irq);
 void gic_enable_ppi(unsigned int);
+
+struct gic_chip_data {
+	unsigned int irq_offset;
+	void __iomem *dist_base;
+	void __iomem *cpu_base;
+};
 #endif
 
 #endif
-- 
1.7.1
