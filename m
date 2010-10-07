From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] ARM: S5PC210: Define address & interrupt for all I2C blocks
Date: Thu, 07 Oct 2010 14:46:40 +0200
Message-ID: <1286455601-25360-3-git-send-email-m.szyprowski@samsung.com>
References: <1286455601-25360-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46599 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760467Ab0JGMqr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 08:46:47 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L9X00G307HW1520@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 13:46:44 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L9X008ZJ7HVRK@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 13:46:44 +0100 (BST)
In-reply-to: <1286455601-25360-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

From: Kyungmin Park <kyungmin.park@samsung.com>

S5PC210 supports total 8 (+ 1 dedicated for HDMI) I2C devices.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h |    7 +++++++
 arch/arm/mach-s5pv310/include/mach/map.h  |   11 +++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index e81332f..b2acc62 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -70,6 +70,13 @@
 #define IRQ_UART4		COMBINER_IRQ(26, 4)
 
 #define IRQ_IIC			COMBINER_IRQ(27, 0)
+#define IRQ_IIC1		COMBINER_IRQ(27, 1)
+#define IRQ_IIC2		COMBINER_IRQ(27, 2)
+#define IRQ_IIC3		COMBINER_IRQ(27, 3)
+#define IRQ_IIC4		COMBINER_IRQ(27, 4)
+#define IRQ_IIC5		COMBINER_IRQ(27, 5)
+#define IRQ_IIC6		COMBINER_IRQ(27, 6)
+#define IRQ_IIC7		COMBINER_IRQ(27, 7)
 
 #define IRQ_HSMMC0		COMBINER_IRQ(29, 0)
 #define IRQ_HSMMC1		COMBINER_IRQ(29, 1)
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index eab0ff7..1429510 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -69,7 +69,7 @@
 
 #define S5P_SZ_UART			SZ_256
 
-#define S5PV310_PA_IIC0			(0x13860000)
+#define S5PV310_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
 
 #define S5PV310_PA_TIMER		(0x139D0000)
 #define S5P_PA_TIMER			S5PV310_PA_TIMER
@@ -83,7 +83,14 @@
 #define S3C_PA_HSMMC1			S5PV310_PA_HSMMC(1)
 #define S3C_PA_HSMMC2			S5PV310_PA_HSMMC(2)
 #define S3C_PA_HSMMC3			S5PV310_PA_HSMMC(3)
-#define S3C_PA_IIC			S5PV310_PA_IIC0
+#define S3C_PA_IIC			S5PV310_PA_IIC(0)
+#define S3C_PA_IIC1			S5PV310_PA_IIC(1)
+#define S3C_PA_IIC2			S5PV310_PA_IIC(2)
+#define S3C_PA_IIC3			S5PV310_PA_IIC(3)
+#define S3C_PA_IIC4			S5PV310_PA_IIC(4)
+#define S3C_PA_IIC5			S5PV310_PA_IIC(5)
+#define S3C_PA_IIC6			S5PV310_PA_IIC(6)
+#define S3C_PA_IIC7			S5PV310_PA_IIC(7)
 #define S3C_PA_RTC			S5PV310_PA_RTC
 #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
 
-- 
1.7.1.569.g6f426
