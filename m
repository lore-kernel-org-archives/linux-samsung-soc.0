From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RESEND PATCH 3/8] mfd: cros_ec: Instantiate sub-devices from device tree
Date: Mon,  6 Apr 2015 18:15:01 +0200
Message-ID: <1428336906-14906-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

From: Todd Broch <tbroch@chromium.org>

If the EC device tree node has sub-nodes, try to instantiate them as
MFD sub-devices.  We can configure the EC features provided by the board.

Signed-off-by: Todd Broch <tbroch@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/mfd/cros_ec.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index c4aecc6f8373..8aa83b91e25c 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -17,6 +17,7 @@
  * battery charging and regulator control, firmware update.
  */
 
+#include <linux/of_platform.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -109,18 +110,8 @@ EXPORT_SYMBOL(cros_ec_cmd_xfer);
 
 static const struct mfd_cell cros_devs[] = {
 	{
-		.name = "cros-ec-keyb",
-		.id = 1,
-		.of_compatible = "google,cros-ec-keyb",
-	},
-	{
-		.name = "cros-ec-i2c-tunnel",
-		.id = 2,
-		.of_compatible = "google,cros-ec-i2c-tunnel",
-	},
-	{
 		.name = "cros-ec-ctl",
-		.id = 3,
+		.id = 1,
 	},
 };
 
@@ -150,6 +141,15 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		return err;
 	}
 
+#ifdef CONFIG_OF
+	err = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (err) {
+		mfd_remove_devices(dev);
+		dev_err(dev, "Failed to register sub-devices\n");
+		return err;
+	}
+#endif
+
 	dev_info(dev, "Chrome EC device registered\n");
 
 	return 0;
-- 
2.1.4
