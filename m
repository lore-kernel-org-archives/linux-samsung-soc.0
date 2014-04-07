From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] regulator: s5m8767: Fix carried over ena_gpio assignment
Date: Mon, 07 Apr 2014 14:15:23 +0200
Message-ID: <1396872924-14675-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

During registration of regulators if external control for regulator was
set in DTS the ena_gpio and ena_gpio_flags fields of regulator_config
were set to proper values.

However the same regulator_config was used in next iterations of loop so
the ena_gpio fields carried over to next regulators.

The issue was not observed as ena_gpio is supported only for Buck9
regulator which is often the last regulator parsed from DTS.
Be sure to clear ena_gpio config fields before registering the
regulator.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/regulator/s5m8767.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index f05badabd69e..92f19a005dc3 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -964,6 +964,7 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 		config.driver_data = s5m8767;
 		config.regmap = iodev->regmap_pmic;
 		config.of_node = pdata->regulators[i].reg_node;
+		config.ena_gpio = config.ena_gpio_flags = 0;
 		if (pdata->regulators[i].ext_control_gpio)
 			s5m8767_regulator_config_ext_control(s5m8767,
 					&pdata->regulators[i], &config);
-- 
1.7.9.5
