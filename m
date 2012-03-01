From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/3] ARM: Exynos: fix touchscreen IRQ setup on Universal C210
 board
Date: Thu, 01 Mar 2012 09:40:21 +0100
Message-ID: <1330591221-31458-4-git-send-email-m.szyprowski@samsung.com>
References: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56080 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758067Ab2CAImP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 03:42:15 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M07006LJ6SFHS50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0700JZE6SFDQ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
In-reply-to: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Fixes atmel_mxt_ts freeze on Universal C210.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 7cd738c..e0cd5bb 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio.h>
+#include <linux/interrupt.h>
 #include <linux/fb.h>
 #include <linux/mfd/max8998.h>
 #include <linux/regulator/machine.h>
@@ -604,6 +605,7 @@ static struct mxt_platform_data qt602240_platform_data = {
 	.threshold	= 0x28,
 	.voltage	= 2800000,		/* 2.8V */
 	.orient		= MXT_DIAGONAL,
+	.irqflags	= IRQF_TRIGGER_FALLING,
 };
 
 static struct i2c_board_info i2c3_devs[] __initdata = {
-- 
1.7.1.569.g6f426
