From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 7/8] mfd: exynos-lpass: Add missing remove() function
Date: Thu, 26 Jan 2017 09:33:53 +0100
Message-ID: <1485419634-28331-8-git-send-email-m.szyprowski@samsung.com>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083405eucas1p29a888fa3896e2bd131e23585f7d033d9@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1485419634-28331-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Disable device on driver remove and release allocated regmap.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
