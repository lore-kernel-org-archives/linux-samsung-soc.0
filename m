Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EA6EB64DD
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbjGEUpp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233930AbjGEUpj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 16:45:39 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D591BD8;
        Wed,  5 Jul 2023 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g6vjt2izK19oSi33JhUJpysHlzW8ZjJUpjtvGXmKD7c=;
        b=CxMzmr4y+mcbZcS8jZWQWeUlWvAe7HpbDeQrpTiL5r7NjcUDsCS8lBxODFN/Zauhx0M8dt
        mvqJ2p9RWo/hFNeFGhRNN26W1GdPg2NJ2MNJNxJFc1Vmu9+2uFunS6zjHynj4aA4Duu2+X
        tjz6gep4rn3uowpN3jPP2QK+qJLqJkI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/23] i2c: exynos5: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:42:58 +0200
Message-Id: <20230705204314.89800-8-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/i2c/busses/i2c-exynos5.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index f378cd479e55..5b201a326c13 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -892,7 +892,6 @@ static void exynos5_i2c_remove(struct platform_device *pdev)
 	clk_unprepare(i2c->pclk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int exynos5_i2c_suspend_noirq(struct device *dev)
 {
 	struct exynos5_i2c *i2c = dev_get_drvdata(dev);
@@ -934,11 +933,10 @@ static int exynos5_i2c_resume_noirq(struct device *dev)
 	clk_disable_unprepare(i2c->pclk);
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(exynos5_i2c_suspend_noirq,
-				      exynos5_i2c_resume_noirq)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(exynos5_i2c_suspend_noirq,
+				  exynos5_i2c_resume_noirq)
 };
 
 static struct platform_driver exynos5_i2c_driver = {
@@ -946,7 +944,7 @@ static struct platform_driver exynos5_i2c_driver = {
 	.remove_new	= exynos5_i2c_remove,
 	.driver		= {
 		.name	= "exynos5-hsi2c",
-		.pm	= &exynos5_i2c_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&exynos5_i2c_dev_pm_ops),
 		.of_match_table = exynos5_i2c_match,
 	},
 };
-- 
2.40.1

