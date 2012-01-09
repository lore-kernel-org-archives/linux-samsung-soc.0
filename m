From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] DMA: PL330: Fix calculating burst_size
Date: Mon, 09 Jan 2012 16:11:20 +0900
Message-ID: <002901ccce9d$e4d84db0$ae88e910$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60838 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754247Ab2AIHL0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 02:11:26 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Boojin Kim' <boojin.kim@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Boojin Kim <boojin.kim@samsung.com>

The burst size of PL330 DMAC should be aligned with source
address, destination address and size. If not, PL330 DMAC
HW generates transmit or data mismatch error. This patch
adds the condition that checks the align of source and
destination address for burst size.

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/dma/pl330.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index d87d884..c3f7fcb 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2553,7 +2553,7 @@ pl330_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
 	burst = pi->pcfg.data_bus_width / 8;
 
 	while (burst > 1) {
-		if (!(len % burst))
+		if (!(len % burst) && !(dst % burst) && !(src % burst))
 			break;
 		burst /= 2;
 	}
-- 
1.7.1
