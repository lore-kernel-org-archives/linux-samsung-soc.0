From: Alban Browaeys <alban.browaeys@gmail.com>
Subject: [PATCH] [RFC PATCH] dmaengine: pl330: residual - do not reset on last descriptor.
Date: Tue,  7 Jul 2015 13:05:31 +0200
Message-ID: <1436267131-19556-1-git-send-email-prahal@yahoo.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:36197 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756886AbbGGLF6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jul 2015 07:05:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>, gabriel@unseen.is
Cc: linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Alban Browaeys <prahal@yahoo.com>

Removed the residual rest to zero on last descriptor.

Also set residue granularity to BURST instead of SEGMENT.
This last item needs more investigation before I could give a rationale
for it.

Signed-off-by: Alban Browaeys <prahal@yahoo.com>
Reported-by: gabriel@unseen.is
Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Fixes: aee4d1fac887 ("dmaengine: pl330: improve pl330_tx_status()
function")

---

My older local version of the residue :
https://github.com/prahal/linux/blob/odroid-3.19/drivers/dma/pl330.c#L2230

I took a second look at both and noticed that in the upstream version,
I was not able to make sense of the "if desc->last then reset residual
to zero" in the loop. Early tests gives a proper sound ouput with it
removed.

More tests are welcome, and it could be the flag change is wrong.

There is also a bad interaction with pulseaudio when the buffer size is
small : https://bugs.freedesktop.org/show_bug.cgi?id=84878. This
might affect testing.
---
 drivers/dma/pl330.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index f513f77..0851f41 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2275,8 +2275,6 @@ pl330_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 			}
 			break;
 		}
-		if (desc->last)
-			residual = 0;
 	}
 	spin_unlock_irqrestore(&pch->lock, flags);
 
@@ -2890,7 +2888,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	pd->src_addr_widths = PL330_DMA_BUSWIDTHS;
 	pd->dst_addr_widths = PL330_DMA_BUSWIDTHS;
 	pd->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
-	pd->residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
+	pd->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 
 	ret = dma_async_device_register(pd);
 	if (ret) {
-- 
2.1.4
