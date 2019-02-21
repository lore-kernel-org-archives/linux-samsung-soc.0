From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] regulator: s5m8767: Constify s5m8767_opmode_reg
Date: Thu, 21 Feb 2019 21:17:21 +0800
Message-ID: <20190221131722.12278-1-axel.lin@ingics.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Axel Lin <axel.lin@ingics.com>
List-Id: linux-samsung-soc@vger.kernel.org

The s5m8767_opmode_reg should never change, make it const.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/regulator/s5m8767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index b581f01f3395..5b0e1fe6723f 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -115,7 +115,7 @@ static const struct sec_voltage_desc *reg_voltage_map[] = {
 	[S5M8767_BUCK9] = &buck_voltage_val3,
 };
 
-static unsigned int s5m8767_opmode_reg[][4] = {
+static const unsigned int s5m8767_opmode_reg[][4] = {
 	/* {OFF, ON, LOWPOWER, SUSPEND} */
 	/* LDO1 ... LDO28 */
 	{0x0, 0x3, 0x2, 0x1}, /* LDO1 */
-- 
2.17.1
