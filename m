From: Todd Poynor <toddpoynor@google.com>
Subject: [PATCH] ARM: samsung: adc: fix race in s3c_adc_start
Date: Wed, 11 Jul 2012 19:12:11 -0700
Message-ID: <1342059131-31251-1-git-send-email-toddpoynor@google.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f74.google.com ([209.85.216.74]:59149 "EHLO
	mail-qa0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754018Ab2GLCM0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 22:12:26 -0400
Received: by qabg24 with SMTP id g24so212637qab.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jul 2012 19:12:26 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, eunki_kim@samsung.com, Todd Poynor <toddpoynor@google.com>

Checking for adc->ts_pend already claimed should be done with the
lock held.

Change-Id: Ic9f15e26bd19934ab8c2885ce5df265933ac304a
Signed-off-by: Todd Poynor <toddpoynor@google.com>
---
 arch/arm/plat-samsung/adc.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 33ecd0c..b1e05cc 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -157,11 +157,13 @@ int s3c_adc_start(struct s3c_adc_client *client,
 		return -EINVAL;
 	}
 
-	if (client->is_ts && adc->ts_pend)
-		return -EAGAIN;
-
 	spin_lock_irqsave(&adc->lock, flags);
 
+	if (client->is_ts && adc->ts_pend) {
+		spin_unlock_irqrestore(&adc->lock, flags);
+		return -EAGAIN;
+	}
+
 	client->channel = channel;
 	client->nr_samples = nr_samples;
 
-- 
1.7.7.3
