From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 2/3] gpio: samsung: skip gpiolib registration if pinctrl
 support is enabled for exynos5250
Date: Wed, 06 Mar 2013 16:48:31 +0530
Message-ID: <1362568712-13586-3-git-send-email-thomas.abraham@linaro.org>
References: <1362568712-13586-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1362568712-13586-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Skip exynos5250 gpiolib registration if pinctrl support for exynos5250
is enabled.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-samsung.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index b3643ff..49b4292 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -3024,6 +3024,7 @@ static __init int samsung_gpiolib_init(void)
 	static const struct of_device_id exynos_pinctrl_ids[] = {
 		{ .compatible = "samsung,exynos4210-pinctrl", },
 		{ .compatible = "samsung,exynos4x12-pinctrl", },
+		{ .compatible = "samsung,exynos5250-pinctrl", },
 		{ .compatible = "samsung,exynos5440-pinctrl", },
 	};
 	for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
-- 
1.6.6.rc2
