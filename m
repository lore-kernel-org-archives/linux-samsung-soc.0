From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/3] ARM: S5PV310: Add Interrupt of MCT
Date: Thu,  2 Dec 2010 18:36:10 +0900
Message-ID: <1291282572-11735-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60105 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517Ab0LBJxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:53:10 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

This patch adds IRQ_MCT0, IRQ_MCT1, IRQ_MCT_L0, and IRQ_MCT_L1.
(MCT: Multi-Core Timer). And updated MAX_COMBINER_NR.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index 99e7dad..f9a2830 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -25,6 +25,8 @@
 
 #define IRQ_SPI(x)		S5P_IRQ(x+32)
 
+#define IRQ_MCT1		IRQ_SPI(35)
+
 #define IRQ_EINT0		IRQ_SPI(40)
 #define IRQ_EINT1		IRQ_SPI(41)
 #define IRQ_EINT2		IRQ_SPI(42)
@@ -36,9 +38,8 @@
 #define IRQ_JPEG		IRQ_SPI(48)
 #define IRQ_2D			IRQ_SPI(49)
 #define IRQ_PCIE		IRQ_SPI(50)
-#define IRQ_SYSTEM_TIMER	IRQ_SPI(51)
+#define IRQ_MCT0		IRQ_SPI(51)
 #define IRQ_MFC			IRQ_SPI(52)
-#define IRQ_WDT			IRQ_SPI(53)
 #define IRQ_AUDIO_SS		IRQ_SPI(54)
 #define IRQ_AC97		IRQ_SPI(55)
 #define IRQ_SPDIF		IRQ_SPI(56)
@@ -85,6 +86,8 @@
 
 #define IRQ_ONENAND_AUDI	COMBINER_IRQ(34, 0)
 
+#define IRQ_MCT_L1		COMBINER_IRQ(35, 3)
+
 #define IRQ_EINT4		COMBINER_IRQ(37, 0)
 #define IRQ_EINT5		COMBINER_IRQ(37, 1)
 #define IRQ_EINT6		COMBINER_IRQ(37, 2)
@@ -101,7 +104,11 @@
 
 #define IRQ_EINT16_31		COMBINER_IRQ(39, 0)
 
-#define MAX_COMBINER_NR		40
+#define IRQ_MCT_L0		COMBINER_IRQ(51, 0)
+
+#define IRQ_WDT			COMBINER_IRQ(53, 0)
+
+#define MAX_COMBINER_NR		54
 
 #define S5P_IRQ_EINT_BASE	COMBINER_IRQ(MAX_COMBINER_NR, 0)
 
-- 
1.6.2.5
