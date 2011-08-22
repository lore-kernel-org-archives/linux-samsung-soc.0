From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 2/3] ARM: SAMSUNG: Modify pl330 channel filter function
Date: Tue, 23 Aug 2011 03:29:44 +0530
Message-ID: <1314050385-9617-3-git-send-email-thomas.abraham@linaro.org>
References: <1314050385-9617-1-git-send-email-thomas.abraham@linaro.org>
 <1314050385-9617-2-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31570 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668Ab1HVVnQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 17:43:16 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQC0064QN014SA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 06:43:15 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQC00M1CMZXIN@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 06:43:15 +0900 (KST)
In-reply-to: <1314050385-9617-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
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
