From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 03/10] ARM: SAMSUNG: Make dma request compatible to generic
 dma bindings.
Date: Fri, 18 Jan 2013 17:17:02 +0530
Message-ID: <1358509629-20471-4-git-send-email-padma.v@samsung.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23517 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596Ab3ARLxR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:53:17 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT005DYL0IHPK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:53:15 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00LG7KPYX890@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:53:15 +0900 (KST)
In-reply-to: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

This patch make the dma dev request operation compatible for both
DT and non-DT cases. It takes the all the arguments required for
dma_request_slave_channel and dma_request_channel. If the driver
is initiated via DT or non-DT the corresponding call will be made.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/plat-samsung/dma-ops.c              |   10 ++++++++--
 arch/arm/plat-samsung/include/plat/dma-ops.h |    3 ++-
 arch/arm/plat-samsung/s3c-dma-ops.c          |    3 ++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung/dma-ops.c
index d088afa..71d58dd 100644
--- a/arch/arm/plat-samsung/dma-ops.c
+++ b/arch/arm/plat-samsung/dma-ops.c
@@ -19,7 +19,8 @@
 #include <mach/dma.h>
 
 static unsigned samsung_dmadev_request(enum dma_ch dma_ch,
-				struct samsung_dma_req *param)
+				struct samsung_dma_req *param,
+				struct device *dev, char *ch_name)
 {
 	dma_cap_mask_t mask;
 	void *filter_param;
@@ -33,7 +34,12 @@ static unsigned samsung_dmadev_request(enum dma_ch dma_ch,
 	 */
 	filter_param = (dma_ch == DMACH_DT_PROP) ?
 		(void *)param->dt_dmach_prop : (void *)dma_ch;
-	return (unsigned)dma_request_channel(mask, pl330_filter, filter_param);
+
+	if (dev->of_node)
+		return (unsigned)dma_request_slave_channel(dev, ch_name);
+	else
+		return (unsigned)dma_request_channel(mask, pl330_filter,
+							filter_param);
 }
 
 static int samsung_dmadev_release(unsigned ch, void *param)
diff --git a/arch/arm/plat-samsung/include/plat/dma-ops.h b/arch/arm/plat-samsung/include/plat/dma-ops.h
index f5144cd..1141782 100644
--- a/arch/arm/plat-samsung/include/plat/dma-ops.h
+++ b/arch/arm/plat-samsung/include/plat/dma-ops.h
@@ -39,7 +39,8 @@ struct samsung_dma_config {
 };
 
 struct samsung_dma_ops {
-	unsigned (*request)(enum dma_ch ch, struct samsung_dma_req *param);
+	unsigned (*request)(enum dma_ch ch, struct samsung_dma_req *param,
+				struct device *dev, char *ch_name);
 	int (*release)(unsigned ch, void *param);
 	int (*config)(unsigned ch, struct samsung_dma_config *param);
 	int (*prepare)(unsigned ch, struct samsung_dma_prep *param);
diff --git a/arch/arm/plat-samsung/s3c-dma-ops.c b/arch/arm/plat-samsung/s3c-dma-ops.c
index f99448c..0cc40ae 100644
--- a/arch/arm/plat-samsung/s3c-dma-ops.c
+++ b/arch/arm/plat-samsung/s3c-dma-ops.c
@@ -36,7 +36,8 @@ static void s3c_dma_cb(struct s3c2410_dma_chan *channel, void *param,
 }
 
 static unsigned s3c_dma_request(enum dma_ch dma_ch,
-					struct samsung_dma_req *param)
+				struct samsung_dma_req *param,
+				struct device *dev, char *ch_name)
 {
 	struct cb_data *data;
 
-- 
1.7.4.4
