From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 3/4] gpio: exynos4: skip gpiolib registration if pinctrl
 driver is used
Date: Thu, 23 Aug 2012 16:45:28 +0530
Message-ID: <1345720529-32315-4-git-send-email-thomas.abraham@linaro.org>
References: <1345720529-32315-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1345720529-32315-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, dong.aisheng@linaro.org, swarren@wwwdotorg.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Pinctrl driver, when enabled, registers all the gpio pins and hence the
registration of gpio pins by this driver can be skipped.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-samsung.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index ba126cc..41ab7f6 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2734,6 +2734,27 @@ static __init void exynos4_gpiolib_init(void)
 	int group = 0;
 	void __iomem *gpx_base;
 
+#ifdef CONFIG_PINCTRL_SAMSUNG
+		/*
+		 * This gpio driver includes support for device tree support and
+		 * there are platforms using it. In order to maintain
+		 * compatibility with those platforms, and to allow non-dt
+		 * Exynos4210 platforms to use this gpiolib support, a check
+		 * is added to find out if there is a active pin-controller
+		 * driver support available. If it is available, this gpiolib
+		 * support is ignored and the gpiolib support available in
+		 * pin-controller driver is used. This is a temporary check and
+		 * will go away when all of the Exynos4210 platforms have
+		 * switched to using device tree and the pin-ctrl driver.
+		 */
+		struct device_node *pctrl_np;
+		const char *pctrl_compat = "samsung,pinctrl-exynos4210";
+		pctrl_np = of_find_compatible_node(NULL, NULL, pctrl_compat);
+		if (pctrl_np)
+			if (of_device_is_available(pctrl_np))
+				return;
+#endif
+
 	/* gpio part1 */
 	gpio_base1 = ioremap(EXYNOS4_PA_GPIO1, SZ_4K);
 	if (gpio_base1 == NULL) {
-- 
1.6.6.rc2
