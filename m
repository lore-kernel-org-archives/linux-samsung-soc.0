From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH 3/7] ARM: SAMSUNG: Use generic s3c_set_platdata for HWMON
Date: Tue, 19 Jul 2011 17:35:02 +0530
Message-ID: <1311077106-28351-4-git-send-email-banajit.g@samsung.com>
References: <1311077106-28351-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55585 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751795Ab1GSMEn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 08:04:43 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOK007MYXJR4DG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 21:04:42 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOK00E78XJMQE@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 21:04:42 +0900 (KST)
In-reply-to: <1311077106-28351-1-git-send-email-banajit.g@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Call the generic s3c_set_platdata to set HWMON platform data

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
---
 arch/arm/plat-samsung/dev-hwmon.c |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm/plat-samsung/dev-hwmon.c b/arch/arm/plat-samsung/dev-hwmon.c
index b3ffb95..c91a79c 100644
--- a/arch/arm/plat-samsung/dev-hwmon.c
+++ b/arch/arm/plat-samsung/dev-hwmon.c
@@ -27,16 +27,6 @@ struct platform_device s3c_device_hwmon = {
 
 void __init s3c_hwmon_set_platdata(struct s3c_hwmon_pdata *pd)
 {
-	struct s3c_hwmon_pdata *npd;
-
-	if (!pd) {
-		printk(KERN_ERR "%s: no platform data\n", __func__);
-		return;
-	}
-
-	npd = kmemdup(pd, sizeof(struct s3c_hwmon_pdata), GFP_KERNEL);
-	if (!npd)
-		printk(KERN_ERR "%s: no memory for platform data\n", __func__);
-
-	s3c_device_hwmon.dev.platform_data = npd;
+	s3c_set_platdata(pd, sizeof(struct s3c_hwmon_pdata),
+			 &s3c_device_hwmon);
 }
-- 
1.7.2.3
