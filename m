From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2] regulator: s2mps11: Added shutdown function to poweroff
Date: Wed, 15 Jul 2015 01:11:17 +0930
Message-ID: <1436888477-3841-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Added .shutdown function to s2mps11 to help poweroff the board successfully.

s2mps11-pmic: S2MPS11_REG_CTRL1 reg value 16:00000000000000000000000000010000

The device driver clears the register to turn off the PMIC.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>

---
Console log for improper shutdown.
root@odroidxu3:~# poweroff
...
  * Unmounting temporary filesystems...                                   [ OK ]
  * Deactivating swap...                                                  [ OK ]
  * Unmounting local filesystems...                                       [ OK ]
  * Will now halt
  [  209.020280] reboot: Power down
  [  209.122039] Power down failed, please power off system manually.

Console log for proper shutdown.
root@odroidxu3:~# poweroff
...
  * Unmounting temporary filesystems...                                   [ OK ]
  * Deactivating swap...                                                  [ OK ]
  * Unmounting local filesystems...                                       [ OK ]
  * Will now halt
  [  476.283071] reboo
---
 drivers/regulator/s2mps11.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 326ffb5..823180e 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1060,6 +1060,31 @@ out:
 	return ret;
 }
 
+static void s2mps11_pmic_shutdown(struct platform_device *pdev)
+{
+	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
+	unsigned int reg_val, ret;
+
+	ret = regmap_read(iodev->regmap_pmic, S2MPS11_REG_CTRL1, &reg_val);
+	if (ret < 0) {
+		dev_crit(&pdev->dev, "could not read S2MPS11_REG_CTRL1 value\n");
+	} else {
+		/*
+		 * s2mps11-pmic: S2MPS11_REG_CTRL1 reg value
+		 * is 00000000000000000000000000010000
+		 * clear the S2MPS11_REG_CTRL1 0x10 value to shutdown.
+		 */
+		if (reg_val & BIT(4)) {
+			ret = regmap_update_bits(iodev->regmap_pmic,
+						 S2MPS11_REG_CTRL1,
+						 BIT(4), BIT(0));
+			if (ret)
+				dev_crit(&pdev->dev,
+					 "could not write S2MPS11_REG_CTRL1 value\n");
+		}
+	}
+}
+
 static const struct platform_device_id s2mps11_pmic_id[] = {
 	{ "s2mps11-pmic", S2MPS11X},
 	{ "s2mps13-pmic", S2MPS13X},
@@ -1074,6 +1099,7 @@ static struct platform_driver s2mps11_pmic_driver = {
 		.name = "s2mps11-pmic",
 	},
 	.probe = s2mps11_pmic_probe,
+	.shutdown = s2mps11_pmic_shutdown,
 	.id_table = s2mps11_pmic_id,
 };
 
-- 
2.4.5
