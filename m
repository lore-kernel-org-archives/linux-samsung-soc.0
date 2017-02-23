From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] pinctrl: samsung: Calculate GPIO base for pinctrl_add_gpio_range
Date: Thu, 23 Feb 2017 17:54:50 +0000
Message-ID: <1487872490-27643-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <20170223172313.GF2742@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:57667 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751156AbdBWRyE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 12:54:04 -0500
In-Reply-To: <20170223172313.GF2742@localhost.localdomain>
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

Ok I might have spoken to soon there looks like there is a simple
way to fix this up, at least in this case. It would be much more
of an issue if the driver allocated its GPIO base dynamically.

Thanks,
Charles

 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index ddc8d6b..864d8b4d 100644
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
-- 
2.1.4
