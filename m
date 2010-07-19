From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 09/11] USB: s3c-hsotg: Fix the OUT EP0 limit
Date: Mon, 19 Jul 2010 09:40:48 +0100
Message-ID: <1279528850-28245-10-git-send-email-ben-linux@fluff.org>
References: <1279528850-28245-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:36499 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1760291Ab0GSJWR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 05:22:17 -0400
In-Reply-To: <1279528850-28245-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: gregkh@suse.de, Ben Dooks <ben-linux@fluff.org>

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
