From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v6 3/8] mfd: cros_ec: Move protocol helpers out of the MFD driver
Date: Thu,  4 Jun 2015 10:05:49 +0200
Message-ID: <1433405154-16273-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1433405154-16273-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43381 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752739AbbFDIGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Jun 2015 04:06:39 -0400
In-Reply-To: <1433405154-16273-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The MFD driver should only have the logic to instantiate its child devices
and setup any shared resources that will be used by the subdevices drivers.

The cros_ec MFD is more complex than expected since it also has helpers to
communicate with the EC. So the driver will only get more bigger as other
protocols are supported in the future. So move the communication protocol
helpers to its own driver as drivers/platform/chrome/cros_ec_proto.c.

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Lee Jones <lee.jones@linaro.org>
---

Changes since v5: None

Changes since v4: None

Changes since v3:
 - Added tested-by tag from Heiko Stuebner.
 - Added acked-by tag from Lee Jones.

Changes since v2: None, new patch.
---
 drivers/i2c/busses/Kconfig              |   2 +-
 drivers/input/keyboard/Kconfig          |   2 +-
 drivers/mfd/Kconfig                     |   6 +-
 drivers/mfd/cros_ec.c                   |  96 --------------------------
 drivers/platform/chrome/Kconfig         |   9 ++-
 drivers/platform/chrome/Makefile        |   1 +
 drivers/platform/chrome/cros_ec_proto.c | 115 ++++++++++++++++++++++++++++++++
 7 files changed, 129 insertions(+), 102 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_ec_proto.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2255af23b9c7..5f1c1c4f5d87 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1103,7 +1103,7 @@ config I2C_SIBYTE
 
 config I2C_CROS_EC_TUNNEL
 	tristate "ChromeOS EC tunnel I2C bus"
-	depends on MFD_CROS_EC
+	depends on CROS_EC_PROTO
 	help
 	  If you say yes here you get an I2C bus that will tunnel i2c commands
 	  through to the other side of the ChromeOS EC to the i2c bus
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 106fbac7f8c5..e8eb60c6d83e 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -677,7 +677,7 @@ config KEYBOARD_W90P910
 config KEYBOARD_CROS_EC
 	tristate "ChromeOS EC keyboard"
 	select INPUT_MATRIXKMAP
-	depends on MFD_CROS_EC
+	depends on CROS_EC_PROTO
 	help
 	  Say Y here to enable the matrix keyboard used by ChromeOS devices
 	  and implemented on the ChromeOS EC. You must enable one bus option
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d5ad04dad081..cf3b86d441f7 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -94,6 +94,8 @@ config MFD_AXP20X
 config MFD_CROS_EC
 	tristate "ChromeOS Embedded Controller"
 	select MFD_CORE
+	select CHROME_PLATFORMS
+	select CROS_EC_PROTO
 	help
 	  If you say Y here you get support for the ChromeOS Embedded
 	  Controller (EC) providing keyboard, battery and power services.
@@ -102,7 +104,7 @@ config MFD_CROS_EC
 
 config MFD_CROS_EC_I2C
 	tristate "ChromeOS Embedded Controller (I2C)"
-	depends on MFD_CROS_EC && I2C
+	depends on MFD_CROS_EC && CROS_EC_PROTO && I2C
 
 	help
 	  If you say Y here, you get support for talking to the ChromeOS
@@ -112,7 +114,7 @@ config MFD_CROS_EC_I2C
 
 config MFD_CROS_EC_SPI
 	tristate "ChromeOS Embedded Controller (SPI)"
-	depends on MFD_CROS_EC && SPI && OF
+	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI && OF
 
 	---help---
 	  If you say Y here, you get support for talking to the ChromeOS EC
diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index 4a0f6dfcd376..d857f6a2b57b 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -23,102 +23,6 @@
 #include <linux/module.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/cros_ec.h>
-#include <linux/mfd/cros_ec_commands.h>
-#include <linux/delay.h>
-
-#define EC_COMMAND_RETRIES	50
-
-int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
-		       struct cros_ec_command *msg)
-{
-	uint8_t *out;
-	int csum, i;
-
-	BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
-	out = ec_dev->dout;
-	out[0] = EC_CMD_VERSION0 + msg->version;
-	out[1] = msg->command;
-	out[2] = msg->outsize;
-	csum = out[0] + out[1] + out[2];
-	for (i = 0; i < msg->outsize; i++)
-		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->data[i];
-	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = (uint8_t)(csum & 0xff);
-
-	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
-}
-EXPORT_SYMBOL(cros_ec_prepare_tx);
-
-int cros_ec_check_result(struct cros_ec_device *ec_dev,
-			 struct cros_ec_command *msg)
-{
-	switch (msg->result) {
-	case EC_RES_SUCCESS:
-		return 0;
-	case EC_RES_IN_PROGRESS:
-		dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
-			msg->command);
-		return -EAGAIN;
-	default:
-		dev_dbg(ec_dev->dev, "command 0x%02x returned %d\n",
-			msg->command, msg->result);
-		return 0;
-	}
-}
-EXPORT_SYMBOL(cros_ec_check_result);
-
-int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
-		     struct cros_ec_command *msg)
-{
-	int ret;
-
-	mutex_lock(&ec_dev->lock);
-	ret = ec_dev->cmd_xfer(ec_dev, msg);
-	if (msg->result == EC_RES_IN_PROGRESS) {
-		int i;
-		struct cros_ec_command *status_msg;
-		struct ec_response_get_comms_status *status;
-
-		status_msg = kmalloc(sizeof(*status_msg) + sizeof(*status),
-				     GFP_KERNEL);
-		if (!status_msg) {
-			ret = -ENOMEM;
-			goto exit;
-		}
-
-		status_msg->version = 0;
-		status_msg->command = EC_CMD_GET_COMMS_STATUS;
-		status_msg->insize = sizeof(*status);
-		status_msg->outsize = 0;
-
-		/*
-		 * Query the EC's status until it's no longer busy or
-		 * we encounter an error.
-		 */
-		for (i = 0; i < EC_COMMAND_RETRIES; i++) {
-			usleep_range(10000, 11000);
-
-			ret = ec_dev->cmd_xfer(ec_dev, status_msg);
-			if (ret < 0)
-				break;
-
-			msg->result = status_msg->result;
-			if (status_msg->result != EC_RES_SUCCESS)
-				break;
-
-			status = (struct ec_response_get_comms_status *)
-				 status_msg->data;
-			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
-				break;
-		}
-
-		kfree(status_msg);
-	}
-exit:
-	mutex_unlock(&ec_dev->lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(cros_ec_cmd_xfer);
 
 static const struct mfd_cell cros_devs[] = {
 	{
diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 2a6531a5fde8..cb1329919527 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -40,7 +40,7 @@ config CHROMEOS_PSTORE
 
 config CROS_EC_CHARDEV
         tristate "Chrome OS Embedded Controller userspace device interface"
-        depends on MFD_CROS_EC
+        depends on CROS_EC_PROTO
         ---help---
           This driver adds support to talk with the ChromeOS EC from userspace.
 
@@ -49,7 +49,7 @@ config CROS_EC_CHARDEV
 
 config CROS_EC_LPC
         tristate "ChromeOS Embedded Controller (LPC)"
-        depends on MFD_CROS_EC && (X86 || COMPILE_TEST)
+        depends on MFD_CROS_EC && CROS_EC_PROTO && (X86 || COMPILE_TEST)
         help
           If you say Y here, you get support for talking to the ChromeOS EC
           over an LPC bus. This uses a simple byte-level protocol with a
@@ -59,4 +59,9 @@ config CROS_EC_LPC
           To compile this driver as a module, choose M here: the
           module will be called cros_ec_lpc.
 
+config CROS_EC_PROTO
+        bool
+        help
+          ChromeOS EC communication protocol helpers.
+
 endif # CHROMEOS_PLATFORMS
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index bd8d8601e875..4a11b010f5d8 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_CHROMEOS_PSTORE)	+= chromeos_pstore.o
 cros_ec_devs-objs               := cros_ec_dev.o cros_ec_sysfs.o cros_ec_lightbar.o
 obj-$(CONFIG_CROS_EC_CHARDEV)   += cros_ec_devs.o
 obj-$(CONFIG_CROS_EC_LPC)       += cros_ec_lpc.o
+obj-$(CONFIG_CROS_EC_PROTO)	+= cros_ec_proto.o
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
new file mode 100644
index 000000000000..58e98a24fd08
--- /dev/null
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -0,0 +1,115 @@
+/*
+ * ChromeOS EC communication protocol helper functions
+ *
+ * Copyright (C) 2015 Google, Inc
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/mfd/cros_ec.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#define EC_COMMAND_RETRIES	50
+
+int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
+		       struct cros_ec_command *msg)
+{
+	uint8_t *out;
+	int csum, i;
+
+	BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
+	out = ec_dev->dout;
+	out[0] = EC_CMD_VERSION0 + msg->version;
+	out[1] = msg->command;
+	out[2] = msg->outsize;
+	csum = out[0] + out[1] + out[2];
+	for (i = 0; i < msg->outsize; i++)
+		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->data[i];
+	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = (uint8_t)(csum & 0xff);
+
+	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
+}
+EXPORT_SYMBOL(cros_ec_prepare_tx);
+
+int cros_ec_check_result(struct cros_ec_device *ec_dev,
+			 struct cros_ec_command *msg)
+{
+	switch (msg->result) {
+	case EC_RES_SUCCESS:
+		return 0;
+	case EC_RES_IN_PROGRESS:
+		dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
+			msg->command);
+		return -EAGAIN;
+	default:
+		dev_dbg(ec_dev->dev, "command 0x%02x returned %d\n",
+			msg->command, msg->result);
+		return 0;
+	}
+}
+EXPORT_SYMBOL(cros_ec_check_result);
+
+int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
+		     struct cros_ec_command *msg)
+{
+	int ret;
+
+	mutex_lock(&ec_dev->lock);
+	ret = ec_dev->cmd_xfer(ec_dev, msg);
+	if (msg->result == EC_RES_IN_PROGRESS) {
+		int i;
+		struct cros_ec_command *status_msg;
+		struct ec_response_get_comms_status *status;
+
+		status_msg = kmalloc(sizeof(*status_msg) + sizeof(*status),
+				     GFP_KERNEL);
+		if (!status_msg) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		status_msg->version = 0;
+		status_msg->command = EC_CMD_GET_COMMS_STATUS;
+		status_msg->insize = sizeof(*status);
+		status_msg->outsize = 0;
+
+		/*
+		 * Query the EC's status until it's no longer busy or
+		 * we encounter an error.
+		 */
+		for (i = 0; i < EC_COMMAND_RETRIES; i++) {
+			usleep_range(10000, 11000);
+
+			ret = ec_dev->cmd_xfer(ec_dev, status_msg);
+			if (ret < 0)
+				break;
+
+			msg->result = status_msg->result;
+			if (status_msg->result != EC_RES_SUCCESS)
+				break;
+
+			status = (struct ec_response_get_comms_status *)
+				 status_msg->data;
+			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
+				break;
+		}
+
+		kfree(status_msg);
+	}
+exit:
+	mutex_unlock(&ec_dev->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(cros_ec_cmd_xfer);
-- 
2.1.4
