From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: s2mpa01: reduce stack size for probe function" to the regulator tree
Date: Tue, 31 Jan 2017 20:02:43 +0000
Message-ID: <E1cYedX-0005g0-Kq@debutante>
References: <20170125222126.1188246-1-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46182 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752012AbdAaUEF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Jan 2017 15:04:05 -0500
In-Reply-To: <20170125222126.1188246-1-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: s2mpa01: reduce stack size for probe function

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 33f0698a52d9ebc089eccff7d2fc376974d7e7bf Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 25 Jan 2017 23:20:59 +0100
Subject: [PATCH] regulator: s2mpa01: reduce stack size for probe function

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
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.11.0
