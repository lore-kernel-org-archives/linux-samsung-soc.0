From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Samsung: add a workaround for get_clock() for serial
 driver
Date: Wed, 29 Sep 2010 16:14:45 +0200
Message-ID: <1285769685-11849-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:16521 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab0I2OOx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Sep 2010 10:14:53 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L9I00M4TI8QKZ@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 15:14:50 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L9I00HS5I8P7L@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 15:14:50 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Serial drivers call get_clock() very early, before platform bus
has been set up, this requires a special check to let them get
a proper clock. Without this patch, a serial console is broken
on Universal C210 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/clock.c |   25 ++++++++++++++++++++++++-
 1 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 90a2051..da847f1 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -48,6 +48,9 @@
 #include <plat/clock.h>
 #include <plat/cpu.h>
 
+#include <linux/serial_core.h>
+#include <plat/regs-serial.h> /* for s3c24xx_uart_devs */
+
 /* clock information */
 
 static LIST_HEAD(clocks);
@@ -65,6 +68,26 @@ static int clk_null_enable(struct clk *clk, int enable)
 	return 0;
 }
 
+static int dev_is_s3c_uart(struct device *dev)
+{
+	struct platform_device **pdev = s3c24xx_uart_devs;
+	int i;
+	for (i=0; i<ARRAY_SIZE(s3c24xx_uart_devs); i++, pdev++)
+		if (*pdev && dev == &(*pdev)->dev)
+			return 1;
+	return 0;
+}
+
+/* Serial drivers call get_clock() very early, before platform bus
+   has been set up, this requires a special check to let them get
+   a proper clock */
+
+static int dev_is_platform_device(struct device *dev)
+{
+	return dev->bus == &platform_bus_type ||
+	       (dev->bus == NULL && dev_is_s3c_uart(dev));
+}
+
 /* Clock API calls */
 
 struct clk *clk_get(struct device *dev, const char *id)
@@ -73,7 +96,7 @@ struct clk *clk_get(struct device *dev, const char *id)
 	struct clk *clk = ERR_PTR(-ENOENT);
 	int idno;
 
-	if (dev == NULL || dev->bus != &platform_bus_type)
+	if (dev == NULL || !dev_is_platform_device(dev))
 		idno = -1;
 	else
 		idno = to_platform_device(dev)->id;
-- 
1.7.1.569.g6f426
