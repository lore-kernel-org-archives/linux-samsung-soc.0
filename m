From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 1/4] DMA: PL330: Add new pl330 filter for DT case.
Date: Thu, 14 Feb 2013 09:10:05 +0530
Message-ID: <1360813208-9498-2-git-send-email-padma.v@samsung.com>
References: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24184 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753055Ab3BNDjp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 22:39:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI6001GZY5Z1UD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 12:39:44 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MI600N0PY5X1F30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 12:39:44 +0900 (KST)
In-reply-to: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org, robherring2@gmail.com

This patch adds a new pl330_dt_filter for DT case to filter the
required channel based on the new filter params and modifies the
old filter only for non-DT case as suggested by Arnd Bergmann.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/pl330.c |   29 +++++++++++++++--------------
 1 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index f7edb6f..40e9752 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -606,6 +606,11 @@ struct dma_pl330_desc {
 	struct dma_pl330_chan *pchan;
 };
 
+struct dma_pl330_filter_args {
+	struct dma_pl330_dmac *pdmac;
+	unsigned int chan_id;
+};
+
 static inline void _callback(struct pl330_req *r, enum pl330_op_err err)
 {
 	if (r && r->xfer_cb)
@@ -2352,6 +2357,16 @@ static void dma_pl330_rqcb(void *token, enum pl330_op_err err)
 	tasklet_schedule(&pch->task);
 }
 
+static bool pl330_dt_filter(struct dma_chan *chan, void *param)
+{
+	struct dma_pl330_filter_args *fargs = param;
+
+	if (chan->device != &fargs->pdmac->ddma)
+		return false;
+
+	return (chan->chan_id == fargs->chan_id);
+}
+
 bool pl330_filter(struct dma_chan *chan, void *param)
 {
 	u8 *peri_id;
@@ -2359,20 +2374,6 @@ bool pl330_filter(struct dma_chan *chan, void *param)
 	if (chan->device->dev->driver != &pl330_driver.drv)
 		return false;
 
-#ifdef CONFIG_OF
-	if (chan->device->dev->of_node) {
-		const __be32 *prop_value;
-		phandle phandle;
-		struct device_node *node;
-
-		prop_value = ((struct property *)param)->value;
-		phandle = be32_to_cpup(prop_value++);
-		node = of_find_node_by_phandle(phandle);
-		return ((chan->private == node) &&
-				(chan->chan_id == be32_to_cpup(prop_value)));
-	}
-#endif
-
 	peri_id = chan->private;
 	return *peri_id == (unsigned)param;
 }
-- 
1.7.4.4
