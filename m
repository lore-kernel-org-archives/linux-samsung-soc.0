From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S3C24XX: Fix potential NULL pointer dereference error
Date: Thu,  8 Nov 2012 14:31:31 +0530
Message-ID: <1352365291-32433-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:32913 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419Ab2KHJHL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Nov 2012 04:07:11 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so1841169pad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Nov 2012 01:07:10 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

chan->end is tested for being NULL. However in the event that it is NULL, the
subsequent assignment statement would lead to NULL pointer dereference.
Thus dereferencing it only when it is not NULL.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Based on Kukjin Kim's for-next branch. Compile tested.
---
 arch/arm/plat-s3c24xx/dma.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
index db98e70..0abd1c4 100644
--- a/arch/arm/plat-s3c24xx/dma.c
+++ b/arch/arm/plat-s3c24xx/dma.c
@@ -473,12 +473,13 @@ int s3c2410_dma_enqueue(enum dma_ch channel, void *id,
 		pr_debug("dma%d: %s: buffer %p queued onto non-empty channel\n",
 			 chan->number, __func__, buf);
 
-		if (chan->end == NULL)
+		if (chan->end == NULL) {
 			pr_debug("dma%d: %s: %p not empty, and chan->end==NULL?\n",
 				 chan->number, __func__, chan);
-
-		chan->end->next = buf;
-		chan->end = buf;
+		} else {
+			chan->end->next = buf;
+			chan->end = buf;
+		}
 	}
 
 	/* if necessary, update the next buffer field */
-- 
1.7.4.1
