From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PC100: Change I2C2 and I2C3 IRQ names
Date: Mon, 11 Oct 2010 16:19:08 +0900
Message-ID: <1286781548-30456-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57355 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731Ab0JKHZi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Oct 2010 03:25:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch changes I2C2 and I2C3 interrupt name from IRQ_CANX to IRQ_IICX
according other SoCs' I2C interrupt naming rule.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pc100/include/mach/irqs.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pc100/include/mach/irqs.h b/arch/arm/mach-s5pc100/include/mach/irqs.h
index e782dd6..d2eb475 100644
--- a/arch/arm/mach-s5pc100/include/mach/irqs.h
+++ b/arch/arm/mach-s5pc100/include/mach/irqs.h
@@ -48,8 +48,8 @@
 #define IRQ_SPI1		S5P_IRQ_VIC1(16)
 #define IRQ_SPI2		S5P_IRQ_VIC1(17)
 #define IRQ_IRDA		S5P_IRQ_VIC1(18)
-#define IRQ_CAN0		S5P_IRQ_VIC1(19)
-#define IRQ_CAN1		S5P_IRQ_VIC1(20)
+#define IRQ_IIC2		S5P_IRQ_VIC1(19)
+#define IRQ_IIC3		S5P_IRQ_VIC1(20)
 #define IRQ_HSIRX		S5P_IRQ_VIC1(21)
 #define IRQ_HSITX		S5P_IRQ_VIC1(22)
 #define IRQ_UHOST		S5P_IRQ_VIC1(23)
-- 
1.6.2.5
