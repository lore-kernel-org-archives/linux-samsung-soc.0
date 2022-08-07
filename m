Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CA7C19F2A
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  7 Aug 2022 14:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbiHGOzM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 7 Aug 2022 10:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbiHGOyv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 7 Aug 2022 10:54:51 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6A4AE6F;
        Sun,  7 Aug 2022 07:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1659883985; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KhmQUAzyoS18HNqAM0H6H0gTiYDcgAB/NWukYcltpUA=;
        b=1tOBlgKh4w4cx6ZIBgNfPJksLmLV5DvkuOE1hCKxCnxkMQAujeBLnwvvA+n4acrS5KiUkW
        0PeQtmaSKxTd3onupHJXmHEwcmK/gmXighvkvPBasrd4HsPCswl0zUrWE6j1khLzvcx5c/
        3HWZpVgpZo+YOTpnj5iCIDvwSX2JJlA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 13/28] mfd: sec: Remove #ifdef guards for PM related functions
Date:   Sun,  7 Aug 2022 16:52:32 +0200
Message-Id: <20220807145247.46107-14-paul@crapouillou.net>
In-Reply-To: <20220807145247.46107-1-paul@crapouillou.net>
References: <20220807145247.46107-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros
to handle the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

The advantage is then that these functions are now always compiled
independently of any Kconfig option, and thanks to that bugs and
regressions are easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/mfd/sec-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 1fb29c45f5cf..a467de2b2fea 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -455,7 +455,6 @@ static void sec_pmic_shutdown(struct i2c_client *i2c)
 	regmap_update_bits(sec_pmic->regmap_pmic, reg, mask, 0);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sec_pmic_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
@@ -488,14 +487,14 @@ static int sec_pmic_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops,
+				sec_pmic_suspend, sec_pmic_resume);
 
 static struct i2c_driver sec_pmic_driver = {
 	.driver = {
 		   .name = "sec_pmic",
-		   .pm = &sec_pmic_pm_ops,
+		   .pm = pm_sleep_ptr(&sec_pmic_pm_ops),
 		   .of_match_table = sec_dt_match,
 	},
 	.probe = sec_pmic_probe,
-- 
2.35.1

