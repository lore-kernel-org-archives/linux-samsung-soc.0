From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/5] ARM: S5PC210: add a placeholder for board specific
	interrupts
Date: Thu, 17 Feb 2011 08:25:27 +0100
Message-ID: <1297927527-1338-6-git-send-email-m.szyprowski@samsung.com>
References: <1297927527-1338-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54330 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752013Ab1BQHZk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Feb 2011 02:25:40 -0500
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LGR0021T3APL2@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Feb 2011 07:25:37 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGR000A73AP9I@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Feb 2011 07:25:37 +0000 (GMT)
In-reply-to: <1297927527-1338-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

This patch adds a placeholder for board specific interrupts on S5PC210
platform.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index 64dbe15..a28de22 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -148,7 +148,11 @@
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
