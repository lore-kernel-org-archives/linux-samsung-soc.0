From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 6/6] USB: s3c-hsotg: Enable soft disconnect during initialization
Date: Tue, 25 May 2010 05:36:53 +0100
Message-ID: <1274762213-3404-7-git-send-email-ben-linux@fluff.org>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-3-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-5-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-6-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:32864 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751936Ab0EYEg6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 00:36:58 -0400
In-Reply-To: <1274762213-3404-6-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>

From: Thomas Abraham <thomas.ab@samsung.com>

Enable soft disconnect bit the OTG core during initialization. Without this,
the host sees that a gadget is connected and tries to enumerate. The
soft disconnect should be enabled until the USB gadget driver is
registered with this otg driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 0cb0462..6a303ce 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2803,6 +2803,9 @@ static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
 
 	writel(0, hsotg->regs + S3C_DAINTMSK);
 
+	/* Be in disconnected state until gadget is registered */
+	__orr32(hsotg->regs + S3C_DCTL, S3C_DCTL_SftDiscon);
+
 	if (0) {
 		/* post global nak until we're ready */
 		writel(S3C_DCTL_SGNPInNAK | S3C_DCTL_SGOUTNak,
-- 
1.6.3.3
