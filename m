From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 4/4] pinctrl: samsung: Remove unused local variable
Date: Mon, 13 Feb 2017 10:11:06 +0000
Message-ID: <1486980666-7143-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
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
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index f291cbf..eb08f30 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -566,13 +566,11 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 {
 	const struct samsung_pin_bank_type *type;
 	struct samsung_pin_bank *bank;
-	struct samsung_pinctrl_drv_data *drvdata;
 	void __iomem *reg;
 	u32 data, mask, shift;
 
 	bank = gpiochip_get_data(gc);
 	type = bank->type;
-	drvdata = bank->drvdata;
 
 	reg = bank->pctl_base + bank->pctl_offset
 			+ type->reg_offset[PINCFG_TYPE_FUNC];
-- 
2.1.4
