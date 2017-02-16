From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 4/4] pinctrl: samsung: Use devres version of gpiochip_add_data
Date: Thu, 16 Feb 2017 13:27:16 +0000
Message-ID: <1487251636-2480-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, krzk@kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

Use devm_gpiochip_add_data to simplify the error path in
samsung_gpiolib_register. Additionally this would also fix a leak if
the pinctrl driver was unbound, although admittedly I can't see any
good use-case for doing so, but the driver does currently allow it.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v1:
 - Update commit message.

 drivers/pinctrl/samsung/pinctrl-samsung.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 4ab20ec..eb08f30 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -934,20 +934,15 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
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
