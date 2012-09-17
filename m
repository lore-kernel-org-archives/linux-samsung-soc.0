From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH] DMA: PL330: return ENOMEM instead of 0 from pl330_alloc_chan_resources
Date: Mon, 17 Sep 2012 09:57:45 +0530
Message-ID: <1347856065-14027-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:45261 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367Ab2IQE2A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 00:28:00 -0400
Received: by pbbrr13 with SMTP id rr13so8421120pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Sep 2012 21:27:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, boojin.kim@samsung.com, jassisinghbrar@gmail.com, Inderpal Singh <inderpal.singh@linaro.org>

Since 0 is not considered as error at dmaengine level, return ENOMEM
from pl330_alloc_chan_resources in case of failure.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 drivers/dma/pl330.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index e4feba6..14d881c 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2393,7 +2393,7 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
 	pch->pl330_chid = pl330_request_channel(&pdmac->pif);
 	if (!pch->pl330_chid) {
 		spin_unlock_irqrestore(&pch->lock, flags);
-		return 0;
+		return -ENOMEM;
 	}
 
 	tasklet_init(&pch->task, pl330_tasklet, (unsigned long) pch);
-- 
1.7.9.5
