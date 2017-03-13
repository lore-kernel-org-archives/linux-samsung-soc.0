From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: s5m8767: Constify regulator_ops" to the regulator tree
Date: Mon, 13 Mar 2017 16:56:42 +0000
Message-ID: <E1cnTH0-0004ht-Rz@debutante>
References: <20170311190124.11512-6-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37846 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754255AbdCMQ4w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 12:56:52 -0400
In-Reply-To: <20170311190124.11512-6-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: s5m8767: Constify regulator_ops

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

>From 8a05eb190238d44a101a7db9addddbe74be0968e Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 11 Mar 2017 21:01:23 +0200
Subject: [PATCH] regulator: s5m8767: Constify regulator_ops

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s5m8767.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 27343e1c43ef..383cd7533721 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -357,7 +357,7 @@ static int s5m8767_set_voltage_time_sel(struct regulator_dev *rdev,
 	return 0;
 }
 
-static struct regulator_ops s5m8767_ops = {
+static const struct regulator_ops s5m8767_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
@@ -367,7 +367,7 @@ static struct regulator_ops s5m8767_ops = {
 	.set_voltage_time_sel	= s5m8767_set_voltage_time_sel,
 };
 
-static struct regulator_ops s5m8767_buck78_ops = {
+static const struct regulator_ops s5m8767_buck78_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
-- 
2.11.0
