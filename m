From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 7/8] mfd: cros_ec: add proto v3 skeleton
Date: Thu, 12 Mar 2015 18:02:47 +0100
Message-ID: <1426179768-27482-8-git-send-email-javier.martinez@collabora.co.uk>
References: <1426179768-27482-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46868 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932240AbbCLRDc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 13:03:32 -0400
In-Reply-To: <1426179768-27482-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

From: Stephen Barber <smbarber@chromium.org>

Add support in cros_ec.c to handle EC host command protocol v3.
For v3+, probe for maximum shared protocol version and max
request, response, and passthrough sizes. For now, this will
always fall back to v2, since there is no bus-specific code
for handling proto v3 packets.

Signed-off-by: Stephen Barber <smbarber@chromium.org>
Reviewed-by: Puthikorn Voravootivat <puthik@chromium.org>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Puthikorn Voravootivat <puthik@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/mfd/cros_ec.c                 | 338 +++++++++++++++++++++++++++++-----
 drivers/mfd/cros_ec_i2c.c             |   4 +
 drivers/mfd/cros_ec_spi.c             |   7 +-
 drivers/platform/chrome/cros_ec_lpc.c |   4 +
 include/linux/mfd/cros_ec.h           |  20 +-
 5 files changed, 320 insertions(+), 53 deletions(-)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index ffaf17823115..c71b671ebacd 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -30,11 +30,253 @@
 
 static int dev_id;
 
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
+	memcpy(out + sizeof(*request), msg->outdata, msg->outsize);
+	for (i = 0; i < msg->outsize; i++)
+		csum += msg->outdata[i];
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
+		struct cros_ec_command status_msg = { };
+		struct ec_response_get_comms_status *status;
+
+		status_msg.command = EC_CMD_GET_COMMS_STATUS;
+		status_msg.insize = sizeof(*status);
+
+		/*
+		 * Query the EC's status until it's no longer busy or
+		 * we encounter an error.
+		 */
+		for (i = 0; i < EC_COMMAND_RETRIES; i++) {
+			usleep_range(10000, 11000);
+
+			ret = ec_dev->cmd_xfer(ec_dev, &status_msg);
+			if (ret < 0)
+				break;
+
+			msg->result = status_msg.result;
+			if (status_msg.result != EC_RES_SUCCESS)
+				break;
+
+			status = (struct ec_response_get_comms_status *)
+				 status_msg.indata;
+			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
+				break;
+		}
+	}
+
+	return ret;
+}
+
+static int cros_ec_host_command_proto_probe(struct cros_ec_device *ec_dev,
+					    int devidx,
+					    struct cros_ec_command *msg)
+{
+	/*
+	 * Try using v3+ to query for supported protocols. If this
+	 * command fails, fall back to v2. Returns the highest protocol
+	 * supported by the EC.
+	 * Also sets the max request/response/passthru size.
+	 */
+	int ret;
+
+	if (!ec_dev->pkt_xfer)
+		return -EPROTONOSUPPORT;
+
+	memset(msg, 0, sizeof(*msg));
+	msg->command = EC_CMD_PASSTHRU_OFFSET(devidx) | EC_CMD_GET_PROTOCOL_INFO;
+	msg->insize = sizeof(struct ec_response_get_protocol_info);
+
+	ret = send_command(ec_dev, msg);
+
+	if (ret < 0) {
+		dev_dbg(ec_dev->dev,
+			"failed to probe for EC[%d] protocol version: %d\n",
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
+static int cros_ec_host_command_proto_probe_v2(struct cros_ec_device *ec_dev)
+{
+	struct cros_ec_command msg = { };
+	struct ec_params_hello *hello_params;
+	struct ec_response_hello *hello_response;
+	int ret;
+
+	msg.command = EC_CMD_HELLO;
+	hello_params = (struct ec_params_hello *)msg.outdata;
+	msg.outsize = sizeof(*hello_params);
+	hello_response = (struct ec_response_hello *)msg.indata;
+	msg.insize = sizeof(*hello_response);
+
+	hello_params->in_data = 0xa0b0c0d0;
+
+	ret = send_command(ec_dev, &msg);
+
+	if (ret < 0) {
+		dev_dbg(ec_dev->dev,
+			"EC failed to respond to v2 hello: %d\n",
+			ret);
+		return ret;
+	} else if (msg.result != EC_RES_SUCCESS) {
+		dev_err(ec_dev->dev,
+			"EC responded to v2 hello with error: %d\n",
+			msg.result);
+		return msg.result;
+	} else if (hello_response->out_data != 0xa1b2c3d4) {
+		dev_err(ec_dev->dev,
+			"EC responded to v2 hello with bad result: %u\n",
+			hello_response->out_data);
+		return -EBADMSG;
+	}
+
+	return 0;
+}
+
+static int cros_ec_probe_all(struct cros_ec_device *ec_dev)
+{
+	struct device *dev = ec_dev->dev;
+	struct cros_ec_command proto_msg;
+	struct ec_response_get_protocol_info *proto_info;
+	int ret;
+
+	/* First try sending with proto v3. */
+	ec_dev->proto_version = 3;
+	ret = cros_ec_host_command_proto_probe(ec_dev, 0, &proto_msg);
+
+	if (ret == 0) {
+		proto_info = (struct ec_response_get_protocol_info *)
+			proto_msg.indata;
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
+
+		/*
+		 * Check for PD
+		 */
+		ret = cros_ec_host_command_proto_probe(ec_dev, 1, &proto_msg);
+
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
+		/* Try probing with a v2 hello message. */
+		ec_dev->proto_version = 2;
+		ret = cros_ec_host_command_proto_probe_v2(ec_dev);
+
+		if (ret == 0) {
+			/* V2 hello succeeded. */
+			dev_dbg(ec_dev->dev, "falling back to proto v2\n");
+
+			ec_dev->max_request = EC_PROTO2_MAX_PARAM_SIZE;
+			ec_dev->max_response = EC_PROTO2_MAX_PARAM_SIZE;
+			ec_dev->max_passthru = 0;
+			ec_dev->pkt_xfer = NULL;
+			ec_dev->din_size = EC_MSG_BYTES;
+			ec_dev->dout_size = EC_MSG_BYTES;
+		} else {
+			/*
+			 * It's possible for a probe to occur too early when
+			 * the EC isn't listening. If this happens, we'll
+			 * probe later when the first command is run.
+			 */
+			ec_dev->proto_version = EC_PROTO_VERSION_UNKNOWN;
+			dev_dbg(ec_dev->dev, "EC probe failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	devm_kfree(dev, ec_dev->din);
+	devm_kfree(dev, ec_dev->dout);
+
+	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
+	if (!ec_dev->din)
+		return -ENOMEM;
+
+	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
+	if (!ec_dev->dout) {
+		devm_kfree(dev, ec_dev->din);
+		return -ENOMEM;
+	}
+
+	return 0;
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
@@ -44,7 +286,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 	csum = out[0] + out[1] + out[2];
 	for (i = 0; i < msg->outsize; i++)
 		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->outdata[i];
-	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = (uint8_t)(csum & 0xff);
+	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = csum;
 
 	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
 }
@@ -73,51 +315,47 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
 {
 	int ret;
 
-	if (msg->insize > ARRAY_SIZE(msg->indata)) {
-		dev_err(ec_dev->dev,
-			"response of size %u is too big (max: %u)\n",
-			msg->insize, ARRAY_SIZE(msg->indata));
-		return -EMSGSIZE;
+	mutex_lock(&ec_dev->lock);
+
+	if (ec_dev->proto_version == EC_PROTO_VERSION_UNKNOWN) {
+		ret = cros_ec_probe_all(ec_dev);
+		if (ret) {
+			dev_err(ec_dev->dev,
+				"EC version unknown and probe failed; aborting command\n");
+			mutex_unlock(&ec_dev->lock);
+			return ret;
+		}
 	}
 
-	if (msg->outsize > ARRAY_SIZE(msg->outdata)) {
+	if (msg->insize > ec_dev->max_response) {
 		dev_err(ec_dev->dev,
 			"request of size %u is too big (max: %u)\n",
-			msg->outsize, ARRAY_SIZE(msg->outdata));
+			msg->insize, ec_dev->max_response);
+		mutex_unlock(&ec_dev->lock);
 		return -EMSGSIZE;
 	}
 
-	mutex_lock(&ec_dev->lock);
-	ret = ec_dev->cmd_xfer(ec_dev, msg);
-	if (msg->result == EC_RES_IN_PROGRESS) {
-		int i;
-		struct cros_ec_command status_msg = { };
-		struct ec_response_get_comms_status *status;
-
-		status_msg.command = EC_CMD_GET_COMMS_STATUS;
-		status_msg.insize = sizeof(*status);
-
-		/*
-		 * Query the EC's status until it's no longer busy or
-		 * we encounter an error.
-		 */
-		for (i = 0; i < EC_COMMAND_RETRIES; i++) {
-			usleep_range(10000, 11000);
-
-			ret = ec_dev->cmd_xfer(ec_dev, &status_msg);
-			if (ret < 0)
-				break;
-
-			msg->result = status_msg.result;
-			if (status_msg.result != EC_RES_SUCCESS)
-				break;
-
-			status = (struct ec_response_get_comms_status *)
-				 status_msg.indata;
-			if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
-				break;
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
 		}
 	}
+
+	ret = send_command(ec_dev, msg);
 	mutex_unlock(&ec_dev->lock);
 
 	return ret;
@@ -136,21 +374,23 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	struct device *dev = ec_dev->dev;
 	int err = 0;
 
+	ec_dev->max_request = sizeof(struct ec_params_hello);
+	ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
+	ec_dev->max_passthru = 0;
 	ec_dev->id = dev_id;
 
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
+	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
+	if (!ec_dev->din)
+		return -ENOMEM;
+
+	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
+	if (!ec_dev->dout)
+		return -ENOMEM;
 
 	mutex_init(&ec_dev->lock);
 
+	cros_ec_probe_all(ec_dev);
+
 	err = mfd_add_devices(dev, ec_dev->id, cros_devs,
 			      ARRAY_SIZE(cros_devs),
 			      NULL, ec_dev->irq, NULL);
diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
index 82b4d6148698..7decf8cdcb29 100644
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
index 27bd52e5e8b7..1951665d6ebb 100644
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
index 3a675817c95d..aa06fb2bdd0c 100644
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
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 8828e8ec347b..9bcaee3571f4 100644
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
@@ -91,6 +100,7 @@ struct cros_ec_command {
  *     Returns the number of bytes received if the communication succeeded, but
  *     that doesn't mean the EC was happy with the command. The caller
  *     should check msg.result for the EC's result code.
+ * @pkt_xfer: send packet to EC and get response
  * @lock: one transaction at a time
  */
 struct cros_ec_device {
@@ -107,16 +117,22 @@ struct cros_ec_device {
 			   unsigned int bytes, void *dest);
 
 	/* These are used to implement the platform-specific interface */
+	u16 max_request;
+	u16 max_response;
+	u16 max_passthru;
+	u16 proto_version;
 	void *priv;
 	int irq;
 	int id;
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
 
-- 
2.1.4
