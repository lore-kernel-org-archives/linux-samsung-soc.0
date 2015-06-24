From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] regulator: s2mps11: Added shutdown function to poweroff Odroid-XU3
Date: Wed, 24 Jun 2015 16:46:28 +0930
Message-ID: <1435130188-4087-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35042 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbbFXHQt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jun 2015 03:16:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

Added .shutdown function to s2mps11 to help poweroff the board succefully.
The device drivers set the register to turn off the PMIC.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes fixes the poweroff
root@odroidxu3:~# poweroff

Broadcast message from root@odroidxu3
        (/dev/ttySAC2) at 13:08 ...

The system is going down for power off NOW!
root@odroidxu3:~# wait-for-state stop/waiting
 * Stopping rsync daemon rsync                                           [ OK ]
 * Stopping RDP Session manager                                          [ OK ]
 * Stopping NTP server ntpd                                              [ OK ]
 * Asking all remaining processes to terminate...                        [ OK ]
 * All processes ended within 1 seconds...                               [ OK ]
nm-dispatcher.action: Caught signal 15, shutting down...
ModemManager[2134]: <warn>  Could not acquire the 'org.freedesktop.ModemManager1' service name

ModemManager[2134]: <info>  ModemManager is shut down

 * Unmounting temporary filesystems...                                   [ OK ]
 * Deactivating swap...                                                  [ OK ]
 * Unmounting local filesystems...                                       [ OK ]
 * Will now halt
[  209.020280] reboot: Power down
[  209.122039] Power down failed, please power off system manually.
---
 drivers/regulator/s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index ff82811..871f7b8 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1060,6 +1060,13 @@ out:
 	return ret;
 }
 
+static void s2mps11_pmic_shutdown(struct platform_device *pdev)
+{
+	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
+
+	regmap_update_bits(iodev->regmap_pmic, S2MPS11_REG_CTRL1, 0xff, 0x00);
+}
+
 static const struct platform_device_id s2mps11_pmic_id[] = {
 	{ "s2mps11-pmic", S2MPS11X},
 	{ "s2mps13-pmic", S2MPS13X},
@@ -1074,6 +1081,7 @@ static struct platform_driver s2mps11_pmic_driver = {
 		.name = "s2mps11-pmic",
 	},
 	.probe = s2mps11_pmic_probe,
+	.shutdown = s2mps11_pmic_shutdown,
 	.id_table = s2mps11_pmic_id,
 };
 
-- 
1.9.1
