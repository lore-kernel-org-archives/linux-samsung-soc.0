From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] regulator: s5m8767: Simplify s5m8767_set_voltage_time_sel implementation
Date: Thu, 21 Feb 2019 21:17:22 +0800
Message-ID: <20190221131722.12278-2-axel.lin@ingics.com>
References: <20190221131722.12278-1-axel.lin@ingics.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221131722.12278-1-axel.lin@ingics.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/regulator/s5m8767.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 5b0e1fe6723f..bb9d1a083299 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -339,13 +339,9 @@ static int s5m8767_set_voltage_time_sel(struct regulator_dev *rdev,
 					     unsigned int new_sel)
 {
 	struct s5m8767_info *s5m8767 = rdev_get_drvdata(rdev);
-	const struct sec_voltage_desc *desc;
-	int reg_id = rdev_get_id(rdev);
-
-	desc = reg_voltage_map[reg_id];
 
 	if ((old_sel < new_sel) && s5m8767->ramp_delay)
-		return DIV_ROUND_UP(desc->step * (new_sel - old_sel),
+		return DIV_ROUND_UP(rdev->desc->uV_step * (new_sel - old_sel),
 					s5m8767->ramp_delay * 1000);
 	return 0;
 }
-- 
2.17.1
