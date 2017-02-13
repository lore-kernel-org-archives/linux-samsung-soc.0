From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 3/4] pinctrl: samsung: Use devres version of gpiochip_add_data
Date: Mon, 13 Feb 2017 10:11:05 +0000
Message-ID: <1486980666-7143-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1486980666-7143-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486980666-7143-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: tomasz.figa@gmail.com, krzk@kernel.org, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 1134bc3..f291cbf 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -936,20 +936,15 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
 		gc->of_node = bank->of_node;
 		gc->label = bank->name;
 
-		ret = gpiochip_add_data(gc, bank);
+		ret = devm_gpiochip_add_data(&pdev->dev, gc, bank);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
 							gc->label, ret);
-			goto fail;
+			return ret;
 		}
 	}
 
 	return 0;
-
-fail:
-	for (--i, --bank; i >= 0; --i, --bank)
-		gpiochip_remove(&bank->gpio_chip);
-	return ret;
 }
 
 /* retrieve the soc specific data */
-- 
2.1.4
