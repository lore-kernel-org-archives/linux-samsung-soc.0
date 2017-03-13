From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: max77693: Constify regulator_ops" to the regulator tree
Date: Mon, 13 Mar 2017 16:56:54 +0000
Message-ID: <E1cnTHC-0004lq-UE@debutante>
References: <20170311190124.11512-2-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170311190124.11512-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   regulator: max77693: Constify regulator_ops

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

>From a08904fdb8b5be2334f3873cbeea4bc004528d02 Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 11 Mar 2017 21:01:19 +0200
Subject: [PATCH] regulator: max77693: Constify regulator_ops

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max77693-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max77693-regulator.c b/drivers/regulator/max77693-regulator.c
index cfbb9512e486..2e7c55058c2b 100644
--- a/drivers/regulator/max77693-regulator.c
+++ b/drivers/regulator/max77693-regulator.c
@@ -150,7 +150,7 @@ static struct regulator_ops max77693_safeout_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 };
 
-static struct regulator_ops max77693_charger_ops = {
+static const struct regulator_ops max77693_charger_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
-- 
2.11.0
