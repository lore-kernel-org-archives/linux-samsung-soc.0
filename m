From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Clean up timed-out adc transaction
Date: Sat, 11 Feb 2012 11:52:40 +0900
Message-ID: <018101cce868$385a8140$a90f83c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45347 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752283Ab2BKCwm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 21:52:42 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ700DM1JZSX370@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:52:40 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ70084KJZSUT90@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:52:40 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, stk.lim@samsung.com, keyyoung.park@samsung.com

From: Sung-Taek Lim <stk.lim@samsung.com>

This patch tries to clean up timed-out adc transaction.
Otherwise, time-out adc transaction remains as adc->cur permanently
and may block other incoming adc transactions.

Signed-off-by: Sung-Taek Lim <stk.lim@samsung.com>
Signed-off-by: KeyYoung Park <keyyoung.park@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/adc.c |   54 +++++++++++++++++++++++-------------------
 1 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c index e4e965c..fccc644 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -185,6 +185,34 @@ int s3c_adc_start(struct s3c_adc_client *client,  }  EXPORT_SYMBOL_GPL(s3c_adc_start);
 
+static void s3c_adc_stop(struct s3c_adc_client *client) {
+	unsigned long flags;
+
+	spin_lock_irqsave(&adc_dev->lock, flags);
+
+	/* We should really check that nothing is in progress. */
+	if (adc_dev->cur == client)
+		adc_dev->cur = NULL;
+	if (adc_dev->ts_pend == client)
+		adc_dev->ts_pend = NULL;
+	else {
+		struct list_head *p, *n;
+		struct s3c_adc_client *tmp;
+
+		list_for_each_safe(p, n, &adc_pending) {
+			tmp = list_entry(p, struct s3c_adc_client, pend);
+			if (tmp == client)
+				list_del(&tmp->pend);
+		}
+	}
+
+	if (adc_dev->cur == NULL)
+		s3c_adc_try(adc_dev);
+
+	spin_unlock_irqrestore(&adc_dev->lock, flags); }
+
 static void s3c_convert_done(struct s3c_adc_client *client,
 			     unsigned v, unsigned u, unsigned *left)  { @@ -207,6 +235,7 @@ int s3c_adc_read(struct s3c_adc_client
*client, unsigned int ch)
 
 	ret = wait_event_timeout(wake, client->result >= 0, HZ / 2);
 	if (client->result < 0) {
+		s3c_adc_stop(client);
 		ret = -ETIMEDOUT;
 		goto err;
 	}
@@ -259,30 +288,7 @@ EXPORT_SYMBOL_GPL(s3c_adc_register);
 
 void s3c_adc_release(struct s3c_adc_client *client)  {
-	unsigned long flags;
-
-	spin_lock_irqsave(&adc_dev->lock, flags);
-
-	/* We should really check that nothing is in progress. */
-	if (adc_dev->cur == client)
-		adc_dev->cur = NULL;
-	if (adc_dev->ts_pend == client)
-		adc_dev->ts_pend = NULL;
-	else {
-		struct list_head *p, *n;
-		struct s3c_adc_client *tmp;
-
-		list_for_each_safe(p, n, &adc_pending) {
-			tmp = list_entry(p, struct s3c_adc_client, pend);
-			if (tmp == client)
-				list_del(&tmp->pend);
-		}
-	}
-
-	if (adc_dev->cur == NULL)
-		s3c_adc_try(adc_dev);
-
-	spin_unlock_irqrestore(&adc_dev->lock, flags);
+	s3c_adc_stop(client);
 	kfree(client);
 }
 EXPORT_SYMBOL_GPL(s3c_adc_release);
--
1.7.1
