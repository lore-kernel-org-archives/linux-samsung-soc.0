From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: samsung: mark PM functions as __maybe_unused
Date: Wed,  1 Feb 2017 17:16:24 +0100
Message-ID: <20170201161636.2109091-1-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:61653 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750936AbdBAQRR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 11:17:17 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The rework of the suspend/resume handling uses the wrong #ifdef check, leading
to a build warning without CONFIG_PM_SLEEP:

drivers/pinctrl/samsung/pinctrl-samsung.c:1142:12: error: 'samsung_pinctrl_resume' defined but not used [-Werror=unused-function]
drivers/pinctrl/samsung/pinctrl-samsung.c:1092:12: error: 'samsung_pinctrl_suspend' defined but not used [-Werror=unused-function]

Using a __maybe_unused annotation instead of the #ifdef is a simple way to
avoid this problem class.

Fixes: 2b24efa8e5c5 ("pinctrl: samsung: Replace syscore ops with standard platform device pm_ops")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index d79eadad6c5f..d601b5303e73 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1083,13 +1083,12 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 /**
  * samsung_pinctrl_suspend - save pinctrl state for suspend
  *
  * Save data for all banks handled by this device.
  */
-static int samsung_pinctrl_suspend(struct device *dev)
+static int __maybe_unused samsung_pinctrl_suspend(struct device *dev)
 {
 	struct samsung_pinctrl_drv_data *drvdata = dev_get_drvdata(dev);
 	int i;
@@ -1139,7 +1138,7 @@ static int samsung_pinctrl_suspend(struct device *dev)
  * We don't bother doing anything complicated to avoid glitching lines since
  * we're called before pad retention is turned off.
  */
-static int samsung_pinctrl_resume(struct device *dev)
+static int __maybe_unused samsung_pinctrl_resume(struct device *dev)
 {
 	struct samsung_pinctrl_drv_data *drvdata = dev_get_drvdata(dev);
 	int i;
@@ -1183,7 +1182,6 @@ static int samsung_pinctrl_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct of_device_id samsung_pinctrl_dt_match[] = {
 #ifdef CONFIG_PINCTRL_EXYNOS
-- 
2.9.0
