From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] pinctrl: samsung: Fix memory mapping code
Date: Wed, 22 Feb 2017 08:44:02 +0100
Message-ID: <1487749442-23806-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170222074421eucas1p17bbab9c297450bca1c5908ada16d2fa6@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33686 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754191AbdBVHo1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 02:44:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Some pinctrls share memory regions, and devm_ioremap_resource does not
allow to share resources, in opposition to devm_ioremap.
This patch restores back usage of devm_ioremap function, but with proper
error handling and logging.

Fixes: baafaca ("pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data()")
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index f9ddba7..ebecff8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -988,9 +988,12 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 
 	for (i = 0; i < ctrl->nr_ext_resources + 1; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		virt_base[i] = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(virt_base[i]))
-			return ERR_CAST(virt_base[i]);
+		virt_base[i] = devm_ioremap(&pdev->dev, res->start,
+						resource_size(res));
+		if (!virt_base[i]) {
+			dev_err(&pdev->dev, "failed to ioremap %pR\n", res);
+			return ERR_PTR(-EIO);
+		}
 	}
 
 	bank = d->pin_banks;
-- 
2.7.4
