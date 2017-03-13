From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: max1586: Constify regulator_ops" to the regulator tree
Date: Mon, 13 Mar 2017 16:56:57 +0000
Message-ID: <E1cnTHF-0004mp-Vp@debutante>
References: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37950 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754382AbdCMQ5H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 12:57:07 -0400
In-Reply-To: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: max1586: Constify regulator_ops

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

>From 0f6ce809a518d736232de5f496b957733b1b4724 Mon Sep 17 00:00:00 2001
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 11 Mar 2017 21:01:18 +0200
Subject: [PATCH] regulator: max1586: Constify regulator_ops

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max1586.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/max1586.c b/drivers/regulator/max1586.c
index 2c1228d5796a..6779c2b53674 100644
--- a/drivers/regulator/max1586.c
+++ b/drivers/regulator/max1586.c
@@ -126,14 +126,14 @@ static int max1586_v6_set_voltage_sel(struct regulator_dev *rdev,
  * The Maxim 1586 controls V3 and V6 voltages, but offers no way of reading back
  * the set up value.
  */
-static struct regulator_ops max1586_v3_ops = {
+static const struct regulator_ops max1586_v3_ops = {
 	.get_voltage_sel = max1586_v3_get_voltage_sel,
 	.set_voltage_sel = max1586_v3_set_voltage_sel,
 	.list_voltage = regulator_list_voltage_linear,
 	.map_voltage = regulator_map_voltage_linear,
 };
 
-static struct regulator_ops max1586_v6_ops = {
+static const struct regulator_ops max1586_v6_ops = {
 	.get_voltage_sel = max1586_v6_get_voltage_sel,
 	.set_voltage_sel = max1586_v6_set_voltage_sel,
 	.list_voltage = regulator_list_voltage_table,
-- 
2.11.0
