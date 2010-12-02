From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/6] ARM: S5P: Move SROM controller IO mapping to plat-s5p for S5P SoCs
Date: Thu,  2 Dec 2010 18:29:19 +0900
Message-ID: <1291282161-1992-5-git-send-email-kgene.kim@samsung.com>
References: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38933 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757355Ab0LBJnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:43:12 -0500
In-Reply-To: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch modifies the following.

1. Moves the SROM controller mapping from S5PV210 specific code to
   S5P common code. The SROM controller mapping can be used for all
   S5P SoCs.

2. Define the SROM controller physical address for S5P64X0, S5P6442,
   S5PC100, S5PV210 and S5PV310.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/include/mach/map.h |    3 +++
 arch/arm/mach-s5p64x0/include/mach/map.h |    3 +++
 arch/arm/mach-s5pc100/include/mach/map.h |    2 ++
 arch/arm/mach-s5pv210/cpu.c              |    5 -----
 arch/arm/mach-s5pv210/include/mach/map.h |    1 +
 arch/arm/mach-s5pv310/include/mach/map.h |    1 +
 arch/arm/plat-s5p/cpu.c                  |    5 +++++
 7 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s5p6442/include/mach/map.h b/arch/arm/mach-s5p6442/include/mach/map.h
index 31fb2e6..203dd5a 100644
--- a/arch/arm/mach-s5p6442/include/mach/map.h
+++ b/arch/arm/mach-s5p6442/include/mach/map.h
@@ -28,6 +28,9 @@
 #define S5P6442_PA_VIC1		(0xE4100000)
 #define S5P6442_PA_VIC2		(0xE4200000)
 
+#define S5P6442_PA_SROMC	(0xE7000000)
+#define S5P_PA_SROMC		S5P6442_PA_SROMC
+
 #define S5P6442_PA_MDMA		0xE8000000
 #define S5P6442_PA_PDMA		0xE9000000
 
diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
index 31e5341..bdf108b 100644
--- a/arch/arm/mach-s5p64x0/include/mach/map.h
+++ b/arch/arm/mach-s5p64x0/include/mach/map.h
@@ -29,6 +29,9 @@
 #define S5P64X0_PA_VIC0		(0xE4000000)
 #define S5P64X0_PA_VIC1		(0xE4100000)
 
+#define S5P64X0_PA_SROMC	(0xE7000000)
+#define S5P_PA_SROMC		S5P64X0_PA_SROMC
+
 #define S5P64X0_PA_PDMA		(0xE9000000)
 
 #define S5P64X0_PA_TIMER	(0xEA000000)
diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index 32e9cab..328467b 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -55,6 +55,8 @@
 #define S5PC100_VA_VIC_OFFSET	0x10000
 #define S5PC1XX_VA_VIC(x)	(S5PC100_VA_VIC + ((x) * S5PC100_VA_VIC_OFFSET))
 
+#define S5PC100_PA_SROMC	(0xE7000000)
+#define S5P_PA_SROMC		S5PC100_PA_SROMC
 
 #define S5PC100_PA_ONENAND	(0xE7100000)
 
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 8eb480e..61e6c24 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -81,11 +81,6 @@ static struct map_desc s5pv210_iodesc[] __initdata = {
 		.length		= SZ_512K,
 		.type		= MT_DEVICE,
 	}, {
-		.virtual	= (unsigned long)S5P_VA_SROMC,
-		.pfn		= __phys_to_pfn(S5PV210_PA_SROMC),
-		.length		= SZ_4K,
-		.type		= MT_DEVICE,
-	}, {
 		.virtual	= (unsigned long)S5P_VA_DMC0,
 		.pfn		= __phys_to_pfn(S5PV210_PA_DMC0),
 		.length		= SZ_4K,
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 861d7fe..f1ff7cb 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -60,6 +60,7 @@
 #define S3C_VA_UARTx(x)		(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
 
 #define S5PV210_PA_SROMC	(0xE8000000)
+#define S5P_PA_SROMC		S5PV210_PA_SROMC
 
 #define S5PV210_PA_CFCON	(0xE8200000)
 
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 7acf4e7..279723d 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -59,6 +59,7 @@
 #define S5PV310_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 
 #define S5PV310_PA_SROMC		(0x12570000)
+#define S5P_PA_SROMC			S5PV310_PA_SROMC
 
 #define S5PV310_PA_UART			(0x13800000)
 
diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
index 74f7f5a..047d31c 100644
--- a/arch/arm/plat-s5p/cpu.c
+++ b/arch/arm/plat-s5p/cpu.c
@@ -108,6 +108,11 @@ static struct map_desc s5p_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(S3C_PA_WDT),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S5P_VA_SROMC,
+		.pfn		= __phys_to_pfn(S5P_PA_SROMC),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
 	},
 };
 
-- 
1.6.2.5
