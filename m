From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/7] regulator: s2mpa01: Constify regulator_ops
Date: Sat, 11 Mar 2017 21:01:21 +0200
Message-ID: <20170311190124.11512-4-krzk@kernel.org>
References: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s2mpa01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index 38ee97a085f9..77db69587f05 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -213,7 +213,7 @@ static int s2mpa01_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 				  1 << enable_shift, 0);
 }
 
-static struct regulator_ops s2mpa01_ldo_ops = {
+static const struct regulator_ops s2mpa01_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -224,7 +224,7 @@ static struct regulator_ops s2mpa01_ldo_ops = {
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 };
 
-static struct regulator_ops s2mpa01_buck_ops = {
+static const struct regulator_ops s2mpa01_buck_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
 	.is_enabled		= regulator_is_enabled_regmap,
-- 
2.9.3
