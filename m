From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 1/6] DMA: PL330: move filter function into driver
Date: Thu, 01 Sep 2011 14:34:37 +0530
Message-ID: <1314867882-11755-2-git-send-email-thomas.abraham@linaro.org>
References: <1314867882-11755-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35425 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756583Ab1IAJE5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Sep 2011 05:04:57 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQU005XW6JBUO50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Sep 2011 18:04:55 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQU001MY6JYD0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Sep 2011 18:04:55 +0900 (KST)
In-reply-to: <1314867882-11755-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

The dma channel selection filter function is moved from plat-samsung
into the pl330 driver. In additon to that, a check is added in the
filter function to ensure that the channel on which the filter has
been invoked is pl330 channel instance (and avoid any incorrect
access of chan->private in a system with multiple types of DMA
drivers).

Suggested-by: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/plat-samsung/dma-ops.c |    6 ------
 drivers/dma/pl330.c             |   15 +++++++++++++++
 include/linux/amba/pl330.h      |    2 ++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung/dma-ops.c
index 6e3d9ab..8d18425 100644
--- a/arch/arm/plat-samsung/dma-ops.c
+++ b/arch/arm/plat-samsung/dma-ops.c
@@ -17,12 +17,6 @@
 
 #include <mach/dma.h>
 
-static inline bool pl330_filter(struct dma_chan *chan, void *param)
-{
-	struct dma_pl330_peri *peri = chan->private;
-	return peri->peri_id == (unsigned)param;
-}
-
 static unsigned samsung_dmadev_request(enum dma_ch dma_ch,
 				struct samsung_dma_info *info)
 {
diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 95976cf..7df2516 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -116,6 +116,9 @@ struct dma_pl330_desc {
 	struct dma_pl330_chan *pchan;
 };
 
+/* forward declaration */
+static struct amba_driver pl330_driver;
+
 static inline struct dma_pl330_chan *
 to_pchan(struct dma_chan *ch)
 {
@@ -267,6 +270,18 @@ static void dma_pl330_rqcb(void *token, enum pl330_op_err err)
 	tasklet_schedule(&pch->task);
 }
 
+bool pl330_filter(struct dma_chan *chan, void *param)
+{
+	struct dma_pl330_peri *peri;
+
+	if (chan->device->dev->driver != &pl330_driver.drv)
+		return false;
+
+	peri = chan->private;
+	return peri->peri_id == (unsigned)param;
+}
+EXPORT_SYMBOL(pl330_filter);
+
 static int pl330_alloc_chan_resources(struct dma_chan *chan)
 {
 	struct dma_pl330_chan *pch = to_pchan(chan);
diff --git a/include/linux/amba/pl330.h b/include/linux/amba/pl330.h
index d12f077..6db72da 100644
--- a/include/linux/amba/pl330.h
+++ b/include/linux/amba/pl330.h
@@ -12,6 +12,7 @@
 #ifndef	__AMBA_PL330_H_
 #define	__AMBA_PL330_H_
 
+#include <linux/dmaengine.h>
 #include <asm/hardware/pl330.h>
 
 struct dma_pl330_peri {
@@ -38,4 +39,5 @@ struct dma_pl330_platdata {
 	unsigned mcbuf_sz;
 };
 
+extern bool pl330_filter(struct dma_chan *chan, void *param);
 #endif	/* __AMBA_PL330_H_ */
-- 
1.6.6.rc2
