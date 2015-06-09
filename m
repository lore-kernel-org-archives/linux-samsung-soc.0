From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v7 4/8] mfd: cros_ec: add proto v3 skeleton
Date: Tue,  9 Jun 2015 13:04:45 +0200
Message-ID: <1433847889-7220-5-git-send-email-javier.martinez@collabora.co.uk>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

From: Stephen Barber <smbarber@chromium.org>

Add support in cros_ec.c to handle EC host command protocol v3.
For v3+, probe for maximum shared protocol version and max
request, response, and passthrough sizes. For now, this will
always fall back to v2, since there is no bus-specific code
for handling proto v3 packets.

Signed-off-by: Stephen Barber <smbarber@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Olof Johansson <olof@lixom.net>
---

Changes since v6:
 - Add Olof Johansson Acked-by tag

Changes since v5: None

Changes since v4: None

Changes since v3:
 - Added tested-by from Heiko Stuebner.
 - Added acked-by tag from Lee Jones.

Changes since v2:
 - Add the helpers to the drivers/platform/chrome/cros_ec_proto.c driver
   instead of drivers/mfd/cros_ec.c. Suggested by Lee Jones.
 - Rename the proto probe functions for proto_query since probe has a
   special meaning in Linux so is confusing.

Changes since v1:
 - Squash change https://chromium-review.googlesource.com/#/c/262870/ in
   the patch. Suggested by Gwendal Grignou
 - Add Reviewed-by and Tested-by tags from Gwendal Grignou
---
 drivers/mfd/cros_ec.c                   |  23 ++-
 drivers/mfd/cros_ec_i2c.c               |   4 +
 drivers/mfd/cros_ec_spi.c               |   7 +-
 drivers/platform/chrome/cros_ec_lpc.c   |   4 +
 drivers/platform/chrome/cros_ec_proto.c | 339 ++++++++++++++++++++++++++++----
 include/linux/mfd/cros_ec.h             |  28 ++-
 6 files changed, 355 insertions(+), 50 deletions(-)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index d857f6a2b57b..08d82bfc5268 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -36,19 +36,22 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	struct device *dev = ec_dev->dev;
 	int err = 0;
 
-	if (ec_dev->din_size) {
-		ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
-		if (!ec_dev->din)
-			return -ENOMEM;
-	}
-	if (ec_dev->dout_size) {
-		ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
-		if (!ec_dev->dout)
-			return -ENOMEM;
-	}
+	ec_dev->max_request = sizeof(struct ec_params_hello);
+	ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
+	ec_dev->max_passthru = 0;
+
+	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
+	if (!ec_dev->din)
+		return -ENOMEM;
+
+	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
+	if (!ec_dev->dout)
+		return -ENOMEM;
 
 	mutex_init(&ec_dev->lock);
 
+	cros_ec_query_all(ec_dev);
+
 	err = mfd_add_devices(dev, 0, cros_devs,
 			      ARRAY_SIZE(cros_devs),
 			      NULL, ec_dev->irq, NULL);
diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
index fbf7819f5de5..b400bfa2772a 100644
--- a/drivers/mfd/cros_ec_i2c.c
+++ b/drivers/mfd/cros_ec_i2c.c
@@ -143,8 +143,12 @@ static int cros_ec_i2c_probe(struct i2c_client *client,
 	ec_dev->priv = client;
 	ec_dev->irq = client->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_i2c;
+	ec_dev->pkt_xfer = NULL;
 	ec_dev->ec_name = client->name;
 	ec_dev->phys_name = client->adapter->name;
+	ec_dev->din_size = sizeof(struct ec_host_response) +
+			   sizeof(struct ec_response_get_protocol_info);
+	ec_dev->dout_size = sizeof(struct ec_host_request);
 
 	err = cros_ec_register(ec_dev);
 	if (err) {
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 573730fec947..04da2f288ef8 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -361,10 +361,13 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	ec_dev->priv = ec_spi;
 	ec_dev->irq = spi->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_spi;
+	ec_dev->pkt_xfer = NULL;
 	ec_dev->ec_name = ec_spi->spi->modalias;
 	ec_dev->phys_name = dev_name(&ec_spi->spi->dev);
-	ec_dev->din_size = EC_MSG_BYTES + EC_MSG_PREAMBLE_COUNT;
-	ec_dev->dout_size = EC_MSG_BYTES;
+	ec_dev->din_size = EC_MSG_PREAMBLE_COUNT +
+			   sizeof(struct ec_host_response) +
+			   sizeof(struct ec_response_get_protocol_info);
+	ec_dev->dout_size = sizeof(struct ec_host_request);
 
 	err = cros_ec_register(ec_dev);
 	if (err) {
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 214ae7fef984..06c5790b2c28 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -205,7 +205,11 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	ec_dev->ec_name = pdev->name;
 	ec_dev->phys_name = dev_name(dev);
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_lpc;
+	ec_dev->pkt_xfer = NULL;
 	ec_dev->cmd_readmem = cros_ec_lpc_readmem;
+	ec_dev->din_size = sizeof(struct ec_host_response) +
+			   sizeof(struct ec_response_get_protocol_info);
+	ec_dev->dout_size = sizeof(struct ec_host_request);
 
 	ret = cros_ec_register(ec_dev);
 	if (ret) {
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 58e98a24fd08..990308ca384f 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -22,11 +22,100 @@
 
 #define EC_COMMAND_RETRIES	50
 
+static int prepare_packet(struct cros_ec_device *ec_dev,
+			  struct cros_ec_command *msg)
+{
+	struct ec_host_request *request;
+	u8 *out;
+	int i;
+	u8 csum = 0;
+
+	BUG_ON(ec_dev->proto_version != EC_HOST_REQUEST_VERSION);
+	BUG_ON(msg->outsize + sizeof(*request) > ec_dev->dout_size);
+
+	out = ec_dev->dout;
+	request = (struct ec_host_request *)out;
+	request->struct_version = EC_HOST_REQUEST_VERSION;
+	request->checksum = 0;
+	request->command = msg->command;
+	request->command_version = msg->version;
+	request->reserved = 0;
+	request->data_len = msg->outsize;
+
+	for (i = 0; i < sizeof(*request); i++)
+		csum += out[i];
+
+	/* Copy data and update checksum */
+	memcpy(out + sizeof(*request), msg->data, msg->outsize);
+	for (i = 0; i < msg->outsize; i++)
+		csum += msg->data[i];
+
+	request->checksum = -csum;
+
+	return sizeof(*request) + msg->outsize;
+}
+
+static int send_command(struct cros_ec_device *ec_dev,
+			struct cros_ec_command *msg)
+{
+	int ret;
+
+	if (ec_dev->proto_version > 2)
+		ret = ec_dev->pkt_xfer(ec_dev, msg);
+	else
+		ret = ec_dev->cmd_xfer(ec_dev, msg);
+
+	if (msg->result == EC_RES_IN_PROGRESS) {
+		int i;
+		struct cros_ec_command *status_msg;
+		struct ec_response_get_comms_status *status;
+
+		status_msg = kmalloc(sizeof(*status_msg) + sizeof(*status),
+				     GFP_KERNEL);
+		if (!status_msg)
+			return -ENOMEM;
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
+
+	return ret;
+}
+
 int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 		       struct cros_ec_command *msg)
 {
-	uint8_t *out;
-	int csum, i;
+	u8 *out;
+	u8 csum;
+	int i;
+
+	if (ec_dev->proto_version > 2)
+		return prepare_packet(ec_dev, msg);
 
 	BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
 	out = ec_dev->dout;
@@ -36,7 +125,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 	csum = out[0] + out[1] + out[2];
 	for (i = 0; i < msg->outsize; i++)
 		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->data[i];
-	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = (uint8_t)(csum & 0xff);
+	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = csum;
 
 	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
 }
@@ -60,54 +149,232 @@ int cros_ec_check_result(struct cros_ec_device *ec_dev,
 }
 EXPORT_SYMBOL(cros_ec_check_result);
 
-int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
-		     struct cros_ec_command *msg)
+static int cros_ec_host_command_proto_query(struct cros_ec_device *ec_dev,
+					    int devidx,
+					    struct cros_ec_command *msg)
 {
+	/*
+	 * Try using v3+ to query for supported protocols. If this
+	 * command fails, fall back to v2. Returns the highest protocol
+	 * supported by the EC.
+	 * Also sets the max request/response/passthru size.
+	 */
 	int ret;
 
-	mutex_lock(&ec_dev->lock);
-	ret = ec_dev->cmd_xfer(ec_dev, msg);
-	if (msg->result == EC_RES_IN_PROGRESS) {
-		int i;
-		struct cros_ec_command *status_msg;
-		struct ec_response_get_comms_status *status;
+	if (!ec_dev->pkt_xfer)
+		return -EPROTONOSUPPORT;
 
-		status_msg = kmalloc(sizeof(*status_msg) + sizeof(*status),
-				     GFP_KERNEL);
-		if (!status_msg) {
-			ret = -ENOMEM;
-			goto exit;
-		}
+	memset(msg, 0, sizeof(*msg));
+	msg->command = EC_CMD_PASSTHRU_OFFSET(devidx) | EC_CMD_GET_PROTOCOL_INFO;
+	msg->insize = sizeof(struct ec_response_get_protocol_info);
 
-		status_msg->version = 0;
-		status_msg->command = EC_CMD_GET_COMMS_STATUS;
-		status_msg->insize = sizeof(*status);
-		status_msg->outsize = 0;
+	ret = send_command(ec_dev, msg);
+
+	if (ret < 0) {
+		dev_dbg(ec_dev->dev,
+			"failed to check for EC[%d] protocol version: %d\n",
+			devidx, ret);
+		return ret;
+	}
+
+	if (devidx > 0 && msg->result == EC_RES_INVALID_COMMAND)
+		return -ENODEV;
+	else if (msg->result != EC_RES_SUCCESS)
+		return msg->result;
+
+	return 0;
+}
+
+static int cros_ec_host_command_proto_query_v2(struct cros_ec_device *ec_dev)
+{
+	struct cros_ec_command *msg;
+	struct ec_params_hello *hello_params;
+	struct ec_response_hello *hello_response;
+	int ret;
+	int len = max(sizeof(*hello_params), sizeof(*hello_response));
+
+	msg = kmalloc(sizeof(*msg) + len, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->version = 0;
+	msg->command = EC_CMD_HELLO;
+	hello_params = (struct ec_params_hello *)msg->data;
+	msg->outsize = sizeof(*hello_params);
+	hello_response = (struct ec_response_hello *)msg->data;
+	msg->insize = sizeof(*hello_response);
+
+	hello_params->in_data = 0xa0b0c0d0;
+
+	ret = send_command(ec_dev, msg);
+
+	if (ret < 0) {
+		dev_dbg(ec_dev->dev,
+			"EC failed to respond to v2 hello: %d\n",
+			ret);
+		goto exit;
+	} else if (msg->result != EC_RES_SUCCESS) {
+		dev_err(ec_dev->dev,
+			"EC responded to v2 hello with error: %d\n",
+			msg->result);
+		ret = msg->result;
+		goto exit;
+	} else if (hello_response->out_data != 0xa1b2c3d4) {
+		dev_err(ec_dev->dev,
+			"EC responded to v2 hello with bad result: %u\n",
+			hello_response->out_data);
+		ret = -EBADMSG;
+		goto exit;
+	}
+
+	ret = 0;
+
+ exit:
+	kfree(msg);
+	return ret;
+}
+
+int cros_ec_query_all(struct cros_ec_device *ec_dev)
+{
+	struct device *dev = ec_dev->dev;
+	struct cros_ec_command *proto_msg;
+	struct ec_response_get_protocol_info *proto_info;
+	int ret;
+
+	proto_msg = kzalloc(sizeof(*proto_msg) + sizeof(*proto_info),
+			    GFP_KERNEL);
+	if (!proto_msg)
+		return -ENOMEM;
+
+	/* First try sending with proto v3. */
+	ec_dev->proto_version = 3;
+	ret = cros_ec_host_command_proto_query(ec_dev, 0, proto_msg);
+
+	if (ret == 0) {
+		proto_info = (struct ec_response_get_protocol_info *)
+			proto_msg->data;
+		ec_dev->max_request = proto_info->max_request_packet_size -
+			sizeof(struct ec_host_request);
+		ec_dev->max_response = proto_info->max_response_packet_size -
+			sizeof(struct ec_host_response);
+		ec_dev->proto_version =
+			min(EC_HOST_REQUEST_VERSION,
+					fls(proto_info->protocol_versions) - 1);
+		dev_dbg(ec_dev->dev,
+			"using proto v%u\n",
+			ec_dev->proto_version);
+
+		ec_dev->din_size = ec_dev->max_response +
+			sizeof(struct ec_host_response) +
+			EC_MAX_RESPONSE_OVERHEAD;
+		ec_dev->dout_size = ec_dev->max_request +
+			sizeof(struct ec_host_request) +
+			EC_MAX_REQUEST_OVERHEAD;
 
 		/*
-		 * Query the EC's status until it's no longer busy or
-		 * we encounter an error.
+		 * Check for PD
 		 */
-		for (i = 0; i < EC_COMMAND_RETRIES; i++) {
-			usleep_range(10000, 11000);
+		ret = cros_ec_host_command_proto_query(ec_dev, 1, proto_msg);
 
-			ret = ec_dev->cmd_xfer(ec_dev, status_msg);
-			if (ret < 0)
-				break;
+		if (ret) {
+			dev_dbg(ec_dev->dev, "no PD chip found: %d\n", ret);
+			ec_dev->max_passthru = 0;
+		} else {
+			dev_dbg(ec_dev->dev, "found PD chip\n");
+			ec_dev->max_passthru =
+				proto_info->max_request_packet_size -
+				sizeof(struct ec_host_request);
+		}
+	} else {
+		/* Try querying with a v2 hello message. */
+		ec_dev->proto_version = 2;
+		ret = cros_ec_host_command_proto_query_v2(ec_dev);
 
-			msg->result = status_msg->result;
-			if (status_msg->result != EC_RES_SUCCESS)
-				break;
+		if (ret == 0) {
+			/* V2 hello succeeded. */
+			dev_dbg(ec_dev->dev, "falling back to proto v2\n");
 
-			status = (struct ec_response_get_comms_status *)
-				 status_msg->data;
-			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
-				break;
+			ec_dev->max_request = EC_PROTO2_MAX_PARAM_SIZE;
+			ec_dev->max_response = EC_PROTO2_MAX_PARAM_SIZE;
+			ec_dev->max_passthru = 0;
+			ec_dev->pkt_xfer = NULL;
+			ec_dev->din_size = EC_MSG_BYTES;
+			ec_dev->dout_size = EC_MSG_BYTES;
+		} else {
+			/*
+			 * It's possible for a test to occur too early when
+			 * the EC isn't listening. If this happens, we'll
+			 * test later when the first command is run.
+			 */
+			ec_dev->proto_version = EC_PROTO_VERSION_UNKNOWN;
+			dev_dbg(ec_dev->dev, "EC query failed: %d\n", ret);
+			goto exit;
 		}
+	}
 
-		kfree(status_msg);
+	devm_kfree(dev, ec_dev->din);
+	devm_kfree(dev, ec_dev->dout);
+
+	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
+	if (!ec_dev->din) {
+		ret = -ENOMEM;
+		goto exit;
 	}
+
+	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
+	if (!ec_dev->dout) {
+		devm_kfree(dev, ec_dev->din);
+		ret = -ENOMEM;
+		goto exit;
+	}
+
 exit:
+	kfree(proto_msg);
+	return ret;
+}
+EXPORT_SYMBOL(cros_ec_query_all);
+
+int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
+		     struct cros_ec_command *msg)
+{
+	int ret;
+
+	mutex_lock(&ec_dev->lock);
+	if (ec_dev->proto_version == EC_PROTO_VERSION_UNKNOWN) {
+		ret = cros_ec_query_all(ec_dev);
+		if (ret) {
+			dev_err(ec_dev->dev,
+				"EC version unknown and query failed; aborting command\n");
+			mutex_unlock(&ec_dev->lock);
+			return ret;
+		}
+	}
+
+	if (msg->insize > ec_dev->max_response) {
+		dev_dbg(ec_dev->dev, "clamping message receive buffer\n");
+		msg->insize = ec_dev->max_response;
+	}
+
+	if (msg->command < EC_CMD_PASSTHRU_OFFSET(1)) {
+		if (msg->outsize > ec_dev->max_request) {
+			dev_err(ec_dev->dev,
+				"request of size %u is too big (max: %u)\n",
+				msg->outsize,
+				ec_dev->max_request);
+			mutex_unlock(&ec_dev->lock);
+			return -EMSGSIZE;
+		}
+	} else {
+		if (msg->outsize > ec_dev->max_passthru) {
+			dev_err(ec_dev->dev,
+				"passthru rq of size %u is too big (max: %u)\n",
+				msg->outsize,
+				ec_dev->max_passthru);
+			mutex_unlock(&ec_dev->lock);
+			return -EMSGSIZE;
+		}
+	}
+	ret = send_command(ec_dev, msg);
 	mutex_unlock(&ec_dev->lock);
 
 	return ret;
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 7eee38abd02a..59d909434efd 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -22,6 +22,15 @@
 #include <linux/mutex.h>
 
 /*
+ * Max bus-specific overhead incurred by request/responses.
+ * I2C requires 1 additional byte for requests.
+ * I2C requires 2 additional bytes for responses.
+ * */
+#define EC_PROTO_VERSION_UNKNOWN	0
+#define EC_MAX_REQUEST_OVERHEAD		1
+#define EC_MAX_RESPONSE_OVERHEAD	2
+
+/*
  * Command interface between EC and AP, for LPC, I2C and SPI interfaces.
  */
 enum {
@@ -88,6 +97,7 @@ struct cros_ec_command {
  *     Returns the number of bytes received if the communication succeeded, but
  *     that doesn't mean the EC was happy with the command. The caller
  *     should check msg.result for the EC's result code.
+ * @pkt_xfer: send packet to EC and get response
  * @lock: one transaction at a time
  */
 struct cros_ec_device {
@@ -104,15 +114,21 @@ struct cros_ec_device {
 			   unsigned int bytes, void *dest);
 
 	/* These are used to implement the platform-specific interface */
+	u16 max_request;
+	u16 max_response;
+	u16 max_passthru;
+	u16 proto_version;
 	void *priv;
 	int irq;
-	uint8_t *din;
-	uint8_t *dout;
+	u8 *din;
+	u8 *dout;
 	int din_size;
 	int dout_size;
 	bool wake_enabled;
 	int (*cmd_xfer)(struct cros_ec_device *ec,
 			struct cros_ec_command *msg);
+	int (*pkt_xfer)(struct cros_ec_device *ec,
+			struct cros_ec_command *msg);
 	struct mutex lock;
 };
 
@@ -194,4 +210,12 @@ int cros_ec_remove(struct cros_ec_device *ec_dev);
  */
 int cros_ec_register(struct cros_ec_device *ec_dev);
 
+/**
+ * cros_ec_register -  Query the protocol version supported by the ChromeOS EC
+ *
+ * @ec_dev: Device to register
+ * @return 0 if ok, -ve on error
+ */
+int cros_ec_query_all(struct cros_ec_device *ec_dev);
+
 #endif /* __LINUX_MFD_CROS_EC_H */
-- 
2.1.4
