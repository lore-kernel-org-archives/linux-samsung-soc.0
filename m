From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/7] regulator: max77693: Constify regulator_ops
Date: Sat, 11 Mar 2017 21:01:19 +0200
Message-ID: <20170311190124.11512-2-krzk@kernel.org>
References: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:32838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933808AbdCKTBo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2017 14:01:44 -0500
In-Reply-To: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/max77693-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max77693-regulator.c b/drivers/regulator/max77693-regulator.c
index 3fce67982682..e7000e777292 100644
--- a/drivers/regulator/max77693-regulator.c
+++ b/drivers/regulator/max77693-regulator.c
@@ -150,7 +150,7 @@ static const struct regulator_ops max77693_safeout_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 };
 
-static struct regulator_ops max77693_charger_ops = {
+static const struct regulator_ops max77693_charger_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
-- 
2.9.3
