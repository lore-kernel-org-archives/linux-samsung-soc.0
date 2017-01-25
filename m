From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] regulator: s2mpa01: reduce stack size for probe function
Date: Wed, 25 Jan 2017 23:20:59 +0100
Message-ID: <20170125222126.1188246-1-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:55282 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751177AbdAYWVp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 17:21:45 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

In some rare configurations we can run into rather high kernel stack
consumption:

drivers/regulator/s2mpa01.c:397:1: error: the frame size of 1536 bytes is larger than 1152 bytes [-Werror=frame-larger-than=]

This is probably harmless since it happens only in the probe function,
but there is also a relatively simple workaround, moving the regulator
match data into the device specific structure.

As a small downside, we waste a little memory at runtime. An alternative
approach would free the array at the end of the probe function, which in
turn is a little more complicated.

Fixes: f18792714608 ("regulator: Add support for S2MPA01 regulator")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/regulator/s2mpa01.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index 92f88753bfed..38ee97a085f9 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -26,6 +26,7 @@
 #define S2MPA01_REGULATOR_CNT ARRAY_SIZE(regulators)
 
 struct s2mpa01_info {
+	struct of_regulator_match rdata[S2MPA01_REGULATOR_MAX];
 	int ramp_delay24;
 	int ramp_delay3;
 	int ramp_delay5;
@@ -341,9 +342,9 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct sec_platform_data *pdata = dev_get_platdata(iodev->dev);
-	struct of_regulator_match rdata[S2MPA01_REGULATOR_MAX] = { };
 	struct device_node *reg_np = NULL;
 	struct regulator_config config = { };
+	struct of_regulator_match *rdata;
 	struct s2mpa01_info *s2mpa01;
 	int i;
 
@@ -351,6 +352,7 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 	if (!s2mpa01)
 		return -ENOMEM;
 
+	rdata = s2mpa01->rdata;
 	for (i = 0; i < S2MPA01_REGULATOR_CNT; i++)
 		rdata[i].name = regulators[i].name;
 
-- 
2.9.0
