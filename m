Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8896EC77B75
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 May 2023 23:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjEQXEI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 17 May 2023 19:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjEQXEH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 May 2023 19:04:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209B561A1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 May 2023 16:03:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008OC-2l; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-000wtP-70; Thu, 18 May 2023 01:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-005UZp-CP; Thu, 18 May 2023 01:02:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 72/97] usb: ohci-s3c2410: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:14 +0200
Message-Id: <20230517230239.187727-73-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=M6mXoig1dWl/Ywk+GLiUxx2mru6fVHVmDiXl+L/3aFE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVycpkB4UYuUIQZso7pGfRKcNOnixVHRS5flO PZaUAr9m/CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcnAAKCRCPgPtYfRL+ TuYhB/0cC+JHseq+/EuztzA9TtWlzAvz2HwPEjvZIB8W8TU1dCQyMeOc/pkZ3Bm+4QobgF+CEMp YueaGkJNbKo/sJHDL/JmaWnNo0JmAwTQ7y54jV7fOMtlb6+927wuksUuqjSTOt6pw/++iq2oeYV Xa7GawlEHAcrB3ChiJEmejgCzQ4/l8sp4qN/Vk67cxW4q0mMYzFkw2Te8iUlHEkZqpXdIA1sQKS AoRn5IFLGqMv0bEQ2Rh3Tzkdt6B3kxdBG2cuKlf+IiSLNfOhF/+vJUm8rfwTEaKmMCDWrz7fSd0 6BHxhZ+w0vsgrYrwBRLT0Rv4l1yqRzAiXfmKHqVwG+vXmB75
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/host/ohci-s3c2410.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 85a0a9ae0095..c5c9b4cbcb9a 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -329,7 +329,7 @@ static void s3c2410_hcd_oc(struct s3c2410_hcd_info *info, int port_oc)
  * the HCD's stop() method.  It is always called from a thread
  * context, normally "rmmod", "apmd", or something similar.
  */
-static int
+static void
 ohci_hcd_s3c2410_remove(struct platform_device *dev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
@@ -337,7 +337,6 @@ ohci_hcd_s3c2410_remove(struct platform_device *dev)
 	usb_remove_hcd(hcd);
 	s3c2410_stop_hc(dev);
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 /*
@@ -458,7 +457,7 @@ MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
 
 static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.probe		= ohci_hcd_s3c2410_probe,
-	.remove		= ohci_hcd_s3c2410_remove,
+	.remove_new	= ohci_hcd_s3c2410_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "s3c2410-ohci",
-- 
2.39.2

