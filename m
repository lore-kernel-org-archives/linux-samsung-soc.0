From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 1/3] regulator: max8997: reorder buck1/2/5 dvs setup code
Date: Fri, 23 Nov 2012 13:33:13 +0530
Message-ID: <1353657795-1725-2-git-send-email-thomas.abraham@linaro.org>
References: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48134 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964843Ab2KWHfl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 02:35:41 -0500
In-reply-to: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com

The BUCKxDVSx register programming is now moved prior to setting up of the
gpio based dvs mode. This will ensure that all the BUCKxDVSx registers
are programmed with appropriate voltage values before the gpio based dvs
mode is selected for buck1/2/5.

Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/regulator/max8997.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997.c
index cea9ec9..8901371 100644
--- a/drivers/regulator/max8997.c
+++ b/drivers/regulator/max8997.c
@@ -1019,6 +1019,19 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 				max_buck5, 0x3f);
 	}
 
+	/* Initialize all the DVS related BUCK registers */
+	for (i = 0; i < 8; i++) {
+		max8997_update_reg(i2c, MAX8997_REG_BUCK1DVS1 + i,
+				max8997->buck1_vol[i],
+				0x3f);
+		max8997_update_reg(i2c, MAX8997_REG_BUCK2DVS1 + i,
+				max8997->buck2_vol[i],
+				0x3f);
+		max8997_update_reg(i2c, MAX8997_REG_BUCK5DVS1 + i,
+				max8997->buck5_vol[i],
+				0x3f);
+	}
+
 	/*
 	 * If buck 1, 2, and 5 do not care DVS GPIO settings, ignore them.
 	 * If at least one of them cares, set gpios.
@@ -1068,19 +1081,6 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 	max8997_update_reg(i2c, MAX8997_REG_BUCK5CTRL, (pdata->buck5_gpiodvs) ?
 			(1 << 1) : (0 << 1), 1 << 1);
 
-	/* Initialize all the DVS related BUCK registers */
-	for (i = 0; i < 8; i++) {
-		max8997_update_reg(i2c, MAX8997_REG_BUCK1DVS1 + i,
-				max8997->buck1_vol[i],
-				0x3f);
-		max8997_update_reg(i2c, MAX8997_REG_BUCK2DVS1 + i,
-				max8997->buck2_vol[i],
-				0x3f);
-		max8997_update_reg(i2c, MAX8997_REG_BUCK5DVS1 + i,
-				max8997->buck5_vol[i],
-				0x3f);
-	}
-
 	/* Misc Settings */
 	max8997->ramp_delay = 10; /* set 10mV/us, which is the default */
 	max8997_write_reg(i2c, MAX8997_REG_BUCKRAMP, (0xf << 4) | 0x9);
-- 
1.6.6.rc2
