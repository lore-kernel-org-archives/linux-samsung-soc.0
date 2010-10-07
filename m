From: Jongsun Han <jongsun.han@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV310: Add address and IRQ definitions for I2C(1,2,3,4,5,6,7)
Date: Thu,  7 Oct 2010 20:15:31 +0900
Message-ID: <1286450132-7985-3-git-send-email-jongsun.han@samsung.com>
References: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36995 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752434Ab0JGLYx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 07:24:53 -0400
In-Reply-To: <1286450132-7985-1-git-send-email-jongsun.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Jongsun Han <jongsun.han@samsung.com>

This patch adds address and IRQ definitions for I2C(1,2,3,4,5,6,7) devices.

S5PV310 supports 8 I2C channels.

Signed-off-by: Jongsun Han <jongsun.han@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h |    8 ++++++++
 arch/arm/mach-s5pv310/include/mach/map.h  |   19 +++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index e81332f..fcbfef6 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -70,6 +70,14 @@
 #define IRQ_UART4		COMBINER_IRQ(26, 4)
 
 #define IRQ_IIC			COMBINER_IRQ(27, 0)
+#define IRQ_IIC1		COMBINER_IRQ(27, 1)
+#define IRQ_IIC2		COMBINER_IRQ(27, 2)
+#define IRQ_IIC3		COMBINER_IRQ(27, 3)
+#define IRQ_IIC4		COMBINER_IRQ(27, 4)
+#define IRQ_IIC5		COMBINER_IRQ(27, 5)
+#define IRQ_IIC6		COMBINER_IRQ(27, 6)
+#define IRQ_IIC7		COMBINER_IRQ(27, 7)
+
 
 #define IRQ_HSMMC0		COMBINER_IRQ(29, 0)
 #define IRQ_HSMMC1		COMBINER_IRQ(29, 1)
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index eab0ff7..3a5db9d 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -70,6 +70,13 @@
 #define S5P_SZ_UART			SZ_256
 
 #define S5PV310_PA_IIC0			(0x13860000)
+#define S5PV310_PA_IIC1			(0x13870000)
+#define S5PV310_PA_IIC2			(0x13880000)
+#define S5PV310_PA_IIC3			(0x13890000)
+#define S5PV310_PA_IIC4			(0x138A0000)
+#define S5PV310_PA_IIC5			(0x138B0000)
+#define S5PV310_PA_IIC6			(0x138C0000)
+#define S5PV310_PA_IIC7			(0x138D0000)
 
 #define S5PV310_PA_TIMER		(0x139D0000)
 #define S5P_PA_TIMER			S5PV310_PA_TIMER
@@ -83,8 +90,16 @@
 #define S3C_PA_HSMMC1			S5PV310_PA_HSMMC(1)
 #define S3C_PA_HSMMC2			S5PV310_PA_HSMMC(2)
 #define S3C_PA_HSMMC3			S5PV310_PA_HSMMC(3)
-#define S3C_PA_IIC			S5PV310_PA_IIC0
-#define S3C_PA_RTC			S5PV310_PA_RTC
 #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
+#define S3C_PA_RTC			S5PV310_PA_RTC
+
+#define S3C_PA_IIC			S5PV310_PA_IIC0
+#define S3C_PA_IIC1			S5PV310_PA_IIC1
+#define S3C_PA_IIC2			S5PV310_PA_IIC2
+#define S3C_PA_IIC3			S5PV310_PA_IIC3
+#define S3C_PA_IIC4			S5PV310_PA_IIC4
+#define S3C_PA_IIC5			S5PV310_PA_IIC5
+#define S3C_PA_IIC6			S5PV310_PA_IIC6
+#define S3C_PA_IIC7			S5PV310_PA_IIC7
 
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.6.3.3
