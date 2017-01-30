From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 6/7] mfd: exynos-lpass: Add missing remove() function
Date: Mon, 30 Jan 2017 13:38:27 +0100
Message-ID: <1485779908-32147-7-git-send-email-m.szyprowski@samsung.com>
References: <1485779908-32147-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170130123840eucas1p1cc8877c0968d5da70dc93bdbda344c93@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1485779908-32147-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Disable device on driver remove and release allocated regmap.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
