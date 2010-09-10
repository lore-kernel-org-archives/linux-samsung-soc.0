From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/6] ARM: S5PV210: Enable USB HSOTG gadget build
Date: Fri, 10 Sep 2010 09:23:21 +0200
Message-ID: <1284103403-10696-5-git-send-email-m.szyprowski@samsung.com>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35026 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752958Ab0IJHXb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 03:23:31 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8I00EZ7SJ3VY30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:28 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8I008YLSJ2U6@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:27 +0100 (BST)
In-reply-to: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Add the necessary definitions and mapping information to enable the
s3c-hsotg gadget to build.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/cpu.c                   |    5 +++++
 arch/arm/mach-s5pv210/include/mach/map.h      |    6 ++++++
 arch/arm/mach-s5pv210/include/mach/regs-sys.h |   19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-sys.h

diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index c551ab1..6183b55 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -84,6 +84,11 @@ static struct map_desc s5pv210_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(S5PV210_PA_SROMC),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
+		.pfn		=__phys_to_pfn(S3C_PA_USB_HSPHY),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
 	}
 };
 
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index bd9afd5..724a428 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -73,6 +73,9 @@
 
 #define S5PV210_PA_HSMMC(x)	(0xEB000000 + ((x) * 0x100000))
 
+#define S5PV210_PA_HSOTG	(0xEC000000)
+#define S5PV210_PA_HSPHY	(0xEC100000)
+
 #define S5PV210_PA_VIC0		(0xF2000000)
 #define S5PV210_PA_VIC1		(0xF2100000)
 #define S5PV210_PA_VIC2		(0xF2200000)
@@ -111,6 +114,9 @@
 #define S5P_PA_FIMC0		S5PV210_PA_FIMC0
 #define S5P_PA_FIMC1		S5PV210_PA_FIMC1
 #define S5P_PA_FIMC2		S5PV210_PA_FIMC2
+#define S3C_PA_USB_HSOTG	S5PV210_PA_HSOTG
+#define S3C_PA_USB_HSPHY	S5PV210_PA_HSPHY
+#define S3C_VA_USB_HSPHY	S3C_ADDR(0x02000000)
 
 #define SAMSUNG_PA_ADC		S5PV210_PA_ADC
 #define SAMSUNG_PA_CFCON	S5PV210_PA_CFCON
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-sys.h b/arch/arm/mach-s5pv210/include/mach/regs-sys.h
new file mode 100644
index 0000000..26691d3
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/regs-sys.h
@@ -0,0 +1,19 @@
+/* arch/arm/mach-s5pv210/include/mach/regs-sys.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5PV210 - System registers definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#define S5PV210_USB_PHY_CON	(S3C_VA_SYS + 0xE80C)
+#define S5PV210_USB_PHY0_EN	(1 << 0)
+#define S5PV210_USB_PHY1_EN	(1 << 1)
+
+/* compatibility defines for s3c-hsotg driver */
+#define S3C64XX_OTHERS		S5PV210_USB_PHY_CON
+#define S3C64XX_OTHERS_USBMASK	S5PV210_USB_PHY0_EN
-- 
1.7.2.2
