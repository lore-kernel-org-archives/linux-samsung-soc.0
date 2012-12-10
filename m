From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 3/4] regulator: s5m8767: Fix to work even if no DVS gpio present
Date: Mon, 10 Dec 2012 18:19:41 +0530
Message-ID: <1355143782-15133-4-git-send-email-amit.daniel@samsung.com>
References: <1355143782-15133-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355143782-15133-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, amit.kachhap@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/regulator/s5m8767.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 7ed7591..9f991f2 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -626,9 +626,16 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (gpio_is_valid(pdata->buck_gpios[0]) &&
-		gpio_is_valid(pdata->buck_gpios[1]) &&
-		gpio_is_valid(pdata->buck_gpios[2])) {
+	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
+						pdata->buck4_gpiodvs) {
+
+		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
+			!gpio_is_valid(pdata->buck_gpios[1]) ||
+			!gpio_is_valid(pdata->buck_gpios[2])) {
+			dev_err(&pdev->dev, "GPIO NOT VALID\n");
+			return -EINVAL;
+		}
+
 		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
 					"S5M8767 SET1");
 		if (ret)
@@ -653,10 +660,6 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 		/* SET3 GPIO */
 		gpio_direction_output(pdata->buck_gpios[2],
 				(s5m8767->buck_gpioindex >> 0) & 0x1);
-	} else {
-		dev_err(&pdev->dev, "GPIO NOT VALID\n");
-		ret = -EINVAL;
-		return ret;
 	}
 
 	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[0], "S5M8767 DS2");
-- 
1.7.1
