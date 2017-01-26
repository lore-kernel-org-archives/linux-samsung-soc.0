From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/8] pinctrl: samsung: Ensure that pad retention is disabled
 on driver init
Date: Thu, 26 Jan 2017 09:33:48 +0100
Message-ID: <1485419634-28331-3-git-send-email-m.szyprowski@samsung.com>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083401eucas1p289b69e3694b91e83983cd6e09aa7053c@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

When pin controller device is a part of power domain, there is no guarantee
that the power domain was not turned off and then on during boot process
before probing of the pin control driver. If it happened, then pin control
driver should ensure that pad retention is turned off during its probe call.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 63e51b56a22a..fa3802970570 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -777,6 +777,7 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 {
 	struct samsung_retention_ctrl *ctrl;
 	struct regmap *pmu_regs;
+	int i;
 
 	ctrl = devm_kzalloc(drvdata->dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
@@ -794,6 +795,10 @@ static void exynos_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 	ctrl->enable = exynos_retention_enable;
 	ctrl->disable = exynos_retention_disable;
 
+	/* Ensure that retention is disabled on driver init */
+	for (i = 0; i < ctrl->nr_regs; i++)
+		regmap_write(pmu_regs, ctrl->regs[i], ctrl->value);
+
 	return ctrl;
 }
 
-- 
1.9.1
