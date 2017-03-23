From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 5/6] mfd: exynos-lpass: Add missing remove() function
Date: Thu, 23 Mar 2017 09:03:26 +0100
Message-ID: <1490256207-10061-6-git-send-email-m.szyprowski@samsung.com>
References: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170323080349eucas1p24093d55f6654274e0c0bdf02d477c906@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:36951 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932360AbdCWIEA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2017 04:04:00 -0400
In-reply-to: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Disable device on driver remove and release allocated regmap.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/exynos-lpass.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index be264988bdc9..9dbbedad916f 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -137,6 +137,16 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
+static int exynos_lpass_remove(struct platform_device *pdev)
+{
+	struct exynos_lpass *lpass = platform_get_drvdata(pdev);
+
+	exynos_lpass_disable(lpass);
+	regmap_exit(lpass->top);
+
+	return 0;
+}
+
 static int __maybe_unused exynos_lpass_suspend(struct device *dev)
 {
 	struct exynos_lpass *lpass = dev_get_drvdata(dev);
@@ -171,6 +181,7 @@ static SIMPLE_DEV_PM_OPS(lpass_pm_ops, exynos_lpass_suspend,
 		.of_match_table	= exynos_lpass_of_match,
 	},
 	.probe	= exynos_lpass_probe,
+	.remove	= exynos_lpass_remove,
 };
 module_platform_driver(exynos_lpass_driver);
 
-- 
1.9.1
