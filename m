From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ARM: EXYNOS4: add a placeholder for board specific
	interrupts
Date: Mon, 14 Mar 2011 08:06:45 +0100
Message-ID: <1300086405-9895-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22010 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752584Ab1CNHGt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 03:06:49 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LI1009CYD3BEZ@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:06:47 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LI100AYVD3ADD@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:06:47 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

This patch adds a placeholder for board specific interrupts on S5PC210
platform.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/irqs.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 5d03730..cc2186d 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -154,7 +154,11 @@
 #define IRQ_GPIO2_NR_GROUPS	9
 #define IRQ_GPIO_END		(S5P_GPIOINT_BASE + S5P_GPIOINT_COUNT)
 
+/* optional board specific irqs */
+#define IRQ_BOARD_START		IRQ_GPIO_END
+#define IRQ_NR_BOARD		16
+
 /* Set the default NR_IRQS */
-#define NR_IRQS			(IRQ_GPIO_END)
+#define NR_IRQS			(IRQ_GPIO_END + IRQ_NR_BOARD)
 
 #endif /* __ASM_ARCH_IRQS_H */
-- 
1.7.1.569.g6f426
