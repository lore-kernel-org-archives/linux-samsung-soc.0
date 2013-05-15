From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] rtc: max8998: Check for pdata presence before dereferencing
Date: Wed, 15 May 2013 17:16:08 +0200
Message-ID: <1368630968-30460-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23865 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758732Ab3EOPQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 11:16:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMU009ZQIFD6560@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 May 2013 16:16:31 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, rtc-linux@googlegroups.com, jy0922.shim@samsung.com, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Currently the driver can crash with a NULL pointer dereference if no pdata
is provided, despite of successful registration of MFD part. This patch
fixes the problem by adding a NULL check before dereferencing the pdata
pointer.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/rtc/rtc-max8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-max8998.c b/drivers/rtc/rtc-max8998.c
index 48b6612..d5af7ba 100644
--- a/drivers/rtc/rtc-max8998.c
+++ b/drivers/rtc/rtc-max8998.c
@@ -285,7 +285,7 @@ static int max8998_rtc_probe(struct platform_device *pdev)
 			info->irq, ret);
 
 	dev_info(&pdev->dev, "RTC CHIP NAME: %s\n", pdev->id_entry->name);
-	if (pdata->rtc_delay) {
+	if (pdata && pdata->rtc_delay) {
 		info->lp3974_bug_workaround = true;
 		dev_warn(&pdev->dev, "LP3974 with RTC REGERR option."
 				" RTC updates will be extremely slow.\n");
-- 
1.8.2.1
