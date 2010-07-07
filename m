From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 10/11] USB: s3c-hsotg: Fix OUT packet request retry
Date: Wed,  7 Jul 2010 01:02:22 +0100
Message-ID: <1278460943-16224-11-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:34535 "EHLO ben-laptop"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753721Ab0GGL5n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 07:57:43 -0400
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

If there is more data in the request than we could fit into a single
hardware request, then check when the OutDone event is received if
we have more data, and if so, schedule the new data instead of trying
to complete the request (and in the case of EP0, sending a 0 packet
in the middle of a transfer).

Also, move the debug message about the current transfer state before
the warning about a bad transfer.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 552ec89..825b6ca 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -1383,6 +1383,9 @@ static void s3c_hsotg_rx_data(struct s3c_hsotg *hsotg, int ep_idx, int size)
 	read_ptr = hs_req->req.actual;
 	max_req = hs_req->req.length - read_ptr;
 
+	dev_dbg(hsotg->dev, "%s: read %d/%d, done %d/%d\n",
+		__func__, to_read, max_req, read_ptr, hs_req->req.length);
+
 	if (to_read > max_req) {
 		/* more data appeared than we where willing
 		 * to deal with in this request.
@@ -1392,9 +1395,6 @@ static void s3c_hsotg_rx_data(struct s3c_hsotg *hsotg, int ep_idx, int size)
 		WARN_ON_ONCE(1);
 	}
 
-	dev_dbg(hsotg->dev, "%s: read %d/%d, done %d/%d\n",
-		__func__, to_read, max_req, read_ptr, hs_req->req.length);
-
 	hs_ep->total_data += to_read;
 	hs_req->req.actual += to_read;
 	to_read = DIV_ROUND_UP(to_read, 4);
@@ -1463,9 +1463,11 @@ static void s3c_hsotg_send_zlp(struct s3c_hsotg *hsotg,
 static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
 				     int epnum, bool was_setup)
 {
+	u32 epsize = readl(hsotg->regs + S3C_DOEPTSIZ(epnum));
 	struct s3c_hsotg_ep *hs_ep = &hsotg->eps[epnum];
 	struct s3c_hsotg_req *hs_req = hs_ep->req;
 	struct usb_request *req = &hs_req->req;
+	unsigned size_left = S3C_DxEPTSIZ_XferSize_GET(epsize);
 	int result = 0;
 
 	if (!hs_req) {
@@ -1474,9 +1476,7 @@ static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
 	}
 
 	if (using_dma(hsotg)) {
-		u32 epsize = readl(hsotg->regs + S3C_DOEPTSIZ(epnum));
 		unsigned size_done;
-		unsigned size_left;
 
 		/* Calculate the size of the transfer by checking how much
 		 * is left in the endpoint size register and then working it
@@ -1486,14 +1486,18 @@ static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
 		 * so may overshoot/undershoot the transfer.
 		 */
 
-		size_left = S3C_DxEPTSIZ_XferSize_GET(epsize);
-
 		size_done = hs_ep->size_loaded - size_left;
 		size_done += hs_ep->last_load;
 
 		req->actual = size_done;
 	}
 
+	/* if there is more request to do, schedule new transfer */
+	if (req->actual < req->length && size_left == 0) {
+		s3c_hsotg_start_req(hsotg, hs_ep, hs_req, true);
+		return;
+	}
+
 	if (req->actual < req->length && req->short_not_ok) {
 		dev_dbg(hsotg->dev, "%s: got %d/%d (short not ok) => error\n",
 			__func__, req->actual, req->length);
-- 
1.7.0.4
