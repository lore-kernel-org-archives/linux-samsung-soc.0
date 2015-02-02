From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v5 2/7] mfd: cros_ec: Add char dev and virtual dev pointers
Date: Mon,  2 Feb 2015 12:26:23 +0100
Message-ID: <1422876388-16540-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:52448 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752764AbbBBL0z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 06:26:55 -0500
In-Reply-To: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The ChromeOS Embedded Controller has to be accessed by applications.
A virtual character device is used as an interface with user-space.

Extend the struct cros_ec_device with the fields needed by the driver
of this virtual character device.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Acked-by: Lee Jones <lee.jones@linaro.org>
---

Changes since v4: None.

Changes since v3: None.

Changes since v2: None, added Lee Jones Acked-by tag.

Changes since v1: None, new patch.
---
 include/linux/mfd/cros_ec.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 71675b14b5ca..324a34683971 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -16,6 +16,7 @@
 #ifndef __LINUX_MFD_CROS_EC_H
 #define __LINUX_MFD_CROS_EC_H
 
+#include <linux/cdev.h>
 #include <linux/notifier.h>
 #include <linux/mfd/cros_ec_commands.h>
 #include <linux/mutex.h>
@@ -59,9 +60,17 @@ struct cros_ec_command {
  *
  * @ec_name: name of EC device (e.g. 'chromeos-ec')
  * @phys_name: name of physical comms layer (e.g. 'i2c-4')
- * @dev: Device pointer
+ * @dev: Device pointer for physical comms device
+ * @vdev: Device pointer for virtual comms device
+ * @cdev: Character device structure for virtual comms device
  * @was_wake_device: true if this device was set to wake the system from
  * sleep at the last suspend
+ * @cmd_readmem: direct read of the EC memory-mapped region, if supported
+ *     @offset is within EC_LPC_ADDR_MEMMAP region.
+ *     @bytes: number of bytes to read. zero means "read a string" (including
+ *     the trailing '\0'). At most only EC_MEMMAP_SIZE bytes can be read.
+ *     Caller must ensure that the buffer is large enough for the result when
+ *     reading a string.
  *
  * @priv: Private data
  * @irq: Interrupt to use
@@ -90,8 +99,12 @@ struct cros_ec_device {
 	const char *ec_name;
 	const char *phys_name;
 	struct device *dev;
+	struct device *vdev;
+	struct cdev cdev;
 	bool was_wake_device;
 	struct class *cros_class;
+	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offset,
+			   unsigned int bytes, void *dest);
 
 	/* These are used to implement the platform-specific interface */
 	void *priv;
-- 
2.1.3
