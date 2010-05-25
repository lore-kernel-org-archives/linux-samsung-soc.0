From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 4/6] USB: s3c-hsotg: SoftDisconnect minimum 3ms
Date: Tue, 25 May 2010 05:36:51 +0100
Message-ID: <1274762213-3404-5-git-send-email-ben-linux@fluff.org>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-3-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:32873 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752369Ab0EYEhF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 00:37:05 -0400
In-Reply-To: <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

The shortest period SoftDisconnect can be asserted for is 3 milliseconds
according to the V210 datasheet, so ensure that we add an msleep() to
the registration code to enforce this.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 2ee75a7..8ed4f8a 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2600,6 +2600,9 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
 	writel(S3C_DCTL_CGOUTNak | S3C_DCTL_CGNPInNAK,
 	       hsotg->regs + S3C_DCTL);
 
+	/* must be at-least 3ms to allow bus to see disconnect */
+	msleep(3);
+
 	/* remove the soft-disconnect and let's go */
 	__bic32(hsotg->regs + S3C_DCTL, S3C_DCTL_SftDiscon);
 
-- 
1.6.3.3
