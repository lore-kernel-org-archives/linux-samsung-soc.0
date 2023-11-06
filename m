Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432E8C41535
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Nov 2023 17:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjKFRSD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Nov 2023 12:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjKFRSB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Nov 2023 12:18:01 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F581D45
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Nov 2023 09:17:59 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03EU-0005Qd-JR; Mon, 06 Nov 2023 18:17:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03ER-0075yO-Ra; Mon, 06 Nov 2023 18:17:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03ER-00DrIt-IZ; Mon, 06 Nov 2023 18:17:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 03/18] mfd: exynos-lpass: Convert to platform remove callback returning void
Date:   Mon,  6 Nov 2023 18:17:12 +0100
Message-ID: <20231106171708.3892347-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hnM9lEd75w6pk/CQsI0uo+SpHXcPuNXW4NABO1kOboo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSR+XqyjvQ43nqvF9ocHlWxZZXet54OMT5aOkA uSKIuL0GwGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkflwAKCRCPgPtYfRL+ ThQwB/4iWr4HdM0ot+aMfRW1+FN5fav/zZRDeq45wSEqGYaNj4zS7HZopK2CJ3gS7rU8J9j3VMy jR/fs4eqg1KzU/+zCswLGUOEtHFDw3eJu82wTkx+KFjSTI36fR2HsavHNkwlS1IDDm4Ypu3h5xQ EpYIVvxz+3zhJkTwwoIzVEi4aEk0Wu7qN4SrN1Q1B4nciVO5ZDHs4S9yxGUzToHAnYC7bQYkZdX Kyj8bCB1yWrNBd1rb3hqLYmwErZ76YdYWWQkk/X+bPttUZ5xczuM9VJ6nwj0ATWbyPm8zc2UkiU 2XZeYVM6ChkrZo89CmyouqjEHqwzwVAPGAOc5Kc6zcqAr4mu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mfd/exynos-lpass.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 1506d8d352b1..e58990c85ed8 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -137,7 +137,7 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	return devm_of_platform_populate(dev);
 }
 
-static int exynos_lpass_remove(struct platform_device *pdev)
+static void exynos_lpass_remove(struct platform_device *pdev)
 {
 	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
 
@@ -146,8 +146,6 @@ static int exynos_lpass_remove(struct platform_device *pdev)
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		exynos_lpass_disable(lpass);
 	regmap_exit(lpass->top);
-
-	return 0;
 }
 
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
@@ -187,7 +185,7 @@ static struct platform_driver exynos_lpass_driver = {
 		.of_match_table	= exynos_lpass_of_match,
 	},
 	.probe	= exynos_lpass_probe,
-	.remove	= exynos_lpass_remove,
+	.remove_new = exynos_lpass_remove,
 };
 module_platform_driver(exynos_lpass_driver);
 
-- 
2.42.0

