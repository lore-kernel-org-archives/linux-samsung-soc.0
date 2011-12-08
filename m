From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/2] DMA: PL330: Removes useless function
Date: Thu, 08 Dec 2011 17:23:58 +0900
Message-ID: <002a01ccb582$bbcdbba0$336932e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42635 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287Ab1LHIYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 03:24:00 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVV00ID0LYCNSF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Dec 2011 17:23:59 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVV00MEELZWB5E0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 08 Dec 2011 17:23:58 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, jassisinghbrar@gmail.com, 'Linus Walleij' <linus.walleij@linaro.org>, rmk+kernel@arm.linux.org.uk, 'Boojin Kim' <boojin.kim@samsung.com>, kgene.kim@samsung.com

From: Boojin Kim <boojin.kim@samsung.com>

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Vinod Koul <vinod.koul@intel.com>
Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/dma/pl330.c |   47 -----------------------------------------------
 1 files changed, 0 insertions(+), 47 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 35f0904..b917477 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -1512,53 +1512,6 @@ static int pl330_chan_ctrl(void *ch_id, enum pl330_chan_op op)
 	return ret;
 }
 
-static int pl330_chan_status(void *ch_id, struct pl330_chanstatus *pstatus)
-{
-	struct pl330_thread *thrd = ch_id;
-	struct pl330_dmac *pl330;
-	struct pl330_info *pi;
-	void __iomem *regs;
-	int active;
-	u32 val;
-
-	if (!pstatus || !thrd || thrd->free)
-		return -EINVAL;
-
-	pl330 = thrd->dmac;
-	pi = pl330->pinfo;
-	regs = pi->base;
-
-	/* The client should remove the DMAC and add again */
-	if (pl330->state == DYING)
-		pstatus->dmac_halted = true;
-	else
-		pstatus->dmac_halted = false;
-
-	val = readl(regs + FSC);
-	if (val & (1 << thrd->id))
-		pstatus->faulting = true;
-	else
-		pstatus->faulting = false;
-
-	active = _thrd_active(thrd);
-
-	if (!active) {
-		/* Indicate that the thread is not running */
-		pstatus->top_req = NULL;
-		pstatus->wait_req = NULL;
-	} else {
-		active--;
-		pstatus->top_req = thrd->req[active].r;
-		pstatus->wait_req = !IS_FREE(&thrd->req[1 - active])
-					? thrd->req[1 - active].r : NULL;
-	}
-
-	pstatus->src_addr = readl(regs + SA(thrd->id));
-	pstatus->dst_addr = readl(regs + DA(thrd->id));
-
-	return 0;
-}
-
 /* Reserve an event */
 static inline int _alloc_event(struct pl330_thread *thrd)
 {
-- 
1.7.1
