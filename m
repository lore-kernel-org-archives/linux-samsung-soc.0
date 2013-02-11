From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 2/5] DMA: PL330: Add xlate function
Date: Mon, 11 Feb 2013 14:08:22 +0530
Message-ID: <1360571905-15285-3-git-send-email-padma.v@samsung.com>
References: <1360571905-15285-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63919 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219Ab3BKIiC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Feb 2013 03:38:02 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI1008Q7RZ7XJ60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 17:38:01 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MI1001YDRZ0HC30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 17:38:00 +0900 (KST)
In-reply-to: <1360571905-15285-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org, robherring2@gmail.com

Add xlate to translate the device-tree binding information into
the appropriate format. The filter function requires the dma
controller device and dma channel number as filter_params.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/pl330.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 87110f2..e68c83b 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -25,6 +25,7 @@
 #include <linux/amba/pl330.h>
 #include <linux/scatterlist.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 
 #include "dmaengine.h"
 #define PL330_MAX_CHAN		8
@@ -2379,6 +2380,30 @@ bool pl330_filter(struct dma_chan *chan, void *param)
 }
 EXPORT_SYMBOL(pl330_filter);
 
+static struct dma_chan *of_dma_pl330_xlate(struct of_phandle_args *dma_spec,
+						struct of_dma *ofdma)
+{
+	int count = dma_spec->args_count;
+	struct dma_pl330_dmac *pdmac = ofdma->of_dma_data;
+	struct dma_pl330_filter_args fargs;
+	dma_cap_mask_t cap;
+
+	if (!pdmac)
+		return NULL;
+
+	if (count != 1)
+		return NULL;
+
+	fargs.pdmac = pdmac;
+	fargs.chan_id = dma_spec->args[0];
+
+	dma_cap_zero(cap);
+	dma_cap_set(DMA_SLAVE, cap);
+	dma_cap_set(DMA_CYCLIC, cap);
+
+	return dma_request_channel(cap, pl330_dt_filter, &fargs);
+}
+
 static int pl330_alloc_chan_resources(struct dma_chan *chan)
 {
 	struct dma_pl330_chan *pch = to_pchan(chan);
-- 
1.7.4.4
