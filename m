From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2] pinctrl: samsung: Calculate GPIO base for pinctrl_add_gpio_range
Date: Tue, 28 Feb 2017 17:04:35 +0000
Message-ID: <1488301475-10804-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <20170228090143.GG2742@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:54388 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751135AbdB1RGQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Feb 2017 12:06:16 -0500
In-Reply-To: <20170228090143.GG2742@localhost.localdomain>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linus.walleij@linaro.org, krzk@kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com

As the pinctrl is now added before the GPIOs are registered we need to
manually calculate what the GPIO base will be, otherwise the base for
each gpio_range will be set to zero. Fortunately the driver
already assigns a GPIO base, in samsung_gpiolib_register, and uses the
same calculation it does for the pin_base. Meaning the two will always
be the same and allowing us to reuse the pinbase and avoid the issue.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v1:
 - Use grange.base in samsung_gpiolib_register to make it more
   clear the two are related in the driver.

Thanks,
Charles


 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index ddc8d6b..27d5157 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -882,7 +882,7 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 		pin_bank->grange.id = bank;
 		pin_bank->grange.pin_base = drvdata->pin_base
 						+ pin_bank->pin_base;
-		pin_bank->grange.base = pin_bank->gpio_chip.base;
+		pin_bank->grange.base = pin_bank->grange.pin_base;
 		pin_bank->grange.npins = pin_bank->gpio_chip.ngpio;
 		pin_bank->grange.gc = &pin_bank->gpio_chip;
 		pinctrl_add_gpio_range(drvdata->pctl_dev, &pin_bank->grange);
@@ -928,7 +928,7 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
 		bank->gpio_chip = samsung_gpiolib_chip;
 
 		gc = &bank->gpio_chip;
-		gc->base = drvdata->pin_base + bank->pin_base;
+		gc->base = bank->grange.base;
 		gc->ngpio = bank->nr_pins;
 		gc->parent = &pdev->dev;
 		gc->of_node = bank->of_node;
-- 
2.1.4
