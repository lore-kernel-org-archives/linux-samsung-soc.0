From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/7] regulator: max8660: Constify regulator_ops
Date: Sat, 11 Mar 2017 21:01:20 +0200
Message-ID: <20170311190124.11512-3-krzk@kernel.org>
References: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:32902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933898AbdCKTBy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2017 14:01:54 -0500
In-Reply-To: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Static struct regulator_ops (except max8660_dcdc_ops) are not modified
so can be made const for code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.9.3
