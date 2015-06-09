From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v7 5/8] mfd: cros_ec: add bus-specific proto v3 code
Date: Tue,  9 Jun 2015 13:04:46 +0200
Message-ID: <1433847889-7220-6-git-send-email-javier.martinez@collabora.co.uk>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:49331 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbbFILFO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Jun 2015 07:05:14 -0400
In-Reply-To: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

From: Stephen Barber <smbarber@chromium.org>

Add proto v3 support to the SPI, I2C, and LPC.

Signed-off-by: Stephen Barber <smbarber@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Olof Johansson <olof@lixom.net>
---

Changes since v6:
 - Add Olof Johansson Acked-by tag

Changes since v5: None

Changes since v4: None

Changes since v3:
 - Added acked-by tag from Lee Jones.

Changes since v2: None

Changes since v1:
 - Added Gwendal Grignou Reviewed-by and Tested-by tags
---
 drivers/mfd/cros_ec_i2c.c             | 166 ++++++++++++++-
 drivers/mfd/cros_ec_spi.c             | 382 +++++++++++++++++++++++++++++-----
 drivers/platform/chrome/cros_ec_lpc.c |  73 ++++++-
 include/linux/mfd/cros_ec.h           |   6 +
 4 files changed, 569 insertions(+), 58 deletions(-)

diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
index b400bfa2772a..22e8a4ae1711 100644
--- a/drivers/mfd/cros_ec_i2c.c
+++ b/drivers/mfd/cros_ec_i2c.c
@@ -13,6 +13,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -22,6 +23,32 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+/**
+ * Request format for protocol v3
+ * byte 0	0xda (EC_COMMAND_PROTOCOL_3)
+ * byte 1-8	struct ec_host_request
+ * byte 10-	response data
+ */
+struct ec_host_request_i2c {
+	/* Always 0xda to backward compatible with v2 struct */
+	uint8_t  command_protocol;
+	struct ec_host_request ec_request;
+} __packed;
+
+
+/*
+ * Response format for protocol v3
+ * byte 0	result code
+ * byte 1	packet_length
+ * byte 2-9	struct ec_host_response
+ * byte 10-	response data
+ */
+struct ec_host_response_i2c {
+	uint8_t result;
+	uint8_t packet_length;
+	struct ec_host_response ec_response;
+} __packed;
+
 static inline struct cros_ec_device *to_ec_dev(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -29,6 +56,134 @@ static inline struct cros_ec_device *to_ec_dev(struct device *dev)
 	return i2c_get_clientdata(client);
 }
 
+static int cros_ec_pkt_xfer_i2c(struct cros_ec_device *ec_dev,
+				struct cros_ec_command *msg)
+{
+	struct i2c_client *client = ec_dev->priv;
+	int ret = -ENOMEM;
+	int i;
+	int packet_len;
+	u8 *out_buf = NULL;
+	u8 *in_buf = NULL;
+	u8 sum;
+	struct i2c_msg i2c_msg[2];
+	struct ec_host_response *ec_response;
+	struct ec_host_request_i2c *ec_request_i2c;
+	struct ec_host_response_i2c *ec_response_i2c;
+	int request_header_size = sizeof(struct ec_host_request_i2c);
+	int response_header_size = sizeof(struct ec_host_response_i2c);
+
+	i2c_msg[0].addr = client->addr;
+	i2c_msg[0].flags = 0;
+	i2c_msg[1].addr = client->addr;
+	i2c_msg[1].flags = I2C_M_RD;
+
+	packet_len = msg->insize + response_header_size;
+	BUG_ON(packet_len > ec_dev->din_size);
+	in_buf = ec_dev->din;
+	i2c_msg[1].len = packet_len;
+	i2c_msg[1].buf = (char *) in_buf;
+
+	packet_len = msg->outsize + request_header_size;
+	BUG_ON(packet_len > ec_dev->dout_size);
+	out_buf = ec_dev->dout;
+	i2c_msg[0].len = packet_len;
+	i2c_msg[0].buf = (char *) out_buf;
+
+	/* create request data */
+	ec_request_i2c = (struct ec_host_request_i2c *) out_buf;
+	ec_request_i2c->command_protocol = EC_COMMAND_PROTOCOL_3;
+
+	ec_dev->dout++;
+	ret = cros_ec_prepare_tx(ec_dev, msg);
+	ec_dev->dout--;
+
+	/* send command to EC and read answer */
+	ret = i2c_transfer(client->adapter, i2c_msg, 2);
+	if (ret < 0) {
+		dev_dbg(ec_dev->dev, "i2c transfer failed: %d\n", ret);
+		goto done;
+	} else if (ret != 2) {
+		dev_err(ec_dev->dev, "failed to get response: %d\n", ret);
+		ret = -EIO;
+		goto done;
+	}
+
+	ec_response_i2c = (struct ec_host_response_i2c *) in_buf;
+	msg->result = ec_response_i2c->result;
+	ec_response = &ec_response_i2c->ec_response;
+
+	switch (msg->result) {
+	case EC_RES_SUCCESS:
+		break;
+	case EC_RES_IN_PROGRESS:
+		ret = -EAGAIN;
+		dev_dbg(ec_dev->dev, "command 0x%02x in progress\n",
+			msg->command);
+		goto done;
+
+	default:
+		dev_dbg(ec_dev->dev, "command 0x%02x returned %d\n",
+			msg->command, msg->result);
+		/*
+		 * When we send v3 request to v2 ec, ec won't recognize the
+		 * 0xda (EC_COMMAND_PROTOCOL_3) and will return with status
+		 * EC_RES_INVALID_COMMAND with zero data length.
+		 *
+		 * In case of invalid command for v3 protocol the data length
+		 * will be at least sizeof(struct ec_host_response)
+		 */
+		if (ec_response_i2c->result == EC_RES_INVALID_COMMAND &&
+		    ec_response_i2c->packet_length == 0) {
+			ret = -EPROTONOSUPPORT;
+			goto done;
+		}
+	}
+
+	if (ec_response_i2c->packet_length < sizeof(struct ec_host_response)) {
+		dev_err(ec_dev->dev,
+			"response of %u bytes too short; not a full header\n",
+			ec_response_i2c->packet_length);
+		ret = -EBADMSG;
+		goto done;
+	}
+
+	if (msg->insize < ec_response->data_len) {
+		dev_err(ec_dev->dev,
+			"response data size is too large: expected %u, got %u\n",
+			msg->insize,
+			ec_response->data_len);
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
+	/* copy response packet payload and compute checksum */
+	sum = 0;
+	for (i = 0; i < sizeof(struct ec_host_response); i++)
+		sum += ((u8 *)ec_response)[i];
+
+	memcpy(msg->data,
+	       in_buf + response_header_size,
+	       ec_response->data_len);
+	for (i = 0; i < ec_response->data_len; i++)
+		sum += msg->data[i];
+
+	/* All bytes should sum to zero */
+	if (sum) {
+		dev_err(ec_dev->dev, "bad packet checksum\n");
+		ret = -EBADMSG;
+		goto done;
+	}
+
+	ret = ec_response->data_len;
+
+done:
+	if (msg->command == EC_CMD_REBOOT_EC)
+		msleep(EC_REBOOT_DELAY_MS);
+
+	return ret;
+}
+
 static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
 				struct cros_ec_command *msg)
 {
@@ -121,9 +276,12 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
 	}
 
 	ret = len;
- done:
+done:
 	kfree(in_buf);
 	kfree(out_buf);
+	if (msg->command == EC_CMD_REBOOT_EC)
+		msleep(EC_REBOOT_DELAY_MS);
+
 	return ret;
 }
 
@@ -143,12 +301,12 @@ static int cros_ec_i2c_probe(struct i2c_client *client,
 	ec_dev->priv = client;
 	ec_dev->irq = client->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_i2c;
-	ec_dev->pkt_xfer = NULL;
+	ec_dev->pkt_xfer = cros_ec_pkt_xfer_i2c;
 	ec_dev->ec_name = client->name;
 	ec_dev->phys_name = client->adapter->name;
-	ec_dev->din_size = sizeof(struct ec_host_response) +
+	ec_dev->din_size = sizeof(struct ec_host_response_i2c) +
 			   sizeof(struct ec_response_get_protocol_info);
-	ec_dev->dout_size = sizeof(struct ec_host_request);
+	ec_dev->dout_size = sizeof(struct ec_host_request_i2c);
 
 	err = cros_ec_register(ec_dev);
 	if (err) {
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 04da2f288ef8..4e6f2f6b1095 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -65,12 +65,6 @@
   */
 #define EC_SPI_RECOVERY_TIME_NS	(200 * 1000)
 
-/*
- * The EC is unresponsive for a time after a reboot command.  Add a
- * simple delay to make sure that the bus stays locked.
- */
-#define EC_REBOOT_DELAY_MS	50
-
 /**
  * struct cros_ec_spi - information about a SPI-connected EC
  *
@@ -87,7 +81,7 @@ struct cros_ec_spi {
 };
 
 static void debug_packet(struct device *dev, const char *name, u8 *ptr,
-			  int len)
+			 int len)
 {
 #ifdef DEBUG
 	int i;
@@ -100,6 +94,172 @@ static void debug_packet(struct device *dev, const char *name, u8 *ptr,
 #endif
 }
 
+static int terminate_request(struct cros_ec_device *ec_dev)
+{
+	struct cros_ec_spi *ec_spi = ec_dev->priv;
+	struct spi_message msg;
+	struct spi_transfer trans;
+	int ret;
+
+	/*
+	 * Turn off CS, possibly adding a delay to ensure the rising edge
+	 * doesn't come too soon after the end of the data.
+	 */
+	spi_message_init(&msg);
+	memset(&trans, 0, sizeof(trans));
+	trans.delay_usecs = ec_spi->end_of_msg_delay;
+	spi_message_add_tail(&trans, &msg);
+
+	ret = spi_sync(ec_spi->spi, &msg);
+
+	/* Reset end-of-response timer */
+	ec_spi->last_transfer_ns = ktime_get_ns();
+	if (ret < 0) {
+		dev_err(ec_dev->dev,
+			"cs-deassert spi transfer failed: %d\n",
+			ret);
+	}
+
+	return ret;
+}
+
+/**
+ * receive_n_bytes - receive n bytes from the EC.
+ *
+ * Assumes buf is a pointer into the ec_dev->din buffer
+ */
+static int receive_n_bytes(struct cros_ec_device *ec_dev, u8 *buf, int n)
+{
+	struct cros_ec_spi *ec_spi = ec_dev->priv;
+	struct spi_transfer trans;
+	struct spi_message msg;
+	int ret;
+
+	BUG_ON(buf - ec_dev->din + n > ec_dev->din_size);
+
+	memset(&trans, 0, sizeof(trans));
+	trans.cs_change = 1;
+	trans.rx_buf = buf;
+	trans.len = n;
+
+	spi_message_init(&msg);
+	spi_message_add_tail(&trans, &msg);
+	ret = spi_sync(ec_spi->spi, &msg);
+	if (ret < 0)
+		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
+
+	return ret;
+}
+
+/**
+ * cros_ec_spi_receive_packet - Receive a packet from the EC.
+ *
+ * This function has two phases: reading the preamble bytes (since if we read
+ * data from the EC before it is ready to send, we just get preamble) and
+ * reading the actual message.
+ *
+ * The received data is placed into ec_dev->din.
+ *
+ * @ec_dev: ChromeOS EC device
+ * @need_len: Number of message bytes we need to read
+ */
+static int cros_ec_spi_receive_packet(struct cros_ec_device *ec_dev,
+				      int need_len)
+{
+	struct ec_host_response *response;
+	u8 *ptr, *end;
+	int ret;
+	unsigned long deadline;
+	int todo;
+
+	BUG_ON(EC_MSG_PREAMBLE_COUNT > ec_dev->din_size);
+
+	/* Receive data until we see the header byte */
+	deadline = jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
+	while (true) {
+		unsigned long start_jiffies = jiffies;
+
+		ret = receive_n_bytes(ec_dev,
+				      ec_dev->din,
+				      EC_MSG_PREAMBLE_COUNT);
+		if (ret < 0)
+			return ret;
+
+		ptr = ec_dev->din;
+		for (end = ptr + EC_MSG_PREAMBLE_COUNT; ptr != end; ptr++) {
+			if (*ptr == EC_SPI_FRAME_START) {
+				dev_dbg(ec_dev->dev, "msg found at %zd\n",
+					ptr - ec_dev->din);
+				break;
+			}
+		}
+		if (ptr != end)
+			break;
+
+		/*
+		 * Use the time at the start of the loop as a timeout.  This
+		 * gives us one last shot at getting the transfer and is useful
+		 * in case we got context switched out for a while.
+		 */
+		if (time_after(start_jiffies, deadline)) {
+			dev_warn(ec_dev->dev, "EC failed to respond in time\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	/*
+	 * ptr now points to the header byte. Copy any valid data to the
+	 * start of our buffer
+	 */
+	todo = end - ++ptr;
+	BUG_ON(todo < 0 || todo > ec_dev->din_size);
+	todo = min(todo, need_len);
+	memmove(ec_dev->din, ptr, todo);
+	ptr = ec_dev->din + todo;
+	dev_dbg(ec_dev->dev, "need %d, got %d bytes from preamble\n",
+		need_len, todo);
+	need_len -= todo;
+
+	/* If the entire response struct wasn't read, get the rest of it. */
+	if (todo < sizeof(*response)) {
+		ret = receive_n_bytes(ec_dev, ptr, sizeof(*response) - todo);
+		if (ret < 0)
+			return -EBADMSG;
+		ptr += (sizeof(*response) - todo);
+		todo = sizeof(*response);
+	}
+
+	response = (struct ec_host_response *)ec_dev->din;
+
+	/* Abort if data_len is too large. */
+	if (response->data_len > ec_dev->din_size)
+		return -EMSGSIZE;
+
+	/* Receive data until we have it all */
+	while (need_len > 0) {
+		/*
+		 * We can't support transfers larger than the SPI FIFO size
+		 * unless we have DMA. We don't have DMA on the ISP SPI ports
+		 * for Exynos. We need a way of asking SPI driver for
+		 * maximum-supported transfer size.
+		 */
+		todo = min(need_len, 256);
+		dev_dbg(ec_dev->dev, "loop, todo=%d, need_len=%d, ptr=%zd\n",
+			todo, need_len, ptr - ec_dev->din);
+
+		ret = receive_n_bytes(ec_dev, ptr, todo);
+		if (ret < 0)
+			return ret;
+
+		ptr += todo;
+		need_len -= todo;
+	}
+
+	dev_dbg(ec_dev->dev, "loop done, ptr=%zd\n", ptr - ec_dev->din);
+
+	return 0;
+}
+
 /**
  * cros_ec_spi_receive_response - Receive a response from the EC.
  *
@@ -115,34 +275,27 @@ static void debug_packet(struct device *dev, const char *name, u8 *ptr,
 static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
 					int need_len)
 {
-	struct cros_ec_spi *ec_spi = ec_dev->priv;
-	struct spi_transfer trans;
-	struct spi_message msg;
 	u8 *ptr, *end;
 	int ret;
 	unsigned long deadline;
 	int todo;
 
+	BUG_ON(EC_MSG_PREAMBLE_COUNT > ec_dev->din_size);
+
 	/* Receive data until we see the header byte */
 	deadline = jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
 	while (true) {
 		unsigned long start_jiffies = jiffies;
 
-		memset(&trans, 0, sizeof(trans));
-		trans.cs_change = 1;
-		trans.rx_buf = ptr = ec_dev->din;
-		trans.len = EC_MSG_PREAMBLE_COUNT;
-
-		spi_message_init(&msg);
-		spi_message_add_tail(&trans, &msg);
-		ret = spi_sync(ec_spi->spi, &msg);
-		if (ret < 0) {
-			dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
+		ret = receive_n_bytes(ec_dev,
+				      ec_dev->din,
+				      EC_MSG_PREAMBLE_COUNT);
+		if (ret < 0)
 			return ret;
-		}
 
+		ptr = ec_dev->din;
 		for (end = ptr + EC_MSG_PREAMBLE_COUNT; ptr != end; ptr++) {
-			if (*ptr == EC_MSG_HEADER) {
+			if (*ptr == EC_SPI_FRAME_START) {
 				dev_dbg(ec_dev->dev, "msg found at %zd\n",
 					ptr - ec_dev->din);
 				break;
@@ -187,21 +340,9 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
 		dev_dbg(ec_dev->dev, "loop, todo=%d, need_len=%d, ptr=%zd\n",
 			todo, need_len, ptr - ec_dev->din);
 
-		memset(&trans, 0, sizeof(trans));
-		trans.cs_change = 1;
-		trans.rx_buf = ptr;
-		trans.len = todo;
-		spi_message_init(&msg);
-		spi_message_add_tail(&trans, &msg);
-
-		/* send command to EC and read answer */
-		BUG_ON((u8 *)trans.rx_buf - ec_dev->din + todo >
-				ec_dev->din_size);
-		ret = spi_sync(ec_spi->spi, &msg);
-		if (ret < 0) {
-			dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
+		ret = receive_n_bytes(ec_dev, ptr, todo);
+		if (ret < 0)
 			return ret;
-		}
 
 		debug_packet(ec_dev->dev, "interim", ptr, todo);
 		ptr += todo;
@@ -214,6 +355,128 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
 }
 
 /**
+ * cros_ec_pkt_xfer_spi - Transfer a packet over SPI and receive the reply
+ *
+ * @ec_dev: ChromeOS EC device
+ * @ec_msg: Message to transfer
+ */
+static int cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
+				struct cros_ec_command *ec_msg)
+{
+	struct ec_host_request *request;
+	struct ec_host_response *response;
+	struct cros_ec_spi *ec_spi = ec_dev->priv;
+	struct spi_transfer trans;
+	struct spi_message msg;
+	int i, len;
+	u8 *ptr;
+	u8 *rx_buf;
+	u8 sum;
+	int ret = 0, final_ret;
+
+	len = cros_ec_prepare_tx(ec_dev, ec_msg);
+	request = (struct ec_host_request *)ec_dev->dout;
+	dev_dbg(ec_dev->dev, "prepared, len=%d\n", len);
+
+	/* If it's too soon to do another transaction, wait */
+	if (ec_spi->last_transfer_ns) {
+		unsigned long delay;	/* The delay completed so far */
+
+		delay = ktime_get_ns() - ec_spi->last_transfer_ns;
+		if (delay < EC_SPI_RECOVERY_TIME_NS)
+			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
+	}
+
+	rx_buf = kzalloc(len, GFP_KERNEL);
+	if (!rx_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	/* Transmit phase - send our message */
+	memset(&trans, 0, sizeof(trans));
+	trans.tx_buf = ec_dev->dout;
+	trans.rx_buf = rx_buf;
+	trans.len = len;
+	trans.cs_change = 1;
+	spi_message_init(&msg);
+	spi_message_add_tail(&trans, &msg);
+	ret = spi_sync(ec_spi->spi, &msg);
+
+	/* Get the response */
+	if (!ret) {
+		/* Verify that EC can process command */
+		for (i = 0; i < len; i++) {
+			switch (rx_buf[i]) {
+			case EC_SPI_PAST_END:
+			case EC_SPI_RX_BAD_DATA:
+			case EC_SPI_NOT_READY:
+				ret = -EAGAIN;
+				ec_msg->result = EC_RES_IN_PROGRESS;
+			default:
+				break;
+			}
+			if (ret)
+				break;
+		}
+		if (!ret)
+			ret = cros_ec_spi_receive_packet(ec_dev,
+					ec_msg->insize + sizeof(*response));
+	} else {
+		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
+	}
+
+	final_ret = terminate_request(ec_dev);
+	if (!ret)
+		ret = final_ret;
+	if (ret < 0)
+		goto exit;
+
+	ptr = ec_dev->din;
+
+	/* check response error code */
+	response = (struct ec_host_response *)ptr;
+	ec_msg->result = response->result;
+
+	ret = cros_ec_check_result(ec_dev, ec_msg);
+	if (ret)
+		goto exit;
+
+	len = response->data_len;
+	sum = 0;
+	if (len > ec_msg->insize) {
+		dev_err(ec_dev->dev, "packet too long (%d bytes, expected %d)",
+			len, ec_msg->insize);
+		ret = -EMSGSIZE;
+		goto exit;
+	}
+
+	for (i = 0; i < sizeof(*response); i++)
+		sum += ptr[i];
+
+	/* copy response packet payload and compute checksum */
+	memcpy(ec_msg->data, ptr + sizeof(*response), len);
+	for (i = 0; i < len; i++)
+		sum += ec_msg->data[i];
+
+	if (sum) {
+		dev_err(ec_dev->dev,
+			"bad packet checksum, calculated %x\n",
+			sum);
+		ret = -EBADMSG;
+		goto exit;
+	}
+
+	ret = len;
+exit:
+	kfree(rx_buf);
+	if (ec_msg->command == EC_CMD_REBOOT_EC)
+		msleep(EC_REBOOT_DELAY_MS);
+
+	return ret;
+}
+
+/**
  * cros_ec_cmd_xfer_spi - Transfer a message over SPI and receive the reply
  *
  * @ec_dev: ChromeOS EC device
@@ -227,6 +490,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 	struct spi_message msg;
 	int i, len;
 	u8 *ptr;
+	u8 *rx_buf;
 	int sum;
 	int ret = 0, final_ret;
 
@@ -242,10 +506,17 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
 	}
 
+	rx_buf = kzalloc(len, GFP_KERNEL);
+	if (!rx_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
 	/* Transmit phase - send our message */
 	debug_packet(ec_dev->dev, "out", ec_dev->dout, len);
 	memset(&trans, 0, sizeof(trans));
 	trans.tx_buf = ec_dev->dout;
+	trans.rx_buf = rx_buf;
 	trans.len = len;
 	trans.cs_change = 1;
 	spi_message_init(&msg);
@@ -254,29 +525,32 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 
 	/* Get the response */
 	if (!ret) {
-		ret = cros_ec_spi_receive_response(ec_dev,
-				ec_msg->insize + EC_MSG_TX_PROTO_BYTES);
+		/* Verify that EC can process command */
+		for (i = 0; i < len; i++) {
+			switch (rx_buf[i]) {
+			case EC_SPI_PAST_END:
+			case EC_SPI_RX_BAD_DATA:
+			case EC_SPI_NOT_READY:
+				ret = -EAGAIN;
+				ec_msg->result = EC_RES_IN_PROGRESS;
+			default:
+				break;
+			}
+			if (ret)
+				break;
+		}
+		if (!ret)
+			ret = cros_ec_spi_receive_response(ec_dev,
+					ec_msg->insize + EC_MSG_TX_PROTO_BYTES);
 	} else {
 		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
 	}
 
-	/*
-	 * Turn off CS, possibly adding a delay to ensure the rising edge
-	 * doesn't come too soon after the end of the data.
-	 */
-	spi_message_init(&msg);
-	memset(&trans, 0, sizeof(trans));
-	trans.delay_usecs = ec_spi->end_of_msg_delay;
-	spi_message_add_tail(&trans, &msg);
-
-	final_ret = spi_sync(ec_spi->spi, &msg);
-	ec_spi->last_transfer_ns = ktime_get_ns();
+	final_ret = terminate_request(ec_dev);
 	if (!ret)
 		ret = final_ret;
-	if (ret < 0) {
-		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
+	if (ret < 0)
 		goto exit;
-	}
 
 	ptr = ec_dev->din;
 
@@ -315,6 +589,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 
 	ret = len;
 exit:
+	kfree(rx_buf);
 	if (ec_msg->command == EC_CMD_REBOOT_EC)
 		msleep(EC_REBOOT_DELAY_MS);
 
@@ -361,7 +636,7 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	ec_dev->priv = ec_spi;
 	ec_dev->irq = spi->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_spi;
-	ec_dev->pkt_xfer = NULL;
+	ec_dev->pkt_xfer = cros_ec_pkt_xfer_spi;
 	ec_dev->ec_name = ec_spi->spi->modalias;
 	ec_dev->phys_name = dev_name(&ec_spi->spi->dev);
 	ec_dev->din_size = EC_MSG_PREAMBLE_COUNT +
@@ -369,6 +644,7 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 			   sizeof(struct ec_response_get_protocol_info);
 	ec_dev->dout_size = sizeof(struct ec_host_request);
 
+
 	err = cros_ec_register(ec_dev);
 	if (err) {
 		dev_err(dev, "cannot register EC\n");
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 06c5790b2c28..92b633324aaa 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -46,6 +46,77 @@ static int ec_response_timed_out(void)
 	return 1;
 }
 
+static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
+				struct cros_ec_command *msg)
+{
+	struct ec_host_request *request;
+	struct ec_host_response response;
+	u8 sum = 0;
+	int i;
+	int ret = 0;
+	u8 *dout;
+
+	ret = cros_ec_prepare_tx(ec, msg);
+
+	/* Write buffer */
+	for (i = 0; i < ret; i++)
+		outb(ec->dout[i], EC_LPC_ADDR_HOST_PACKET + i);
+
+	request = (struct ec_host_request *)ec->dout;
+
+	/* Here we go */
+	outb(EC_COMMAND_PROTOCOL_3, EC_LPC_ADDR_HOST_CMD);
+
+	if (ec_response_timed_out()) {
+		dev_warn(ec->dev, "EC responsed timed out\n");
+		ret = -EIO;
+		goto done;
+	}
+
+	/* Check result */
+	msg->result = inb(EC_LPC_ADDR_HOST_DATA);
+	ret = cros_ec_check_result(ec, msg);
+	if (ret)
+		goto done;
+
+	/* Read back response */
+	dout = (u8 *)&response;
+	for (i = 0; i < sizeof(response); i++) {
+		dout[i] = inb(EC_LPC_ADDR_HOST_PACKET + i);
+		sum += dout[i];
+	}
+
+	msg->result = response.result;
+
+	if (response.data_len > msg->insize) {
+		dev_err(ec->dev,
+			"packet too long (%d bytes, expected %d)",
+			response.data_len, msg->insize);
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
+	/* Read response and process checksum */
+	for (i = 0; i < response.data_len; i++) {
+		msg->data[i] =
+			inb(EC_LPC_ADDR_HOST_PACKET + sizeof(response) + i);
+		sum += msg->data[i];
+	}
+
+	if (sum) {
+		dev_err(ec->dev,
+			"bad packet checksum %02x\n",
+			response.checksum);
+		ret = -EBADMSG;
+		goto done;
+	}
+
+	/* Return actual amount of data received */
+	ret = response.data_len;
+done:
+	return ret;
+}
+
 static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 				struct cros_ec_command *msg)
 {
@@ -205,7 +276,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	ec_dev->ec_name = pdev->name;
 	ec_dev->phys_name = dev_name(dev);
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_lpc;
-	ec_dev->pkt_xfer = NULL;
+	ec_dev->pkt_xfer = cros_ec_pkt_xfer_lpc;
 	ec_dev->cmd_readmem = cros_ec_lpc_readmem;
 	ec_dev->din_size = sizeof(struct ec_host_response) +
 			   sizeof(struct ec_response_get_protocol_info);
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 59d909434efd..92e13aaa450c 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -22,6 +22,12 @@
 #include <linux/mutex.h>
 
 /*
+ * The EC is unresponsive for a time after a reboot command.  Add a
+ * simple delay to make sure that the bus stays locked.
+ */
+#define EC_REBOOT_DELAY_MS             50
+
+/*
  * Max bus-specific overhead incurred by request/responses.
  * I2C requires 1 additional byte for requests.
  * I2C requires 2 additional bytes for responses.
-- 
2.1.4
