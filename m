From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] drm/bridge/sii8620: fix loops in EDID fetch logic
Date: Mon, 15 Jan 2018 18:33:57 +0100
Message-ID: <20180115173357.31067-4-a.hajda@samsung.com>
References: <20180115173357.31067-1-a.hajda@samsung.com>
        <CGME20180115173409eucas1p14248e60263dabb683ccd457fd89d4e69@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60380 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752419AbeAOReM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 12:34:12 -0500
In-reply-to: <20180115173357.31067-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Function should constantly check if cable is connected and finish
in finite time.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 7c46847fef18..f65e14836c0e 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -801,6 +801,7 @@ static void sii8620_burst_rx_all(struct sii8620 *ctx)
 static void sii8620_fetch_edid(struct sii8620 *ctx)
 {
 	u8 lm_ddc, ddc_cmd, int3, cbus;
+	unsigned long timeout;
 	int fetched, i;
 	int edid_len = EDID_LENGTH;
 	u8 *edid;
@@ -850,23 +851,31 @@ static void sii8620_fetch_edid(struct sii8620 *ctx)
 			REG_DDC_CMD, ddc_cmd | VAL_DDC_CMD_ENH_DDC_READ_NO_ACK
 		);
 
-		do {
-			int3 = sii8620_readb(ctx, REG_INTR3);
+		int3 = 0;
+		timeout = jiffies + msecs_to_jiffies(200);
+		for (;;) {
 			cbus = sii8620_readb(ctx, REG_CBUS_STATUS);
-
-			if (int3 & BIT_DDC_CMD_DONE)
-				break;
-
-			if (!(cbus & BIT_CBUS_STATUS_CBUS_CONNECTED)) {
+			if (~cbus & BIT_CBUS_STATUS_CBUS_CONNECTED) {
+				kfree(edid);
+				edid = NULL;
+				goto end;
+			}
+			if (int3 & BIT_DDC_CMD_DONE) {
+				if (sii8620_readb(ctx, REG_DDC_DOUT_CNT)
+				    >= FETCH_SIZE)
+					break;
+			} else {
+				int3 = sii8620_readb(ctx, REG_INTR3);
+			}
+			if (time_is_before_jiffies(timeout)) {
+				ctx->error = -ETIMEDOUT;
+				dev_err(ctx->dev, "timeout during EDID read\n");
 				kfree(edid);
 				edid = NULL;
 				goto end;
 			}
-		} while (1);
-
-		sii8620_readb(ctx, REG_DDC_STATUS);
-		while (sii8620_readb(ctx, REG_DDC_DOUT_CNT) < FETCH_SIZE)
 			usleep_range(10, 20);
+		}
 
 		sii8620_read_buf(ctx, REG_DDC_DATA, edid + fetched, FETCH_SIZE);
 		if (fetched + FETCH_SIZE == EDID_LENGTH) {
-- 
2.15.1
