From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/7] regulator: max1586: Constify regulator_ops
Date: Sat, 11 Mar 2017 21:01:18 +0200
Message-ID: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:32792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933278AbdCKTBj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2017 14:01:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.9.3
