Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143DEC7EE2F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 May 2023 23:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjEQXC7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 17 May 2023 19:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjEQXC6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 May 2023 19:02:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140F34EF3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 May 2023 16:02:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-0007m6-0E; Thu, 18 May 2023 01:02:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-000woa-Fx; Thu, 18 May 2023 01:02:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-005UW6-Rh; Thu, 18 May 2023 01:02:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 14/97] usb: dwc3-exynos: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:16 +0200
Message-Id: <20230517230239.187727-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IdD60lOwq2wDg14YlBnrN2r7Raes/oLMlAITP/+u2gQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv65NrKhXHRhmvFHF3UGCM5SDddKO01GSNOQ 3eeeR4dGiKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb+gAKCRCPgPtYfRL+ Tg+PCAC00b+j2VDaanaKl8Dd4SS9CTUFqY9OEdpUvVxoOY/BLEA6gSocxns5jPvImWpsVo5OTZ5 VLWFYO5g4VtBbv5VjTQcVgyz5stdMhNuaI/QPgBDLF7ZczZgtmTTbwNIYmcgTG9dRe/uUwozuA8 YxHCf2HIvcqPtQJ2i2DqK/LX8y/PJi1p6Uu1TITeA+qdI5GUVZE/jXHktSuIJtMhVVYvhmAdBD7 nxlUC373gN/MPScp+/nlK3vm9//K2jZkJnnvqTDZcxpWHYagxJRWXgwJ6h+fd9rwY67oMWX6cX0 xooDohOZjj30v8Izd72vCksrj6QVmO6cu/sFASutnsbrHPhr
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
 drivers/usb/dwc3/dwc3-exynos.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 4be6a873bd07..f882dd647340 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -128,7 +128,7 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_exynos_remove(struct platform_device *pdev)
+static void dwc3_exynos_remove(struct platform_device *pdev)
 {
 	struct dwc3_exynos	*exynos = platform_get_drvdata(pdev);
 	int i;
@@ -143,8 +143,6 @@ static int dwc3_exynos_remove(struct platform_device *pdev)
 
 	regulator_disable(exynos->vdd33);
 	regulator_disable(exynos->vdd10);
-
-	return 0;
 }
 
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
@@ -234,7 +232,7 @@ static const struct dev_pm_ops dwc3_exynos_dev_pm_ops = {
 
 static struct platform_driver dwc3_exynos_driver = {
 	.probe		= dwc3_exynos_probe,
-	.remove		= dwc3_exynos_remove,
+	.remove_new	= dwc3_exynos_remove,
 	.driver		= {
 		.name	= "exynos-dwc3",
 		.of_match_table = exynos_dwc3_match,
-- 
2.39.2

