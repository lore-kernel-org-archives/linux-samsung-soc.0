From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH 3/3] DMA: PL330: Remove an unused function
Date: Thu,  8 Dec 2011 10:10:45 +0900
Message-ID: <1323306645-4003-3-git-send-email-boojin.kim@samsung.com>
References: <1323306645-4003-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53692 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448Ab1LJSKZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Dec 2011 13:10:25 -0500
In-Reply-To: <1323306645-4003-1-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Boojin Kim <boojin.kim@samsung.com>

Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 drivers/dma/pl330.c |   47 -----------------------------------------------
 1 files changed, 0 insertions(+), 47 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index f3303f0..f9b599a 100644
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
