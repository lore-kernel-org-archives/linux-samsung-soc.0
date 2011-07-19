From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH 6/7] ARM: S3C64XX: Use generic s3c_set_platdata for OneNAND
Date: Tue, 19 Jul 2011 17:35:05 +0530
Message-ID: <1311077106-28351-7-git-send-email-banajit.g@samsung.com>
References: <1311077106-28351-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55600 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751795Ab1GSMEq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 08:04:46 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOK007MYXJR4DG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 21:04:45 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOK00E78XJMQE@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 21:04:45 +0900 (KST)
In-reply-to: <1311077106-28351-1-git-send-email-banajit.g@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Call the generic s3c_set_platdata for setting platdata for OneNAND on
S3C64XX

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
---
 arch/arm/mach-s3c64xx/dev-onenand1.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/dev-onenand1.c b/arch/arm/mach-s3c64xx/dev-onenand1.c
index 92ffd5b..999f9e1 100644
--- a/arch/arm/mach-s3c64xx/dev-onenand1.c
+++ b/arch/arm/mach-s3c64xx/dev-onenand1.c
@@ -19,6 +19,8 @@
 #include <mach/irqs.h>
 #include <mach/map.h>
 
+#include <plat/devs.h>
+
 static struct resource s3c64xx_onenand1_resources[] = {
 	[0] = {
 		.start	= S3C64XX_PA_ONENAND1,
@@ -46,10 +48,6 @@ struct platform_device s3c64xx_device_onenand1 = {
 
 void s3c64xx_onenand1_set_platdata(struct onenand_platform_data *pdata)
 {
-	struct onenand_platform_data *pd;
-
-	pd = kmemdup(pdata, sizeof(struct onenand_platform_data), GFP_KERNEL);
-	if (!pd)
-		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
-	s3c64xx_device_onenand1.dev.platform_data = pd;
+	s3c_set_platdata(pdata, sizeof(struct onenand_platform_data),
+			 &s3c64xx_device_onenand1);
 }
-- 
1.7.2.3
