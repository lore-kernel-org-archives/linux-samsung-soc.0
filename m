From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH v8 03/16] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Fri,  2 Sep 2011 09:44:31 +0900
Message-ID: <1314924284-25554-4-git-send-email-boojin.kim@samsung.com>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41985 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932608Ab1IBIaf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Sep 2011 04:30:35 -0400
In-Reply-To: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Boojin Kim <boojin.kim@samsung.com>

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/dma/pl330.c |   49 +++++++++++++++++++++++++++++++++++++------------
 1 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index d5829c7..e7f9d1d 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -73,6 +73,7 @@ struct dma_pl330_chan {
 
 	/* For D-to-M and M-to-D channels */
 	int burst_sz; /* the peripheral fifo width */
+	int burst_len; /* the number of burst */
 	dma_addr_t fifo_addr;
 };
 
@@ -263,23 +264,47 @@ static int pl330_control(struct dma_chan *chan, enum dma_ctrl_cmd cmd, unsigned
 	struct dma_pl330_chan *pch = to_pchan(chan);
 	struct dma_pl330_desc *desc;
 	unsigned long flags;
+	struct dma_pl330_dmac *pdmac = pch->dmac;
+	struct dma_slave_config *slave_config;
 
-	/* Only supports DMA_TERMINATE_ALL */
-	if (cmd != DMA_TERMINATE_ALL)
-		return -ENXIO;
+	switch (cmd) {
+	case DMA_TERMINATE_ALL:
+		spin_lock_irqsave(&pch->lock, flags);
 
-	spin_lock_irqsave(&pch->lock, flags);
+		/* FLUSH the PL330 Channel thread */
+		pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUSH);
 
-	/* FLUSH the PL330 Channel thread */
-	pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUSH);
-
-	/* Mark all desc done */
-	list_for_each_entry(desc, &pch->work_list, node)
-		desc->status = DONE;
+		/* Mark all desc done */
+		list_for_each_entry(desc, &pch->work_list, node)
+			desc->status = DONE;
 
-	spin_unlock_irqrestore(&pch->lock, flags);
+		spin_unlock_irqrestore(&pch->lock, flags);
 
-	pl330_tasklet((unsigned long) pch);
+		pl330_tasklet((unsigned long) pch);
+		break;
+	case DMA_SLAVE_CONFIG:
+		slave_config = (struct dma_slave_config *)arg;
+
+		if (slave_config->direction == DMA_TO_DEVICE) {
+			if (slave_config->dst_addr)
+				pch->fifo_addr = slave_config->dst_addr;
+			if (slave_config->dst_addr_width)
+				pch->burst_sz = __ffs(slave_config->dst_addr_width);
+			if (slave_config->dst_maxburst)
+				pch->burst_len = slave_config->dst_maxburst;
+		} else if (slave_config->direction == DMA_FROM_DEVICE) {
+			if (slave_config->src_addr)
+				pch->fifo_addr = slave_config->src_addr;
+			if (slave_config->src_addr_width)
+				pch->burst_sz = __ffs(slave_config->src_addr_width);
+			if (slave_config->src_maxburst)
+				pch->burst_len = slave_config->src_maxburst;
+		}
+		break;
+	default:
+		dev_err(pch->dmac->pif.dev, "Not supported command.\n");
+		return -ENXIO;
+	}
 
 	return 0;
 }
-- 
1.7.1
