From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 2/7] ARM: S5P64X0: Add register base and IRQ for Framebuffer
Date: Mon, 25 Jul 2011 16:00:20 -0400
Message-ID: <1311624025-2643-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1311624025-2643-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20863 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751178Ab1GYOI4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 10:08:56 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOW0003Z7ATM8F0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 23:08:55 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOW00ITF7ANNI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 23:08:55 +0900 (KST)
In-reply-to: <1311624025-2643-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

This patch adds:
        -- Framebuffer register mappings.
        -- IRQ number being used.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-s5p64x0/include/mach/irqs.h |    4 ++++
 arch/arm/mach-s5p64x0/include/mach/map.h  |    3 +++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/include/mach/irqs.h b/arch/arm/mach-s5p64x0/include/mach/irqs.h
index 5837a36..53982db 100644
--- a/arch/arm/mach-s5p64x0/include/mach/irqs.h
+++ b/arch/arm/mach-s5p64x0/include/mach/irqs.h
@@ -87,6 +87,10 @@
 
 #define IRQ_I2S0		IRQ_I2SV40
 
+#define IRQ_LCD_FIFO		IRQ_DISPCON0
+#define IRQ_LCD_VSYNC		IRQ_DISPCON1
+#define IRQ_LCD_SYSTEM		IRQ_DISPCON2
+
 /* S5P6450 EINT feature will be added */
 
 /*
diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
index 95c9125..c5ef50c 100644
--- a/arch/arm/mach-s5p64x0/include/mach/map.h
+++ b/arch/arm/mach-s5p64x0/include/mach/map.h
@@ -47,6 +47,8 @@
 
 #define S5P64X0_PA_HSMMC(x)	(0xED800000 + ((x) * 0x100000))
 
+#define S5P64X0_PA_FB		0xEE000000
+
 #define S5P64X0_PA_I2S		0xF2000000
 #define S5P6450_PA_I2S1		0xF2800000
 #define S5P6450_PA_I2S2		0xF2900000
@@ -64,6 +66,7 @@
 #define S3C_PA_IIC1		S5P6440_PA_IIC1
 #define S3C_PA_RTC		S5P64X0_PA_RTC
 #define S3C_PA_WDT		S5P64X0_PA_WDT
+#define S3C_PA_FB		S5P64X0_PA_FB
 
 #define S5P_PA_CHIPID		S5P64X0_PA_CHIPID
 #define S5P_PA_SROMC		S5P64X0_PA_SROMC
-- 
1.7.0.4
