From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 04/10] mfd: cros_ec: Use a zero-length array for command data
Date: Sat,  9 May 2015 12:10:35 +0200
Message-ID: <1431166241-15775-5-git-send-email-javier.martinez@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Commit 1b84f2a4cd4a ("mfd: cros_ec: Use fixed size arrays to transfer
data with the EC") modified the struct cros_ec_command fields to not
use pointers for the input and output buffers and use fixed length
arrays instead.

This change was made because the cros_ec ioctl API uses that struct
cros_ec_command to allow user-space to send commands to the EC and
to get data from the EC. So using pointers made the API not 64-bit
safe. Unfortunately this approach was not flexible enough for all
the use-cases since there may be a need to send larger commands
on newer versions of the EC command protocol.

So to avoid to choose a constant length that it may be too big for
most commands and thus wasting memory and CPU cycles on copy from
and to user-space or having a size that is too small for some big
commands, use a zero-length array that is both 64-bit safe and
flexible. The same buffer is used for both output and input data
so the maximum of these values should be used to allocate it.

Suggested-by: Gwendal Grignou <gwendal@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---

Changes since v1:
 - Add Heiko Stuebner Tested-by tag
 - Removed a new blank line at EOF warning. Reported by Heiko Stuebner
 - Use kmalloc instead of kzalloc when the message is later initialized
   Suggested by Gwendal Grignou
 - Pre-allocate struct cros_ec_command instead of dynamically allocate it
   whenever is possible. Suggested by Gwendal Grignou
 - Pre-allocate buffers for the usual cases and only allocate dynamically
   in the heap for bigger sizes. Suggested by Gwendal Grignou
 - Don't access the cros_ec_command received from user-space before doing
   a copy_from_user. Suggested by Gwendal Grignou
 - Only copy from user-space outsize bytes and copy_to_user insize bytes
   Suggested by Gwendal Grignou
 - ec_device_ioctl_xcmd() must return the numbers of bytes read and not 0
   on success. Suggested by Gwendal Grignou
 - Rename alloc_cmd_msg to alloc_lightbar_cmd_msg. Suggested by Gwendal Grignou
---
 drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  59 ++++++++---
 drivers/input/keyboard/cros_ec_keyb.c      |  19 ++--
 drivers/mfd/cros_ec.c                      |  18 ++--
 drivers/mfd/cros_ec_i2c.c                  |   4 +-
 drivers/mfd/cros_ec_spi.c                  |   2 +-
 drivers/platform/chrome/cros_ec_dev.c      |  66 +++++++++----
 drivers/platform/chrome/cros_ec_lightbar.c | 152 +++++++++++++++++++----------
 drivers/platform/chrome/cros_ec_lpc.c      |   8 +-
 drivers/platform/chrome/cros_ec_sysfs.c    |  92 +++++++++--------
 include/linux/mfd/cros_ec.h                |   6 +-
 10 files changed, 273 insertions(+), 153 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index fa8dedd8c3a2..30cefcd02bbf 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -17,6 +17,12 @@
 #include <linux/slab.h>
 
 #define I2C_MAX_RETRIES 3
+/*
+ * I2C commands are generally very small so 32 bytes is in
+ * most cases enough to hold the EC command headers and
+ * payload. Pre-allocate a buffer for these common cases.
+ */
+#define PREALLOC_SIZE 32
 
 /**
  * struct ec_i2c_device - Driver data for I2C tunnel
@@ -182,8 +188,10 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 	const u16 bus_num = bus->remote_bus;
 	int request_len;
 	int response_len;
+	int alloc_size;
 	int result;
-	struct cros_ec_command msg = { };
+	struct cros_ec_command *msg;
+	u8 buf[sizeof(*msg) + PREALLOC_SIZE];
 
 	request_len = ec_i2c_count_message(i2c_msgs, num);
 	if (request_len < 0) {
@@ -198,25 +206,46 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
 		return response_len;
 	}
 
-	result = ec_i2c_construct_message(msg.outdata, i2c_msgs, num, bus_num);
-	if (result)
-		return result;
+	alloc_size = max(request_len, response_len);
+
+	if (alloc_size > PREALLOC_SIZE) {
+		msg = kmalloc(sizeof(*msg) + alloc_size, GFP_KERNEL);
+		if (!msg)
+			return -ENOMEM;
+	} else {
+		msg = (struct cros_ec_command *)buf;
+		alloc_size = 0;
+	}
+
+	result = ec_i2c_construct_message(msg->data, i2c_msgs, num, bus_num);
+	if (result) {
+		dev_err(dev, "Error constructing EC i2c message %d\n", result);
+		goto exit;
+	}
 
-	msg.version = 0;
-	msg.command = EC_CMD_I2C_PASSTHRU;
-	msg.outsize = request_len;
-	msg.insize = response_len;
+	msg->version = 0;
+	msg->command = EC_CMD_I2C_PASSTHRU;
+	msg->outsize = request_len;
+	msg->insize = response_len;
 
-	result = cros_ec_cmd_xfer(bus->ec, &msg);
-	if (result < 0)
-		return result;
+	result = cros_ec_cmd_xfer(bus->ec, msg);
+	if (result < 0) {
+		dev_err(dev, "Error transferring EC i2c message %d\n", result);
+		goto exit;
+	}
 
-	result = ec_i2c_parse_response(msg.indata, i2c_msgs, &num);
-	if (result < 0)
-		return result;
+	result = ec_i2c_parse_response(msg->data, i2c_msgs, &num);
+	if (result < 0) {
+		dev_err(dev, "Error parsing EC i2c message %d\n", result);
+		goto exit;
+	}
 
 	/* Indicate success by saying how many messages were sent */
-	return num;
+	result = num;
+exit:
+	if (alloc_size)
+		kfree(msg);
+	return result;
 }
 
 static u32 ec_i2c_functionality(struct i2c_adapter *adap)
diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index b50c5b8b8a4d..090f8a75412a 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -149,16 +149,19 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 static int cros_ec_keyb_get_state(struct cros_ec_keyb *ckdev, uint8_t *kb_state)
 {
 	int ret;
-	struct cros_ec_command msg = {
-		.command = EC_CMD_MKBP_STATE,
-		.insize = ckdev->cols,
-	};
+	struct cros_ec_command *msg = (struct cros_ec_command *)kb_state;
 
-	ret = cros_ec_cmd_xfer(ckdev->ec, &msg);
-	if (ret < 0)
+	msg->command = EC_CMD_MKBP_STATE;
+	msg->insize = ckdev->cols;
+	msg->outsize = 0;
+
+	ret = cros_ec_cmd_xfer(ckdev->ec, msg);
+	if (ret < 0) {
+		dev_err(ckdev->dev, "Error transferring EC message %d\n", ret);
 		return ret;
+	}
 
-	memcpy(kb_state, msg.indata, ckdev->cols);
+	memcpy(kb_state, msg->data, ckdev->cols);
 
 	return 0;
 }
@@ -168,7 +171,7 @@ static irqreturn_t cros_ec_keyb_irq(int irq, void *data)
 	struct cros_ec_keyb *ckdev = data;
 	struct cros_ec_device *ec = ckdev->ec;
 	int ret;
-	uint8_t kb_state[ckdev->cols];
+	uint8_t kb_state[sizeof(struct cros_ec_command) + ckdev->cols];
 
 	if (device_may_wakeup(ec->dev))
 		pm_wakeup_event(ec->dev, 0);
diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index 1574a9352a6d..ee8aa8142932 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -41,7 +41,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 	out[2] = msg->outsize;
 	csum = out[0] + out[1] + out[2];
 	for (i = 0; i < msg->outsize; i++)
-		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->outdata[i];
+		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->data[i];
 	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = (uint8_t)(csum & 0xff);
 
 	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
@@ -75,11 +75,13 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
 	ret = ec_dev->cmd_xfer(ec_dev, msg);
 	if (msg->result == EC_RES_IN_PROGRESS) {
 		int i;
-		struct cros_ec_command status_msg = { };
+		struct cros_ec_command *status_msg;
 		struct ec_response_get_comms_status *status;
+		u8 buf[sizeof(*status_msg) + sizeof(*status)] = { };
 
-		status_msg.command = EC_CMD_GET_COMMS_STATUS;
-		status_msg.insize = sizeof(*status);
+		status_msg = (struct cros_ec_command *)buf;
+		status_msg->command = EC_CMD_GET_COMMS_STATUS;
+		status_msg->insize = sizeof(*status);
 
 		/*
 		 * Query the EC's status until it's no longer busy or
@@ -88,16 +90,16 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
 		for (i = 0; i < EC_COMMAND_RETRIES; i++) {
 			usleep_range(10000, 11000);
 
-			ret = ec_dev->cmd_xfer(ec_dev, &status_msg);
+			ret = ec_dev->cmd_xfer(ec_dev, status_msg);
 			if (ret < 0)
 				break;
 
-			msg->result = status_msg.result;
-			if (status_msg.result != EC_RES_SUCCESS)
+			msg->result = status_msg->result;
+			if (status_msg->result != EC_RES_SUCCESS)
 				break;
 
 			status = (struct ec_response_get_comms_status *)
-				 status_msg.indata;
+				 status_msg->data;
 			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
 				break;
 		}
diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
index 82b4d6148698..fbf7819f5de5 100644
--- a/drivers/mfd/cros_ec_i2c.c
+++ b/drivers/mfd/cros_ec_i2c.c
@@ -76,7 +76,7 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
 	/* copy message payload and compute checksum */
 	sum = out_buf[0] + out_buf[1] + out_buf[2];
 	for (i = 0; i < msg->outsize; i++) {
-		out_buf[3 + i] = msg->outdata[i];
+		out_buf[3 + i] = msg->data[i];
 		sum += out_buf[3 + i];
 	}
 	out_buf[3 + msg->outsize] = sum;
@@ -109,7 +109,7 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
 	/* copy response packet payload and compute checksum */
 	sum = in_buf[0] + in_buf[1];
 	for (i = 0; i < len; i++) {
-		msg->indata[i] = in_buf[2 + i];
+		msg->data[i] = in_buf[2 + i];
 		sum += in_buf[2 + i];
 	}
 	dev_dbg(ec_dev->dev, "packet: %*ph, sum = %02x\n",
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 27bd52e5e8b7..573730fec947 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -299,7 +299,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 	for (i = 0; i < len; i++) {
 		sum += ptr[i + 2];
 		if (ec_msg->insize)
-			ec_msg->indata[i] = ptr[i + 2];
+			ec_msg->data[i] = ptr[i + 2];
 	}
 	sum &= 0xff;
 
diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform/chrome/cros_ec_dev.c
index 6090d0b2826f..7f7e3db59234 100644
--- a/drivers/platform/chrome/cros_ec_dev.c
+++ b/drivers/platform/chrome/cros_ec_dev.c
@@ -20,12 +20,15 @@
 #include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
 
 #include "cros_ec_dev.h"
 
 /* Device variables */
 #define CROS_MAX_DEV 128
+/* Most EC commands size is ~64 bytes so allocate a buffer for the usual case */
+#define PREALLOC_SIZE 64
 static struct class *cros_class;
 static int ec_major;
 
@@ -36,28 +39,28 @@ static int ec_get_version(struct cros_ec_device *ec, char *str, int maxlen)
 	static const char * const current_image_name[] = {
 		"unknown", "read-only", "read-write", "invalid",
 	};
-	struct cros_ec_command msg = {
-		.version = 0,
-		.command = EC_CMD_GET_VERSION,
-		.outdata = { 0 },
-		.outsize = 0,
-		.indata = { 0 },
-		.insize = sizeof(*resp),
-	};
+	struct cros_ec_command *msg;
+	u8 buf[sizeof(*msg) + sizeof(*resp)];
 	int ret;
 
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	msg = (struct cros_ec_command *)buf;
+	msg->version = 0;
+	msg->command = EC_CMD_GET_VERSION;
+	msg->insize = sizeof(*resp);
+	msg->outsize = 0;
+
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		return ret;
 
-	if (msg.result != EC_RES_SUCCESS) {
+	if (msg->result != EC_RES_SUCCESS) {
 		snprintf(str, maxlen,
 			 "%s\nUnknown EC version: EC returned %d\n",
-			 CROS_EC_DEV_VERSION, msg.result);
-		return 0;
+			 CROS_EC_DEV_VERSION, msg->result);
+		return -EINVAL;
 	}
 
-	resp = (struct ec_response_get_version *)msg.indata;
+	resp = (struct ec_response_get_version *)msg->data;
 	if (resp->current_image >= ARRAY_SIZE(current_image_name))
 		resp->current_image = 3; /* invalid */
 
@@ -110,20 +113,41 @@ static ssize_t ec_device_read(struct file *filp, char __user *buffer,
 static long ec_device_ioctl_xcmd(struct cros_ec_device *ec, void __user *arg)
 {
 	long ret;
-	struct cros_ec_command s_cmd = { };
+	int alloc_size;
+	struct cros_ec_command u_cmd;
+	struct cros_ec_command *s_cmd;
+	u8 buf[sizeof(*s_cmd) + PREALLOC_SIZE];
 
-	if (copy_from_user(&s_cmd, arg, sizeof(s_cmd)))
+	if (copy_from_user(&u_cmd, arg, sizeof(u_cmd)))
 		return -EFAULT;
 
-	ret = cros_ec_cmd_xfer(ec, &s_cmd);
+	alloc_size = max(u_cmd.outsize, u_cmd.insize);
+
+	if (alloc_size > PREALLOC_SIZE) {
+		s_cmd = kzalloc(sizeof(*s_cmd) + alloc_size, GFP_KERNEL);
+		if (!s_cmd)
+			return -ENOMEM;
+	} else {
+		s_cmd = (struct cros_ec_command *)buf;
+		alloc_size = 0;
+	}
+
+	if (copy_from_user(s_cmd, arg, sizeof(*s_cmd) + u_cmd.outsize)) {
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	ret = cros_ec_cmd_xfer(ec, s_cmd);
 	/* Only copy data to userland if data was received. */
 	if (ret < 0)
-		return ret;
-
-	if (copy_to_user(arg, &s_cmd, sizeof(s_cmd)))
-		return -EFAULT;
+		goto exit;
 
-	return 0;
+	if (copy_to_user(arg, s_cmd, sizeof(*s_cmd) + u_cmd.insize))
+		ret = -EFAULT;
+exit:
+	if (alloc_size)
+		kfree(s_cmd);
+	return ret;
 }
 
 static long ec_device_ioctl_readmem(struct cros_ec_device *ec, void __user *arg)
diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index b4ff47a9069a..560e5d41b7ae 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -31,6 +31,7 @@
 #include <linux/sched.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/slab.h>
 
 #include "cros_ec_dev.h"
 
@@ -91,54 +92,79 @@ out:
 	return ret;
 }
 
-#define INIT_MSG(P, R) { \
-		.command = EC_CMD_LIGHTBAR_CMD, \
-		.outsize = sizeof(*P), \
-		.insize = sizeof(*R), \
-	}
+static struct cros_ec_command *alloc_lightbar_cmd_msg(void)
+{
+	struct cros_ec_command *msg;
+	int len;
+
+	len = max(sizeof(struct ec_params_lightbar),
+		  sizeof(struct ec_response_lightbar));
+
+	msg = kmalloc(sizeof(*msg) + len, GFP_KERNEL);
+	if (!msg)
+		return NULL;
+
+	msg->version = 0;
+	msg->command = EC_CMD_LIGHTBAR_CMD;
+	msg->outsize = sizeof(struct ec_params_lightbar);
+	msg->insize = sizeof(struct ec_response_lightbar);
+
+	return msg;
+}
 
 static int get_lightbar_version(struct cros_ec_device *ec,
 				uint32_t *ver_ptr, uint32_t *flg_ptr)
 {
 	struct ec_params_lightbar *param;
 	struct ec_response_lightbar *resp;
-	struct cros_ec_command msg = INIT_MSG(param, resp);
+	struct cros_ec_command *msg;
 	int ret;
 
-	param = (struct ec_params_lightbar *)msg.outdata;
-	param->cmd = LIGHTBAR_CMD_VERSION;
-	ret = cros_ec_cmd_xfer(ec, &msg);
-	if (ret < 0)
+	msg = alloc_lightbar_cmd_msg();
+	if (!msg)
 		return 0;
 
-	switch (msg.result) {
+	param = (struct ec_params_lightbar *)msg->data;
+	param->cmd = LIGHTBAR_CMD_VERSION;
+	ret = cros_ec_cmd_xfer(ec, msg);
+	if (ret < 0) {
+		ret = 0;
+		goto exit;
+	}
+
+	switch (msg->result) {
 	case EC_RES_INVALID_PARAM:
 		/* Pixel had no version command. */
 		if (ver_ptr)
 			*ver_ptr = 0;
 		if (flg_ptr)
 			*flg_ptr = 0;
-		return 1;
+		ret = 1;
+		goto exit;
 
 	case EC_RES_SUCCESS:
-		resp = (struct ec_response_lightbar *)msg.indata;
+		resp = (struct ec_response_lightbar *)msg->data;
 
 		/* Future devices w/lightbars should implement this command */
 		if (ver_ptr)
 			*ver_ptr = resp->version.num;
 		if (flg_ptr)
 			*flg_ptr = resp->version.flags;
-		return 1;
+		ret = 1;
+		goto exit;
 	}
 
 	/* Anything else (ie, EC_RES_INVALID_COMMAND) - no lightbar */
-	return 0;
+	ret = 0;
+exit:
+	kfree(msg);
+	return ret;
 }
 
 static ssize_t version_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
-	uint32_t version, flags;
+	uint32_t version = 0, flags = 0;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
 	int ret;
 
@@ -158,8 +184,7 @@ static ssize_t brightness_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	struct ec_params_lightbar *param;
-	struct ec_response_lightbar *resp;
-	struct cros_ec_command msg = INIT_MSG(param, resp);
+	struct cros_ec_command *msg;
 	int ret;
 	unsigned int val;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
@@ -167,21 +192,30 @@ static ssize_t brightness_store(struct device *dev,
 	if (kstrtouint(buf, 0, &val))
 		return -EINVAL;
 
-	param = (struct ec_params_lightbar *)msg.outdata;
+	msg = alloc_lightbar_cmd_msg();
+	if (!msg)
+		return -ENOMEM;
+
+	param = (struct ec_params_lightbar *)msg->data;
 	param->cmd = LIGHTBAR_CMD_BRIGHTNESS;
 	param->brightness.num = val;
 	ret = lb_throttle();
 	if (ret)
-		return ret;
+		goto exit;
 
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
-		return ret;
+		goto exit;
 
-	if (msg.result != EC_RES_SUCCESS)
-		return -EINVAL;
+	if (msg->result != EC_RES_SUCCESS) {
+		ret = -EINVAL;
+		goto exit;
+	}
 
-	return count;
+	ret = count;
+exit:
+	kfree(msg);
+	return ret;
 }
 
 
@@ -196,12 +230,15 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t count)
 {
 	struct ec_params_lightbar *param;
-	struct ec_response_lightbar *resp;
-	struct cros_ec_command msg = INIT_MSG(param, resp);
+	struct cros_ec_command *msg;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
 	unsigned int val[4];
 	int ret, i = 0, j = 0, ok = 0;
 
+	msg = alloc_lightbar_cmd_msg();
+	if (!msg)
+		return -ENOMEM;
+
 	do {
 		/* Skip any whitespace */
 		while (*buf && isspace(*buf))
@@ -215,7 +252,7 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 
 		if (i == 4) {
-			param = (struct ec_params_lightbar *)msg.outdata;
+			param = (struct ec_params_lightbar *)msg->data;
 			param->cmd = LIGHTBAR_CMD_RGB;
 			param->rgb.led = val[0];
 			param->rgb.red = val[1];
@@ -231,12 +268,14 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 					return ret;
 			}
 
-			ret = cros_ec_cmd_xfer(ec, &msg);
+			ret = cros_ec_cmd_xfer(ec, msg);
 			if (ret < 0)
-				return ret;
+				goto exit;
 
-			if (msg.result != EC_RES_SUCCESS)
-				return -EINVAL;
+			if (msg->result != EC_RES_SUCCESS) {
+				ret = -EINVAL;
+				goto exit;
+			}
 
 			i = 0;
 			ok = 1;
@@ -248,6 +287,8 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 
 	} while (*buf);
 
+exit:
+	kfree(msg);
 	return (ok && i == 0) ? count : -EINVAL;
 }
 
@@ -261,42 +302,55 @@ static ssize_t sequence_show(struct device *dev,
 {
 	struct ec_params_lightbar *param;
 	struct ec_response_lightbar *resp;
-	struct cros_ec_command msg = INIT_MSG(param, resp);
+	struct cros_ec_command *msg;
 	int ret;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
 
-	param = (struct ec_params_lightbar *)msg.outdata;
+	msg = alloc_lightbar_cmd_msg();
+	if (!msg)
+		return -ENOMEM;
+
+	param = (struct ec_params_lightbar *)msg->data;
 	param->cmd = LIGHTBAR_CMD_GET_SEQ;
 	ret = lb_throttle();
 	if (ret)
-		return ret;
+		goto exit;
 
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
-		return ret;
+		goto exit;
 
-	if (msg.result != EC_RES_SUCCESS)
-		return scnprintf(buf, PAGE_SIZE,
-				 "ERROR: EC returned %d\n", msg.result);
+	if (msg->result != EC_RES_SUCCESS) {
+		ret = scnprintf(buf, PAGE_SIZE,
+				"ERROR: EC returned %d\n", msg->result);
+		goto exit;
+	}
 
-	resp = (struct ec_response_lightbar *)msg.indata;
+	resp = (struct ec_response_lightbar *)msg->data;
 	if (resp->get_seq.num >= ARRAY_SIZE(seqname))
-		return scnprintf(buf, PAGE_SIZE, "%d\n", resp->get_seq.num);
+		ret = scnprintf(buf, PAGE_SIZE, "%d\n", resp->get_seq.num);
 	else
-		return scnprintf(buf, PAGE_SIZE, "%s\n",
-				 seqname[resp->get_seq.num]);
+		ret = scnprintf(buf, PAGE_SIZE, "%s\n",
+				seqname[resp->get_seq.num]);
+
+exit:
+	kfree(msg);
+	return ret;
 }
 
 static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 			      const char *buf, size_t count)
 {
 	struct ec_params_lightbar *param;
-	struct ec_response_lightbar *resp;
-	struct cros_ec_command msg = INIT_MSG(param, resp);
+	struct cros_ec_command *msg;
 	unsigned int num;
 	int ret, len;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
 
+	msg = alloc_lightbar_cmd_msg();
+	if (!msg)
+		return -ENOMEM;
+
 	for (len = 0; len < count; len++)
 		if (!isalnum(buf[len]))
 			break;
@@ -311,18 +365,18 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 			return ret;
 	}
 
-	param = (struct ec_params_lightbar *)msg.outdata;
+	param = (struct ec_params_lightbar *)msg->data;
 	param->cmd = LIGHTBAR_CMD_SEQ;
 	param->seq.num = num;
 	ret = lb_throttle();
 	if (ret)
 		return ret;
 
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		return ret;
 
-	if (msg.result != EC_RES_SUCCESS)
+	if (msg->result != EC_RES_SUCCESS)
 		return -EINVAL;
 
 	return count;
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 3a675817c95d..32b1df29fc58 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -73,8 +73,8 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 
 	/* Copy data and update checksum */
 	for (i = 0; i < msg->outsize; i++) {
-		outb(msg->outdata[i], EC_LPC_ADDR_HOST_PARAM + i);
-		csum += msg->outdata[i];
+		outb(msg->data[i], EC_LPC_ADDR_HOST_PARAM + i);
+		csum += msg->data[i];
 	}
 
 	/* Finalize checksum and write args */
@@ -119,8 +119,8 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 
 	/* Read response and update checksum */
 	for (i = 0; i < args.data_size; i++) {
-		msg->indata[i] = inb(EC_LPC_ADDR_HOST_PARAM + i);
-		csum += msg->indata[i];
+		msg->data[i] = inb(EC_LPC_ADDR_HOST_PARAM + i);
+		csum += msg->data[i];
 	}
 
 	/* Verify checksum */
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index fb62ab6cc659..88d0a7c9bbff 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/slab.h>
 #include <linux/stat.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -66,14 +67,17 @@ static ssize_t store_ec_reboot(struct device *dev,
 		{"hibernate",    EC_REBOOT_HIBERNATE, 0},
 		{"at-shutdown",  -1, EC_REBOOT_FLAG_ON_AP_SHUTDOWN},
 	};
-	struct cros_ec_command msg = { 0 };
-	struct ec_params_reboot_ec *param =
-		(struct ec_params_reboot_ec *)msg.outdata;
+	struct cros_ec_command *msg;
+	struct ec_params_reboot_ec *param;
+	u8 msg_buf[sizeof(*msg) + sizeof(*param)] = { 0 };
 	int got_cmd = 0, offset = 0;
 	int i;
 	int ret;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
 
+	msg = (struct cros_ec_command *)msg_buf;
+	param = (struct ec_params_reboot_ec *)msg->data;
+
 	param->flags = 0;
 	while (1) {
 		/* Find word to start scanning */
@@ -103,13 +107,13 @@ static ssize_t store_ec_reboot(struct device *dev,
 	if (!got_cmd)
 		return -EINVAL;
 
-	msg.command = EC_CMD_REBOOT_EC;
-	msg.outsize = sizeof(param);
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	msg->command = EC_CMD_REBOOT_EC;
+	msg->outsize = sizeof(*param);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		return ret;
-	if (msg.result != EC_RES_SUCCESS) {
-		dev_dbg(ec->dev, "EC result %d\n", msg.result);
+	if (msg->result != EC_RES_SUCCESS) {
+		dev_dbg(ec->dev, "EC result %d\n", msg->result);
 		return -EINVAL;
 	}
 
@@ -123,22 +127,25 @@ static ssize_t show_ec_version(struct device *dev,
 	struct ec_response_get_version *r_ver;
 	struct ec_response_get_chip_info *r_chip;
 	struct ec_response_board_version *r_board;
-	struct cros_ec_command msg = { 0 };
+	struct cros_ec_command *msg;
+	u8 msg_buf[sizeof(*msg) + EC_HOST_PARAM_SIZE] = { 0 };
 	int ret;
 	int count = 0;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
 
+	msg = (struct cros_ec_command *)msg_buf;
+
 	/* Get versions. RW may change. */
-	msg.command = EC_CMD_GET_VERSION;
-	msg.insize = sizeof(*r_ver);
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	msg->command = EC_CMD_GET_VERSION;
+	msg->insize = sizeof(*r_ver);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		return ret;
-	if (msg.result != EC_RES_SUCCESS)
+	if (msg->result != EC_RES_SUCCESS)
 		return scnprintf(buf, PAGE_SIZE,
-				 "ERROR: EC returned %d\n", msg.result);
+				 "ERROR: EC returned %d\n", msg->result);
 
-	r_ver = (struct ec_response_get_version *)msg.indata;
+	r_ver = (struct ec_response_get_version *)msg->data;
 	/* Strings should be null-terminated, but let's be sure. */
 	r_ver->version_string_ro[sizeof(r_ver->version_string_ro) - 1] = '\0';
 	r_ver->version_string_rw[sizeof(r_ver->version_string_rw) - 1] = '\0';
@@ -152,33 +159,33 @@ static ssize_t show_ec_version(struct device *dev,
 			    image_names[r_ver->current_image] : "?"));
 
 	/* Get build info. */
-	msg.command = EC_CMD_GET_BUILD_INFO;
-	msg.insize = sizeof(msg.indata);
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	msg->command = EC_CMD_GET_BUILD_INFO;
+	msg->insize = EC_HOST_PARAM_SIZE;
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Build info:    XFER ERROR %d\n", ret);
-	else if (msg.result != EC_RES_SUCCESS)
+	else if (msg->result != EC_RES_SUCCESS)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Build info:    EC error %d\n", msg.result);
+				   "Build info:    EC error %d\n", msg->result);
 	else {
-		msg.indata[sizeof(msg.indata) - 1] = '\0';
+		msg->data[sizeof(msg->data) - 1] = '\0';
 		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Build info:    %s\n", msg.indata);
+				   "Build info:    %s\n", msg->data);
 	}
 
 	/* Get chip info. */
-	msg.command = EC_CMD_GET_CHIP_INFO;
-	msg.insize = sizeof(*r_chip);
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	msg->command = EC_CMD_GET_CHIP_INFO;
+	msg->insize = sizeof(*r_chip);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Chip info:     XFER ERROR %d\n", ret);
-	else if (msg.result != EC_RES_SUCCESS)
+	else if (msg->result != EC_RES_SUCCESS)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Chip info:     EC error %d\n", msg.result);
+				   "Chip info:     EC error %d\n", msg->result);
 	else {
-		r_chip = (struct ec_response_get_chip_info *)msg.indata;
+		r_chip = (struct ec_response_get_chip_info *)msg->data;
 
 		r_chip->vendor[sizeof(r_chip->vendor) - 1] = '\0';
 		r_chip->name[sizeof(r_chip->name) - 1] = '\0';
@@ -192,17 +199,17 @@ static ssize_t show_ec_version(struct device *dev,
 	}
 
 	/* Get board version */
-	msg.command = EC_CMD_GET_BOARD_VERSION;
-	msg.insize = sizeof(*r_board);
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	msg->command = EC_CMD_GET_BOARD_VERSION;
+	msg->insize = sizeof(*r_board);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Board version: XFER ERROR %d\n", ret);
-	else if (msg.result != EC_RES_SUCCESS)
+	else if (msg->result != EC_RES_SUCCESS)
 		count += scnprintf(buf + count, PAGE_SIZE - count,
-				   "Board version: EC error %d\n", msg.result);
+				   "Board version: EC error %d\n", msg->result);
 	else {
-		r_board = (struct ec_response_board_version *)msg.indata;
+		r_board = (struct ec_response_board_version *)msg->data;
 
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Board version: %d\n",
@@ -216,21 +223,24 @@ static ssize_t show_ec_flashinfo(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
 	struct ec_response_flash_info *resp;
-	struct cros_ec_command msg = { 0 };
+	struct cros_ec_command *msg;
 	int ret;
 	struct cros_ec_device *ec = dev_get_drvdata(dev);
+	u8 msg_buf[sizeof(*msg) + sizeof(*resp)] = { 0 };
+
+	msg = (struct cros_ec_command *)msg_buf;
 
 	/* The flash info shouldn't ever change, but ask each time anyway. */
-	msg.command = EC_CMD_FLASH_INFO;
-	msg.insize = sizeof(*resp);
-	ret = cros_ec_cmd_xfer(ec, &msg);
+	msg->command = EC_CMD_FLASH_INFO;
+	msg->insize = sizeof(*resp);
+	ret = cros_ec_cmd_xfer(ec, msg);
 	if (ret < 0)
 		return ret;
-	if (msg.result != EC_RES_SUCCESS)
+	if (msg->result != EC_RES_SUCCESS)
 		return scnprintf(buf, PAGE_SIZE,
-				 "ERROR: EC returned %d\n", msg.result);
+				 "ERROR: EC returned %d\n", msg->result);
 
-	resp = (struct ec_response_flash_info *)msg.indata;
+	resp = (struct ec_response_flash_info *)msg->data;
 
 	return scnprintf(buf, PAGE_SIZE,
 			 "FlashSize %d\nWriteSize %d\n"
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 14cf522123dd..7eee38abd02a 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -42,8 +42,7 @@ enum {
  * @outsize: Outgoing length in bytes
  * @insize: Max number of bytes to accept from EC
  * @result: EC's response to the command (separate from communication failure)
- * @outdata: Outgoing data to EC
- * @indata: Where to put the incoming data from EC
+ * @data: Where to put the incoming data from EC and outgoing data to EC
  */
 struct cros_ec_command {
 	uint32_t version;
@@ -51,8 +50,7 @@ struct cros_ec_command {
 	uint32_t outsize;
 	uint32_t insize;
 	uint32_t result;
-	uint8_t outdata[EC_PROTO2_MAX_PARAM_SIZE];
-	uint8_t indata[EC_PROTO2_MAX_PARAM_SIZE];
+	uint8_t data[0];
 };
 
 /**
-- 
2.1.4
