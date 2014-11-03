From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v4 06/14] regulator: max77686: zero-initialize regulator match table
Date: Mon,  3 Nov 2014 15:40:41 +0100
Message-ID: <1415025649-8119-7-git-send-email-javier.martinez@collabora.co.uk>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The struct of_regulator_match is declared as a non-static local variable
so the structure members are not auto-initialized.

Initialize the struct at declaration time to avoid the structure members
values to be indeterminate and have sane defaults instead.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/regulator/max77686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
index 09b0d8c..281eb4b 100644
--- a/drivers/regulator/max77686.c
+++ b/drivers/regulator/max77686.c
@@ -434,7 +434,7 @@ static int max77686_pmic_dt_parse_pdata(struct platform_device *pdev,
 	struct max77686_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *pmic_np, *regulators_np;
 	struct max77686_regulator_data *rdata;
-	struct of_regulator_match rmatch;
+	struct of_regulator_match rmatch = { };
 	unsigned int i;
 
 	pmic_np = iodev->dev->of_node;
-- 
2.1.0
