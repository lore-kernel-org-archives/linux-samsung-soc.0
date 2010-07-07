From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 09/11] USB: s3c-hsotg: Fix the OUT EP0 limit
Date: Wed,  7 Jul 2010 01:02:21 +0100
Message-ID: <1278460943-16224-10-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:34531 "EHLO ben-laptop"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753078Ab0GGL5d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 07:57:33 -0400
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

The EP0 out limit is the same as the IN limit, so make them the same.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 1020006..552ec89 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -611,11 +611,10 @@ static unsigned get_ep_limit(struct s3c_hsotg_ep *hs_ep)
 		maxsize = S3C_DxEPTSIZ_XferSize_LIMIT + 1;
 		maxpkt = S3C_DxEPTSIZ_PktCnt_LIMIT + 1;
 	} else {
+		maxsize = 64+64;
 		if (hs_ep->dir_in) {
-			maxsize = 64+64;
 			maxpkt = S3C_DIEPTSIZ0_PktCnt_LIMIT + 1;
 		} else {
-			maxsize = 0x3f;
 			maxpkt = 2;
 		}
 	}
-- 
1.7.0.4
