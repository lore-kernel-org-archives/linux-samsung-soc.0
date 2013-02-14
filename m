From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 2/4] DMA: PL330: Add xlate function
Date: Thu, 14 Feb 2013 09:10:06 +0530
Message-ID: <1360813208-9498-3-git-send-email-padma.v@samsung.com>
References: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24203 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753437Ab3BNDjt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 22:39:49 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI6001GZY5Z1UD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 12:39:48 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MI600N0PY5X1F30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 12:39:47 +0900 (KST)
In-reply-to: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
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
index 40e9752..f5d47e6 100644
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
