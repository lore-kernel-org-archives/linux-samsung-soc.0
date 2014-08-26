From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] regulator: max77802: set opmode to normal if off is read from hw
Date: Tue, 26 Aug 2014 13:37:41 +0200
Message-ID: <1409053061-22568-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46773 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754555AbaHZLhx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 07:37:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The max77802 driver reads the default operating mode (opmode)
set for regulators when enabled from the hardware registers.

But if a regulator is disabled and the system warm restarted,
the hardware reports OFF as the opmode so the regulator is
not enabled. Default to operating mode NORMAL if OFF is read
from the hardware register.

Reported-by: Yuvaraj Cd <yuvaraj.lkml@gmail.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

This patch fixes the issue reported in https://lkml.org/lkml/2014/8/25/69

 drivers/regulator/max77802.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
index ad1caa9..967e109 100644
--- a/drivers/regulator/max77802.c
+++ b/drivers/regulator/max77802.c
@@ -540,7 +540,17 @@ static int max77802_pmic_probe(struct platform_device *pdev)
 		config.of_node = pdata->regulators[i].of_node;
 
 		ret = regmap_read(iodev->regmap, regulators[i].enable_reg, &val);
-		max77802->opmode[id] = val >> shift & MAX77802_OPMODE_MASK;
+		val = val >> shift & MAX77802_OPMODE_MASK;
+
+		/*
+		 * If the regulator is disabled and the system warm rebooted,
+		 * the hardware reports OFF as the regulator operating mode.
+		 * Default to operating mode NORMAL in that case.
+		 */
+		if (val == MAX77802_OPMODE_OFF)
+			max77802->opmode[id] = MAX77802_OPMODE_NORMAL;
+		else
+			max77802->opmode[id] = val;
 
 		rdev = devm_regulator_register(&pdev->dev,
 					       &regulators[i], &config);
-- 
2.0.1
