From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 07/11] USB: s3c-hsotg: Check for new request before enqueing new setup
Date: Wed,  7 Jul 2010 01:02:19 +0100
Message-ID: <1278460943-16224-8-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:34532 "EHLO ben-laptop"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753534Ab0GGL5f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 07:57:35 -0400
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Before trying a new setup transaction after getting an EP0 in complete
interrupt, check that the driver did not try and send more EP0 IN data
before enqueing a new setup transaction.

This fixes a bug where we cannot send all of the IN data in one go
so split the transfer, but then fail to send all the data as we start
waiting for a new OUT transaction

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index df6a39d..10aeee1 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -1790,7 +1790,7 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
 		if (dir_in) {
 			s3c_hsotg_complete_in(hsotg, hs_ep);
 
-			if (idx == 0)
+			if (idx == 0 && !hs_ep->req)
 				s3c_hsotg_enqueue_setup(hsotg);
 		} else if (using_dma(hsotg)) {
 			/* We're using DMA, we need to fire an OutDone here
-- 
1.7.0.4
