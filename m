From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 6/7] regulator: s5m8767: Constify regulator_ops
Date: Sat, 11 Mar 2017 21:01:23 +0200
Message-ID: <20170311190124.11512-6-krzk@kernel.org>
References: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934023AbdCKTCV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2017 14:02:21 -0500
In-Reply-To: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Static struct regulator_ops is not modified so can be made const for
code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.9.3
