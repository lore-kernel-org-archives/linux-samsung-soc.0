From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/6] pinctrl: samsung: Handle GPIO request and free using
 pinctrl helpers
Date: Wed, 02 Jul 2014 17:41:00 +0200
Message-ID: <1404315664-3174-3-git-send-email-t.figa@samsung.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55203 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285AbaGBPlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 11:41:39 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N830097NCWX2S50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Jul 2014 16:41:21 +0100 (BST)
In-reply-to: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

This patch adds .request() and .free() operations to gpio_chip of
pinctrl-samsung driver, which call pinctrl request and free helpers to
request and free pinctrl pin along with GPIO pin.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 779c8bc..6e099d6 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -779,7 +779,8 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 		pin_bank = &drvdata->ctrl->pin_banks[bank];
 		pin_bank->grange.name = pin_bank->name;
 		pin_bank->grange.id = bank;
-		pin_bank->grange.pin_base = pin_bank->pin_base;
+		pin_bank->grange.pin_base = drvdata->ctrl->base
+						+ pin_bank->pin_base;
 		pin_bank->grange.base = pin_bank->gpio_chip.base;
 		pin_bank->grange.npins = pin_bank->gpio_chip.ngpio;
 		pin_bank->grange.gc = &pin_bank->gpio_chip;
@@ -789,7 +790,19 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 	return 0;
 }
 
+static int samsung_gpio_request(struct gpio_chip *chip, unsigned offset)
+{
+	return pinctrl_request_gpio(chip->base + offset);
+}
+
+static void samsung_gpio_free(struct gpio_chip *chip, unsigned offset)
+{
+	pinctrl_free_gpio(chip->base + offset);
+}
+
 static const struct gpio_chip samsung_gpiolib_chip = {
+	.request = samsung_gpio_request,
+	.free = samsung_gpio_free,
 	.set = samsung_gpio_set,
 	.get = samsung_gpio_get,
 	.direction_input = samsung_gpio_direction_input,
-- 
1.9.3
