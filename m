From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV310: Limit the irqs which support cascade interrupt
Date: Thu,  2 Dec 2010 18:36:11 +0900
Message-ID: <1291282572-11735-2-git-send-email-kgene.kim@samsung.com>
References: <1291282572-11735-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60104 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492Ab0LBJxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:53:10 -0500
In-Reply-To: <1291282572-11735-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

The irqs from SPI(0) to SPI(39) and SPI(51), SPI(53) are connected to the
interrupt combiner. This patch limits the irqs which should be initialized
to support cascade interrupt.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/cpu.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.c
index 82ce4aa..3d0c1cb 100644
--- a/arch/arm/mach-s5pv310/cpu.c
+++ b/arch/arm/mach-s5pv310/cpu.c
@@ -127,6 +127,15 @@ void __init s5pv310_init_irq(void)
 	gic_cpu_init(0, S5P_VA_GIC_CPU);
 
 	for (irq = 0; irq < MAX_COMBINER_NR; irq++) {
+
+		/*
+		 * From SPI(0) to SPI(39) and SPI(51), SPI(53) are
+		 * connected to the interrupt combiner. These irqs
+		 * should be initialized to support cascade interrupt.
+		 */
+		if ((irq >= 40) && !(irq == 51) && !(irq == 53))
+			continue;
+
 		combiner_init(irq, (void __iomem *)S5P_VA_COMBINER(irq),
 				COMBINER_IRQ(irq, 0));
 		combiner_cascade_irq(irq, IRQ_SPI(irq));
-- 
1.6.2.5
