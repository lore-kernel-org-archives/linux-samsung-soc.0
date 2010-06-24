From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 1/2] ARM: S5PV210: Fix Aquila board UART FIFO mode configration
Date: Thu, 24 Jun 2010 13:35:04 +0900
Message-ID: <1277354105-13097-1-git-send-email-jy0922.shim@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59162 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab0FXEf2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jun 2010 00:35:28 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4I00EL94R2K520@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 13:35:26 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4I00G8T4R2D1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 13:35:26 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

The Aquila board uses max UART FIFO size to each UART channels. UART0
supports 256 bytes FIFO, but Aquila board supports 128 bytes FIFO
because of initial chip bug.

Also, this patch fixes to "s/smdkv210/aquila".

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |   24 +++++++++++++++---------
 1 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 10bc76e..5795a7c 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -39,38 +39,44 @@
 
 #define S5PV210_ULCON_DEFAULT	S3C2410_LCON_CS8
 
-#define S5PV210_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
-				 S5PV210_UFCON_TXTRIG4 |	\
-				 S5PV210_UFCON_RXTRIG4)
+#define S5PV210_UFCON_DEFAULT	S3C2410_UFCON_FIFOMODE
 
-static struct s3c2410_uartcfg smdkv210_uartcfgs[] __initdata = {
+static struct s3c2410_uartcfg aquila_uartcfgs[] __initdata = {
 	[0] = {
 		.hwport		= 0,
 		.flags		= 0,
 		.ucon		= S5PV210_UCON_DEFAULT,
 		.ulcon		= S5PV210_ULCON_DEFAULT,
-		.ufcon		= S5PV210_UFCON_DEFAULT,
+		/*
+		 * Actually UART0 can support 256 bytes fifo, but aquila board
+		 * supports 128 bytes fifo because of initial chip bug
+		 */
+		.ufcon		= S5PV210_UFCON_DEFAULT |
+			S5PV210_UFCON_TXTRIG128 | S5PV210_UFCON_RXTRIG128,
 	},
 	[1] = {
 		.hwport		= 1,
 		.flags		= 0,
 		.ucon		= S5PV210_UCON_DEFAULT,
 		.ulcon		= S5PV210_ULCON_DEFAULT,
-		.ufcon		= S5PV210_UFCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT |
+			S5PV210_UFCON_TXTRIG64 | S5PV210_UFCON_RXTRIG64,
 	},
 	[2] = {
 		.hwport		= 2,
 		.flags		= 0,
 		.ucon		= S5PV210_UCON_DEFAULT,
 		.ulcon		= S5PV210_ULCON_DEFAULT,
-		.ufcon		= S5PV210_UFCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT |
+			S5PV210_UFCON_TXTRIG16 | S5PV210_UFCON_RXTRIG16,
 	},
 	[3] = {
 		.hwport		= 3,
 		.flags		= 0,
 		.ucon		= S5PV210_UCON_DEFAULT,
 		.ulcon		= S5PV210_ULCON_DEFAULT,
-		.ufcon		= S5PV210_UFCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT |
+			S5PV210_UFCON_TXTRIG16 | S5PV210_UFCON_RXTRIG16,
 	},
 };
 
@@ -124,7 +130,7 @@ static void __init aquila_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
 	s3c24xx_init_clocks(24000000);
-	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
+	s3c24xx_init_uarts(aquila_uartcfgs, ARRAY_SIZE(aquila_uartcfgs));
 }
 
 static void __init aquila_machine_init(void)
-- 
1.7.0.4
