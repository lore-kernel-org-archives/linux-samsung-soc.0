From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/4] DMA: PL330: Add xlate function
Date: Fri, 18 Jan 2013 17:03:41 +0530
Message-ID: <1358508824-20352-2-git-send-email-padma.v@samsung.com>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46466 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836Ab3ARLgO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:36:14 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00JYPK84NMW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:36:13 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00M2KK3GTU10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:36:12 +0900 (KST)
In-reply-to: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org

Add xlate to translate the device-tree binding information into
the appropriate format. The filter function requires the dma
controller device node and dma channel number as filter_params.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/dma/pl330.c |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 80680ee..b0a9080 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -25,6 +25,7 @@
 #include <linux/amba/pl330.h>
 #include <linux/scatterlist.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 
 #include "dmaengine.h"
 #define PL330_MAX_CHAN		8
@@ -2352,6 +2353,22 @@ static void dma_pl330_rqcb(void *token, enum pl330_op_err err)
 	tasklet_schedule(&pch->task);
 }
 
+struct dma_chan *of_dma_pl330_xlate(struct of_phandle_args *dma_spec,
+						struct of_dma *ofdma)
+{
+	int count = dma_spec->args_count;
+	struct of_dma_filter_info *info = ofdma->of_dma_data;
+
+	if (!info || !info->filter_fn)
+		return NULL;
+
+	if (count != 1)
+		return NULL;
+
+	return dma_request_channel(info->dma_cap, info->filter_fn, dma_spec);
+}
+EXPORT_SYMBOL_GPL(of_dma_pl330_xlate);
+
 bool pl330_filter(struct dma_chan *chan, void *param)
 {
 	u8 *peri_id;
-- 
1.7.4.4
