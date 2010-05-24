From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] usb: s3c: Enable soft disconnect during initialization
Date: Mon, 24 May 2010 17:48:56 +0900
Message-ID: <1274690936-15756-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51281 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755651Ab0EXWol (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 May 2010 18:44:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Enable soft disconnect bit the OTG core during initialization. Without this,
the host sees that a gadget is connected and tries to enumerate. The
soft disconnect should be enabled until the USB gadget driver is
registered with this otg driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/usb/gadget/s3c-hsotg.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 8ed4f8a..3bcc0f1 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2777,6 +2777,9 @@ static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
 
 	writel(0, hsotg->regs + S3C_DAINTMSK);
 
+	/* Be in disconnected state until gadget is registered */
+	__orr32(hsotg->regs + S3C_DCTL, S3C_DCTL_SftDiscon);
+
 	if (0) {
 		/* post global nak until we're ready */
 		writel(S3C_DCTL_SGNPInNAK | S3C_DCTL_SGOUTNak,
-- 
1.6.3.3
