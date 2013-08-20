From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] pinctrl: samsung: Parse pin groups before calling
 pinctrl_register()
Date: Tue, 20 Aug 2013 18:16:21 +0200
Message-ID: <1377015381-26455-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41820 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519Ab3HTQQh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 12:16:37 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRU00IWK7VFGVC0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Aug 2013 17:16:35 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Calling pinctrl_register() means that the driver is fully initialized
and might accept pinmux/pinconf requests, so pin groups must be parsed
before.

This patch fixes this problem by moving device tree parsing before call
to pinctrl_register(). In addition, this fixes support for hogs on
pin controllers handled by pinctrl-samsung driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index a7fa9e2..439f2ef 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -767,6 +767,10 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 		}
 	}
 
+	ret = samsung_pinctrl_parse_dt(pdev, drvdata);
+	if (ret)
+		return ret;
+
 	drvdata->pctl_dev = pinctrl_register(ctrldesc, &pdev->dev, drvdata);
 	if (!drvdata->pctl_dev) {
 		dev_err(&pdev->dev, "could not register pinctrl driver\n");
@@ -784,12 +788,6 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 		pinctrl_add_gpio_range(drvdata->pctl_dev, &pin_bank->grange);
 	}
 
-	ret = samsung_pinctrl_parse_dt(pdev, drvdata);
-	if (ret) {
-		pinctrl_unregister(drvdata->pctl_dev);
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
1.8.3.2
