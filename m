From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 2/3] ARM: SAMSUNG: Modify pl330 channel filter function
Date: Tue, 23 Aug 2011 03:20:29 +0530
Message-ID: <1314049830-9453-3-git-send-email-thomas.abraham@linaro.org>
References: <1314049830-9453-1-git-send-email-thomas.abraham@linaro.org>
 <1314049830-9453-2-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17355 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668Ab1HVVeD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 17:34:03 -0400
In-reply-to: <1314049830-9453-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com

With the change in dma channels private data information, the pl330
channel filter function is modified to look for a simple u8 value
instead of the now unused 'struct dma_pl330_peri' value.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/plat-samsung/dma-ops.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung/dma-ops.c
index 6e3d9ab..4f1430b 100644
--- a/arch/arm/plat-samsung/dma-ops.c
+++ b/arch/arm/plat-samsung/dma-ops.c
@@ -19,8 +19,8 @@
 
 static inline bool pl330_filter(struct dma_chan *chan, void *param)
 {
-	struct dma_pl330_peri *peri = chan->private;
-	return peri->peri_id == (unsigned)param;
+	u8 *peri_id = chan->private;
+	return *peri_id == (unsigned)param;
 }
 
 static unsigned samsung_dmadev_request(enum dma_ch dma_ch,
-- 
1.6.6.rc2
