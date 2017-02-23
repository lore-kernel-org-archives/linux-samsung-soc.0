From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2] pinctrl: samsung: Fix memory mapping code
Date: Thu, 23 Feb 2017 11:12:40 +0100
Message-ID: <1487844760-26272-1-git-send-email-a.hajda@samsung.com>
References: <20170222170202.heu35anyoziwv23n@kozik-lap>
 <CGME20170223101244eucas1p2eddf13a013d66f9ccdbe45f410b5939c@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30264 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751201AbdBWKMs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 05:12:48 -0500
In-reply-to: <20170222170202.heu35anyoziwv23n@kozik-lap>
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
v2:
- added platform_get_resource error check (thanks to Krzysztof)

 drivers/pinctrl/samsung/pinctrl-samsung.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index f9ddba7..d7aa22c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -988,9 +988,16 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 
 	for (i = 0; i < ctrl->nr_ext_resources + 1; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		virt_base[i] = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(virt_base[i]))
-			return ERR_CAST(virt_base[i]);
+		if (!res) {
+			dev_err(&pdev->dev, "failed to get mem%d resource\n", i);
+			return ERR_PTR(-EINVAL);
+		}
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
