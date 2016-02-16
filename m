From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] regulator: s5m8767: fix get_register() error handling
Date: Tue, 16 Feb 2016 15:53:11 +0100
Message-ID: <1455634402-1997203-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:62629 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932273AbcBPOx7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Feb 2016 09:53:59 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

The s5m8767_pmic_probe() function calls s5m8767_get_register() to
read data without checking the return code, which produces a compile-time
warning when that data is accessed:

drivers/regulator/s5m8767.c: In function 's5m8767_pmic_probe':
drivers/regulator/s5m8767.c:924:7: error: 'enable_reg' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/regulator/s5m8767.c:944:30: error: 'enable_val' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This changes the s5m8767_get_register() function to return a -EINVAL
not just for an invalid register number but also for an invalid
regulator number, as both would result in returning uninitialized
data. The s5m8767_pmic_probe() function is then changed accordingly
to fail on a read error, as all the other callers of s5m8767_get_register()
already do.

In practice this probably cannot happen, as we don't call
s5m8767_get_register() with invalid arguments, but the gcc
warning seems valid in principle, in terms writing safe
error checking.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 9c4c60554acf ("regulator: s5m8767: Convert to use regulator_[enable|disable|is_enabled]_regmap")
---
 drivers/regulator/s5m8767.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 58f5d3b8e981..27343e1c43ef 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -202,9 +202,10 @@ static int s5m8767_get_register(struct s5m8767_info *s5m8767, int reg_id,
 		}
 	}
 
-	if (i < s5m8767->num_regulators)
-		*enable_ctrl =
-		s5m8767_opmode_reg[reg_id][mode] << S5M8767_ENCTRL_SHIFT;
+	if (i >= s5m8767->num_regulators)
+		return -EINVAL;
+
+	*enable_ctrl = s5m8767_opmode_reg[reg_id][mode] << S5M8767_ENCTRL_SHIFT;
 
 	return 0;
 }
@@ -937,8 +938,12 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 			else
 				regulators[id].vsel_mask = 0xff;
 
-			s5m8767_get_register(s5m8767, id, &enable_reg,
+			ret = s5m8767_get_register(s5m8767, id, &enable_reg,
 					     &enable_val);
+			if (ret) {
+				dev_err(s5m8767->dev, "error reading registers\n");
+				return ret;
+			}
 			regulators[id].enable_reg = enable_reg;
 			regulators[id].enable_mask = S5M8767_ENCTRL_MASK;
 			regulators[id].enable_val = enable_val;
-- 
2.7.0
