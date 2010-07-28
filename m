From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/2] ARM: S5PV210: Add the GPIO lib
Date: Wed, 28 Jul 2010 12:04:45 +0900
Message-ID: <4C4F9E4D.4090608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35445 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751879Ab0G1DEy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Jul 2010 23:04:54 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6800371Z7X2IF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 12:04:45 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L680097CZ7XEO@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 12:04:45 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben@simtec.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

This patch add the definition of GPIO to support WM8994 audio codec on
I2C bus.

Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/gpio.h |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/gpio.h b/arch/arm/mach-s5pv210/include/mach/gpio.h
index d6461ba..33a9867 100644
--- a/arch/arm/mach-s5pv210/include/mach/gpio.h
+++ b/arch/arm/mach-s5pv210/include/mach/gpio.h
@@ -52,6 +52,8 @@
 #define S5PV210_GPIO_MP01_NR	(8)
 #define S5PV210_GPIO_MP02_NR	(4)
 #define S5PV210_GPIO_MP03_NR	(8)
+#define S5PV210_GPIO_MP04_NR	(8)
+#define S5PV210_GPIO_MP05_NR	(8)
 
 /* GPIO bank numbers */
 
@@ -94,6 +96,8 @@ enum s5p_gpio_number {
 	S5PV210_GPIO_MP01_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_J4),
 	S5PV210_GPIO_MP02_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP01),
 	S5PV210_GPIO_MP03_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP02),
+	S5PV210_GPIO_MP04_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP03),
+	S5PV210_GPIO_MP05_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP04),
 };
 
 /* S5PV210 GPIO number definitions */
@@ -127,13 +131,15 @@ enum s5p_gpio_number {
 #define S5PV210_MP01(_nr)	(S5PV210_GPIO_MP01_START + (_nr))
 #define S5PV210_MP02(_nr)	(S5PV210_GPIO_MP02_START + (_nr))
 #define S5PV210_MP03(_nr)	(S5PV210_GPIO_MP03_START + (_nr))
+#define S5PV210_MP04(_nr)	(S5PV210_GPIO_MP04_START + (_nr))
+#define S5PV210_MP05(_nr)	(S5PV210_GPIO_MP05_START + (_nr))
 
 /* the end of the S5PV210 specific gpios */
-#define S5PV210_GPIO_END	(S5PV210_MP03(S5PV210_GPIO_MP03_NR) + 1)
+#define S5PV210_GPIO_END	(S5PV210_MP05(S5PV210_GPIO_MP05_NR) + 1)
 #define S3C_GPIO_END		S5PV210_GPIO_END
 
 /* define the number of gpios we need to the one after the MP03() range */
-#define ARCH_NR_GPIOS		(S5PV210_MP03(S5PV210_GPIO_MP03_NR) +	\
+#define ARCH_NR_GPIOS		(S5PV210_MP05(S5PV210_GPIO_MP05_NR) +	\
 				 CONFIG_SAMSUNG_GPIO_EXTRA + 1)
 
 #include <asm-generic/gpio.h>
