From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH] dmaengine: pl330: Fix race in residue reporting
Date: Fri,  6 Nov 2015 12:11:35 +0100
Message-ID: <1446808295-23149-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43228 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031997AbbKFLLl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Nov 2015 06:11:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dmaengine@vger.kernel.org, linux-arm-kernel@vger.kernel.org

When a transfer completes there is a small window between the descriptor
being unset as the current active one in the thread and it being marked
as done. This causes the residue to be incorrectly set when
pl330_tx_status is run in that window. Practically this caused
issue for me with audio playback as the residue goes up during a
transfer (as the in-progress transfer is no longer accounted for),
which makes the higher levels think the audio ringbuffer wrapped around
and thus did a sudden big jump forward.

To resolve this, add a field protected by the dma engine lock to
indicate the transfer is done but the status hasn't been updated yet.

Also fix the locking in pl330_tx_status, as the function inspects the
threads req_running field and queries the dma engine for the current
state of the running transfer the dma engine lock needs to be held to
ensure the active descriptor doesn't change underneath it.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

---

 drivers/dma/pl330.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 17ee758..6c8243b 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -503,6 +503,8 @@ struct dma_pl330_desc {
 	struct pl330_reqcfg rqcfg;
 
 	enum desc_status status;
+	/* Transfer completed, but not yet moved to DONE state */
+	bool xferred;
 
 	int bytes_requested;
 	bool last;
@@ -1463,6 +1465,9 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
 	spin_lock_irqsave(&pch->lock, flags);
 
 	desc->status = DONE;
+	spin_lock(&pch->thread->dmac->lock);
+	desc->xferred = false;
+	spin_unlock(&pch->thread->dmac->lock);
 
 	spin_unlock_irqrestore(&pch->lock, flags);
 
@@ -1595,6 +1600,7 @@ static int pl330_update(struct pl330_dmac *pl330)
 
 			/* Detach the req */
 			descdone = thrd->req[active].desc;
+			descdone->xferred = true;
 			thrd->req[active].desc = NULL;
 
 			thrd->req_running = -1;
@@ -2250,13 +2256,14 @@ pl330_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 		goto out;
 
 	spin_lock_irqsave(&pch->lock, flags);
+	spin_lock(&pch->thread->dmac->lock);
 
 	if (pch->thread->req_running != -1)
 		running = pch->thread->req[pch->thread->req_running].desc;
 
 	/* Check in pending list */
 	list_for_each_entry(desc, &pch->work_list, node) {
-		if (desc->status == DONE)
+		if (desc->xferred || desc->status == DONE)
 			transferred = desc->bytes_requested;
 		else if (running && desc == running)
 			transferred =
@@ -2281,6 +2288,7 @@ pl330_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 		if (desc->last)
 			residual = 0;
 	}
+	spin_unlock(&pch->thread->dmac->lock);
 	spin_unlock_irqrestore(&pch->lock, flags);
 
 out:
-- 
2.6.2
