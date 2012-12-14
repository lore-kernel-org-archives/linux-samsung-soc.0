From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] gpio: samsung: add GPIO interrupt registration for exynos5
Date: Fri, 14 Dec 2012 19:44:02 +0900
Message-ID: <1355481842-17952-2-git-send-email-jy0922.shim@samsung.com>
References: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, linus.walleij@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This adds GPIO interrupt registration and modification needs to register
GPIO interrupt rightly for exynos5 SoCs. EXYNOS5_GPYx gpios shouldn't be
counted to GPIO interrupt group register number because they doesn't
support GPIO interrupt, so their struct samsung_gpio_cfg should be
initialized to &samsung_gpio_cfgs[8] in declaration ahead.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpio/gpio-samsung.c |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index e30cd60..a462f2c 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2519,42 +2519,49 @@ static struct samsung_gpio_chip exynos5_gpios_1[] = {
 			.label	= "GPD1",
 		},
 	}, {
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS5_GPY0(0),
 			.ngpio	= EXYNOS5_GPIO_Y0_NR,
 			.label	= "GPY0",
 		},
 	}, {
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS5_GPY1(0),
 			.ngpio	= EXYNOS5_GPIO_Y1_NR,
 			.label	= "GPY1",
 		},
 	}, {
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS5_GPY2(0),
 			.ngpio	= EXYNOS5_GPIO_Y2_NR,
 			.label	= "GPY2",
 		},
 	}, {
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS5_GPY3(0),
 			.ngpio	= EXYNOS5_GPIO_Y3_NR,
 			.label	= "GPY3",
 		},
 	}, {
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS5_GPY4(0),
 			.ngpio	= EXYNOS5_GPIO_Y4_NR,
 			.label	= "GPY4",
 		},
 	}, {
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS5_GPY5(0),
 			.ngpio	= EXYNOS5_GPIO_Y5_NR,
 			.label	= "GPY5",
 		},
 	}, {
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS5_GPY6(0),
 			.ngpio	= EXYNOS5_GPIO_Y6_NR,
@@ -3002,6 +3009,24 @@ static __init void exynos5_gpiolib_init(void)
 	}
 	samsung_gpiolib_add_4bit_chips(exynos5_gpios_4,
 				       nr_chips, gpio_base4);
+
+#ifdef CONFIG_S5P_GPIO_INT
+	s5p_register_gpioint_bank(EXYNOS5_IRQ_GPIO_XA, 0,
+			EXYNOS5_IRQ_GPIO1_NR_GROUPS);
+	s5p_register_gpioint_bank(EXYNOS5_IRQ_GPIO_XB,
+			EXYNOS5_IRQ_GPIO1_NR_GROUPS,
+			EXYNOS5_IRQ_GPIO2_NR_GROUPS);
+	s5p_register_gpioint_bank(EXYNOS5_IRQ_GPIO_C2C,
+			EXYNOS5_IRQ_GPIO1_NR_GROUPS +
+			EXYNOS5_IRQ_GPIO2_NR_GROUPS,
+			EXYNOS5_IRQ_GPIO3_NR_GROUPS);
+	s5p_register_gpioint_bank(EXYNOS5_IRQ_GPIO,
+			EXYNOS5_IRQ_GPIO1_NR_GROUPS +
+			EXYNOS5_IRQ_GPIO2_NR_GROUPS +
+			EXYNOS5_IRQ_GPIO3_NR_GROUPS,
+			EXYNOS5_IRQ_GPIO4_NR_GROUPS);
+#endif
+
 	return;
 
 err_ioremap4:
-- 
1.7.9.5
