From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: max8660: Constify regulator_ops" to the regulator tree
Date: Mon, 13 Mar 2017 16:56:51 +0000
Message-ID: <E1cnTH9-0004kn-V6@debutante>
References: <20170311190124.11512-3-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37902 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754357AbdCMQ5B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 12:57:01 -0400
In-Reply-To: <20170311190124.11512-3-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: max8660: Constify regulator_ops

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

>From 8c2cd4697bfe524639ad3212f8f152c322941889 Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 11 Mar 2017 21:01:20 +0200
Subject: [PATCH] regulator: max8660: Constify regulator_ops

Static struct regulator_ops (except max8660_dcdc_ops) are not modified
so can be made const for code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max8660.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/max8660.c b/drivers/regulator/max8660.c
index b87f62dd484e..a6183425f27d 100644
--- a/drivers/regulator/max8660.c
+++ b/drivers/regulator/max8660.c
@@ -194,7 +194,7 @@ static int max8660_ldo5_set_voltage_sel(struct regulator_dev *rdev,
 	return max8660_write(max8660, MAX8660_VCC1, 0xff, 0xc0);
 }
 
-static struct regulator_ops max8660_ldo5_ops = {
+static const struct regulator_ops max8660_ldo5_ops = {
 	.list_voltage = regulator_list_voltage_linear,
 	.map_voltage = regulator_map_voltage_linear,
 	.set_voltage_sel = max8660_ldo5_set_voltage_sel,
@@ -252,7 +252,7 @@ static int max8660_ldo67_set_voltage_sel(struct regulator_dev *rdev,
 				     selector << 4);
 }
 
-static struct regulator_ops max8660_ldo67_ops = {
+static const struct regulator_ops max8660_ldo67_ops = {
 	.is_enabled = max8660_ldo67_is_enabled,
 	.enable = max8660_ldo67_enable,
 	.disable = max8660_ldo67_disable,
-- 
2.11.0
