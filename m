Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEB1C7EE2A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 May 2023 23:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjEQXEJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 17 May 2023 19:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjEQXEH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 May 2023 19:04:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AE45B99
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 May 2023 16:03:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008Ki-Ow; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-000wsp-NZ; Thu, 18 May 2023 01:02:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-005UZT-7V; Thu, 18 May 2023 01:02:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 66/97] usb: ohci-exynos: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:08 +0200
Message-Id: <20230517230239.187727-67-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1935; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tPXpr9QgihBH+YdWa24uJLMKDVOa26vZ+ybR9q2SfTo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyG3cPQmsiYzbdhA65NLk+eLFgHvSjLAOo7a i0gdAFsWDeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVchgAKCRCPgPtYfRL+ ToQzCACDDir0mX2kHzcxUS60rmh51cUz/ruyX82VXMkrqm/YaXXmAjHY2A13fHHCbxjCiZLbU04 8iety56X11z8YoLtkwlbIyzWwfNOLBX+I+QRZ3/XDAwLrvjUzBGkzqG4cNuyrfGVJUy55cPOv+d 7KySCMm9OckqCA84pPDD8HhKXMHVWC6EDHMy2wYpBIoGO3sVaJHo794FNZ5krYq6RcoA9haadKu WFf2UjhrLk00C/FrZqPEYsQaK7hG5N3j5bAgxwFyrRE1S7P0LCzrror2Ta7b3T99hb4+3YJ+C00 J5Fgs5Mt9EdhArf6Lr+Z9Xr6eytfSBOxh8CdPi8FAKva2SKn
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
 drivers/usb/host/ohci-exynos.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 8af17c1ee5cc..ab31c459b32d 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -198,7 +198,7 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int exynos_ohci_remove(struct platform_device *pdev)
+static void exynos_ohci_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
@@ -212,8 +212,6 @@ static int exynos_ohci_remove(struct platform_device *pdev)
 	clk_disable_unprepare(exynos_ohci->clk);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static void exynos_ohci_shutdown(struct platform_device *pdev)
@@ -285,7 +283,7 @@ MODULE_DEVICE_TABLE(of, exynos_ohci_match);
 
 static struct platform_driver exynos_ohci_driver = {
 	.probe		= exynos_ohci_probe,
-	.remove		= exynos_ohci_remove,
+	.remove_new	= exynos_ohci_remove,
 	.shutdown	= exynos_ohci_shutdown,
 	.driver = {
 		.name	= "exynos-ohci",
-- 
2.39.2

