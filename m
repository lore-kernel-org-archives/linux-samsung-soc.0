From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 4/4] DMA: PL330: Modify pl330 filter based on new generic dma
 dt bindings.
Date: Fri, 18 Jan 2013 17:03:44 +0530
Message-ID: <1358508824-20352-5-git-send-email-padma.v@samsung.com>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22267 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729Ab3ARLj4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:39:56 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00F3CKEHT2R0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:39:55 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00M2KK3GTU10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:39:54 +0900 (KST)
In-reply-to: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org

This patch modify the filter function to filter the required channel
based on new filter params.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/dma/pl330.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index b80ef97..a773ea7 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2378,15 +2378,8 @@ bool pl330_filter(struct dma_chan *chan, void *param)
 
 #ifdef CONFIG_OF
 	if (chan->device->dev->of_node) {
-		const __be32 *prop_value;
-		phandle phandle;
-		struct device_node *node;
-
-		prop_value = ((struct property *)param)->value;
-		phandle = be32_to_cpup(prop_value++);
-		node = of_find_node_by_phandle(phandle);
-		return ((chan->private == node) &&
-				(chan->chan_id == be32_to_cpup(prop_value)));
+		struct of_phandle_args *dma_spec = param;
+		return ((chan->private == dma_spec->np) && (chan->chan_id == dma_spec->args[0]));
 	}
 #endif
 
-- 
1.7.4.4
