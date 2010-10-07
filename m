From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] ARM: S5PC110: Fix wrong interrupt I2C2 and I2C3 number
Date: Thu, 07 Oct 2010 14:46:39 +0200
Message-ID: <1286455601-25360-2-git-send-email-m.szyprowski@samsung.com>
References: <1286455601-25360-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20601 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760434Ab0JGMqq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 08:46:46 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L9X00FGF7HWTV@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 13:46:44 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L9X00J2Z7HV9H@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 13:46:44 +0100 (BST)
In-reply-to: <1286455601-25360-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

From: Kyungmin Park <kyungmin.park@samsung.com>

The name of the interrupt should be IIC2 and IIC3 instead of CAN0 and CAN1.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/irqs.h |    4 ++--
 arch/arm/plat-samsung/dev-i2c2.c          |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-s5pv210/include/mach/irqs.h
index bb7f277..119b95f 100644
--- a/arch/arm/mach-s5pv210/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
@@ -55,8 +55,8 @@
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
diff --git a/arch/arm/plat-samsung/dev-i2c2.c b/arch/arm/plat-samsung/dev-i2c2.c
index 07036de..ff4ba69 100644
--- a/arch/arm/plat-samsung/dev-i2c2.c
+++ b/arch/arm/plat-samsung/dev-i2c2.c
@@ -32,8 +32,8 @@ static struct resource s3c_i2c_resource[] = {
 		.flags = IORESOURCE_MEM,
 	},
 	[1] = {
-		.start = IRQ_CAN0,
-		.end   = IRQ_CAN0,
+		.start = IRQ_IIC2,
+		.end   = IRQ_IIC2,
 		.flags = IORESOURCE_IRQ,
 	},
 };
-- 
1.7.1.569.g6f426
