From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 2/4] pinctrl: samsung: Register pinctrl before GPIO
Date: Thu, 16 Feb 2017 13:27:14 +0000
Message-ID: <1487251636-2480-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, krzk@kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

If we request a GPIO hog, then gpiochip_add_data will attempt to request
some of its own GPIOs. The driver also uses gpiochip_generic_request
which means that for any GPIO request to succeed the pinctrl needs to be
registered. Currently however the driver registers the GPIO and then the
pinctrl meaning all GPIO hog requests will fail, which then in turn causes
the whole driver to fail probe. Fix this up by ensuring we register the
pinctrl first. Although currently there are no users of GPIO hogs in
mainline there are plenty of Samsung based boards that are widely used
for development purposes of other hardware. Indeed we hit this issue
whilst attaching some additional hardware to an Arndale system.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Changes since v1:
 - Updated commit message

 drivers/pinctrl/samsung/pinctrl-samsung.c | 32 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index d79eada..1134bc3 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -893,6 +893,19 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 	return 0;
 }
 
+/* unregister the pinctrl interface with the pinctrl subsystem */
+static int samsung_pinctrl_unregister(struct platform_device *pdev,
+				      struct samsung_pinctrl_drv_data *drvdata)
+{
+	struct samsung_pin_bank *bank = drvdata->pin_banks;
+	int i;
+
+	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
+		pinctrl_remove_gpio_range(drvdata->pctl_dev, &bank->grange);
+
+	return 0;
+}
+
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
@@ -939,19 +952,6 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
 	return ret;
 }
 
-/* unregister the gpiolib interface with the gpiolib subsystem */
-static int samsung_gpiolib_unregister(struct platform_device *pdev,
-				      struct samsung_pinctrl_drv_data *drvdata)
-{
-	struct samsung_pin_bank *bank = drvdata->pin_banks;
-	int i;
-
-	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
-		gpiochip_remove(&bank->gpio_chip);
-
-	return 0;
-}
-
 /* retrieve the soc specific data */
 static const struct samsung_pin_ctrl *
 samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
@@ -1063,13 +1063,13 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 			return PTR_ERR(drvdata->retention_ctrl);
 	}
 
-	ret = samsung_gpiolib_register(pdev, drvdata);
+	ret = samsung_pinctrl_register(pdev, drvdata);
 	if (ret)
 		return ret;
 
-	ret = samsung_pinctrl_register(pdev, drvdata);
+	ret = samsung_gpiolib_register(pdev, drvdata);
 	if (ret) {
-		samsung_gpiolib_unregister(pdev, drvdata);
+		samsung_pinctrl_unregister(pdev, drvdata);
 		return ret;
 	}
 
-- 
2.1.4

