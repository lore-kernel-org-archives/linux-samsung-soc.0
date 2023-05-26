Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AD3C77B73
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 26 May 2023 21:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjEZVkT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 26 May 2023 17:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjEZVkS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 May 2023 17:40:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8484AD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 May 2023 14:40:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2fAN-00044f-LR; Fri, 26 May 2023 23:40:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2fAL-0032fX-9Y; Fri, 26 May 2023 23:40:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2fAK-008H4M-KK; Fri, 26 May 2023 23:40:04 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] ARM: s3c: Switch i2c drivers back to use .probe()
Date:   Fri, 26 May 2023 23:40:03 +0200
Message-Id: <20230526214003.2134595-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eqKnPIgIHvBKN8RLudMTPJ02WTDMpgtvvAka53AekOc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkcScsMC9p03VAyXzmEFd81RaPGbj/3bNulXYs+ UtjC76S/sWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHEnLAAKCRCPgPtYfRL+ TkVsB/sEp5otay6Po0zwqwNRq2lTw3TKuZ60TaOh7lvNsDKOjJrSDEny7/hLUxMSK6Gplg/C6II VTfzeYqX+uxrhjI3Z6ue/kmirWyv4gZ+Brm4P+IbAAXwHOyqHR/8FkkKljMSdjIvoGd0yOLRa+7 c5Iw1Y4Bq90eFHjCnEm3dL0np/Oaif6E2/VCUOK5+I4v6y9kMD95hjD8ciLnHVBn2PmvJa19hgH UP8krDgziZjXXxq2VYrfS9qyeBvsDOuhBco44/3hlecWrH4VYiHmSaUVXRjjWioEDJuiYnNPLxr meaJ77PPfU9uY8ohEuNMcqzwMFr4D9YuSkiCjcNZM6G+zEU1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 4edde13b89b5..8fce1e815ee8 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -418,7 +418,7 @@ static struct i2c_driver wlf_gf_module_driver = {
 	.driver = {
 		.name = "wlf-gf-module"
 	},
-	.probe_new = wlf_gf_module_probe,
+	.probe = wlf_gf_module_probe,
 	.id_table = wlf_gf_module_id,
 };
 

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

