From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device tree
Date: Thu, 11 Sep 2014 11:38:09 +0200
Message-ID: <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:36138 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753900AbaIKJid (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 05:38:33 -0400
In-Reply-To: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Derek Basehore <dbasehore@chromium.org>, Todd Broch <tbroch@chromium.org>, Olof Johansson <olof@lixom.net>, Andreas Faerber <afaerber@suse.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

From: Todd Broch <tbroch@chromium.org>

If the EC device tree node has sub-nodes, try to instantiate them as
MFD sub-devices.  We can configure the EC features provided by the board.

Signed-off-by: Todd Broch <tbroch@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v2:
 - Drop if guards since of_node is unconditionally built. Suggested by Lee Jones
 - Drop unneeded comment about of_platform_populate(). Suggested by Lee Jones.
 - Fix error message if of_platform_populate() fails. Suggested by Lee Jones.

Changes since v1:
 - Don't leave an empty struct mfd_cell array. Suggested by Lee Jones.
 - Just use of_platform_populate() instead of manually iterating through
   sub-devices and calling mfd_add_devices. Suggested by Lee Jones.
---
 drivers/mfd/cros_ec.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index 751af0b..7c533d2 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/mfd/core.h>
+#include <linux/of_platform.h>
 #include <linux/mfd/cros_ec.h>
 #include <linux/mfd/cros_ec_commands.h>
 #include <linux/delay.h>
@@ -109,22 +110,10 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
 }
 EXPORT_SYMBOL(cros_ec_cmd_xfer);
 
-static const struct mfd_cell cros_devs[] = {
-	{
-		.name = "cros-ec-keyb",
-		.id = 1,
-		.of_compatible = "google,cros-ec-keyb",
-	},
-	{
-		.name = "cros-ec-i2c-tunnel",
-		.id = 2,
-		.of_compatible = "google,cros-ec-i2c-tunnel",
-	},
-};
-
 int cros_ec_register(struct cros_ec_device *ec_dev)
 {
 	struct device *dev = ec_dev->dev;
+	struct device_node *node = dev->of_node;
 	int err = 0;
 
 	if (ec_dev->din_size) {
@@ -140,12 +129,12 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 
 	mutex_init(&ec_dev->lock);
 
-	err = mfd_add_devices(dev, 0, cros_devs,
-			      ARRAY_SIZE(cros_devs),
-			      NULL, ec_dev->irq, NULL);
-	if (err) {
-		dev_err(dev, "failed to add mfd devices\n");
-		return err;
+	if (node) {
+		err = of_platform_populate(node, NULL, NULL, dev);
+		if (err) {
+			dev_err(dev, "Failed to register subordinate devices");
+			return err;
+		}
 	}
 
 	dev_info(dev, "Chrome EC device registered\n");
-- 
2.1.0
