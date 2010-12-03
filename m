From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/4 v2] ARM: S5PV210: Add resource definitions for MIPI CSIS
Date: Fri, 03 Dec 2010 20:52:42 +0100
Message-ID: <1291405965-19482-2-git-send-email-s.nawrocki@samsung.com>
References: <1291405965-19482-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19826 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837Ab0LCTw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 14:52:59 -0500
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LCV00IZRB89P7@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 19:52:57 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LCV003Q3B88A8@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 19:52:57 +0000 (GMT)
In-reply-to: <1291405965-19482-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Naming changed for consistency with s5pv310 where there are two instances
of the device.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/irqs.h       |    3 ++-
 arch/arm/mach-s5pv210/include/mach/map.h        |    3 +++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |    5 +----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-s5pv210/include/mach/irqs.h
index 119b95f..26710b3 100644
--- a/arch/arm/mach-s5pv210/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
@@ -65,7 +65,7 @@
 #define IRQ_HSMMC0		S5P_IRQ_VIC1(26)
 #define IRQ_HSMMC1		S5P_IRQ_VIC1(27)
 #define IRQ_HSMMC2		S5P_IRQ_VIC1(28)
-#define IRQ_MIPICSI		S5P_IRQ_VIC1(29)
+#define IRQ_MIPI_CSIS		S5P_IRQ_VIC1(29)
 #define IRQ_MIPIDSI		S5P_IRQ_VIC1(30)
 #define IRQ_ONENAND_AUDI	S5P_IRQ_VIC1(31)
 
@@ -132,5 +132,6 @@
 #define IRQ_LCD_FIFO		IRQ_LCD0
 #define IRQ_LCD_VSYNC		IRQ_LCD1
 #define IRQ_LCD_SYSTEM		IRQ_LCD2
+#define IRQ_MIPI_CSIS0		IRQ_MIPI_CSIS
 
 #endif /* ASM_ARCH_IRQS_H */
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 861d7fe..e50cdc7 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -107,6 +107,8 @@
 #define S5PV210_PA_DMC0		(0xF0000000)
 #define S5PV210_PA_DMC1		(0xF1400000)
 
+#define S5PV210_PA_MIPI_CSIS	0xFA600000
+
 /* compatibiltiy defines. */
 #define S3C_PA_UART		S5PV210_PA_UART
 #define S3C_PA_HSMMC0		S5PV210_PA_HSMMC(0)
@@ -123,6 +125,7 @@
 #define S5P_PA_FIMC0		S5PV210_PA_FIMC0
 #define S5P_PA_FIMC1		S5PV210_PA_FIMC1
 #define S5P_PA_FIMC2		S5PV210_PA_FIMC2
+#define S5P_PA_MIPI_CSIS0	S5PV210_PA_MIPI_CSIS
 
 #define SAMSUNG_PA_ADC		S5PV210_PA_ADC
 #define SAMSUNG_PA_CFCON	S5PV210_PA_CFCON
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
index ebaabe0..4c45b74 100644
--- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
@@ -161,7 +161,7 @@
 #define S5P_MDNIE_SEL		S5P_CLKREG(0x7008)
 #define S5P_MIPI_PHY_CON0	S5P_CLKREG(0x7200)
 #define S5P_MIPI_PHY_CON1	S5P_CLKREG(0x7204)
-#define S5P_MIPI_CONTROL	S5P_CLKREG(0xE814)
+#define S5P_MIPI_DPHY_CONTROL	S5P_CLKREG(0xE814)
 
 #define S5P_IDLE_CFG_TL_MASK	(3 << 30)
 #define S5P_IDLE_CFG_TM_MASK	(3 << 28)
@@ -195,9 +195,6 @@
 #define S5P_OTHERS_RET_UART		(1 << 28)
 #define S5P_OTHERS_USB_SIG_MASK		(1 << 16)
 
-/* MIPI */
-#define S5P_MIPI_DPHY_EN		(3)
-
 /* S5P_DAC_CONTROL */
 #define S5P_DAC_ENABLE			(1)
 #define S5P_DAC_DISABLE			(0)
-- 
1.7.3.2
