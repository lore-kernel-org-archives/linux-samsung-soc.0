From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v3 7/7] mfd: cros_ec: spi: Add delay for asserting CS
Date: Fri, 22 May 2015 17:42:20 +0200
Message-ID: <1432309340-13688-8-git-send-email-javier.martinez@collabora.co.uk>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:56994 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757974AbbEVPnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 11:43:04 -0400
In-Reply-To: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

From: Alexandru M Stan <amstan@chromium.org>

Some ECs need a little time for waking up before they can accept
SPI data at a high speed. This is configurable via a DT property
"google,cros-ec-spi-pre-delay".

If this property isn't set, then no delay will be added. However,
if set it will cause a delay equal to the value passed to it to
be inserted at the beginning of a transaction.

Signed-off-by: Alexandru M Stan <amstan@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v2: None

Changes since v1: None, new patch
---
 Documentation/devicetree/bindings/mfd/cros-ec.txt |  4 ++++
 drivers/mfd/cros_ec_spi.c                         | 21 +++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 8009c3d87f33..1777916e9e28 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -18,6 +18,10 @@ Required properties (SPI):
 - reg: SPI chip select
 
 Optional properties (SPI):
+- google,cros-ec-spi-pre-delay: Some implementations of the EC need a little
+  time to wake up from sleep before they can receive SPI transfers at a high
+  clock rate. This property specifies the delay, in usecs, between the
+  assertion of the CS to the start of the first clock pulse.
 - google,cros-ec-spi-msg-delay: Some implementations of the EC require some
   additional processing time in order to accept new transactions. If the delay
   between transactions is not long enough the EC may not be able to respond
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index faba03e2f1ef..16f228dc243f 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -71,12 +71,15 @@
  * @spi: SPI device we are connected to
  * @last_transfer_ns: time that we last finished a transfer, or 0 if there
  *	if no record
+ * @start_of_msg_delay: used to set the delay_usecs on the spi_transfer that
+ *      is sent when we want to turn on CS at the start of a transaction.
  * @end_of_msg_delay: used to set the delay_usecs on the spi_transfer that
  *      is sent when we want to turn off CS at the end of a transaction.
  */
 struct cros_ec_spi {
 	struct spi_device *spi;
 	s64 last_transfer_ns;
+	unsigned int start_of_msg_delay;
 	unsigned int end_of_msg_delay;
 };
 
@@ -366,7 +369,7 @@ static int cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
 	struct ec_host_request *request;
 	struct ec_host_response *response;
 	struct cros_ec_spi *ec_spi = ec_dev->priv;
-	struct spi_transfer trans;
+	struct spi_transfer trans, trans_delay;
 	struct spi_message msg;
 	int i, len;
 	u8 *ptr;
@@ -393,13 +396,23 @@ static int cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
 		goto exit;
 	}
 
+	/*
+	 * Leave a gap between CS assertion and clocking of data to allow the
+	 * EC time to wakeup.
+	 */
+	spi_message_init(&msg);
+	if (ec_spi->start_of_msg_delay) {
+		memset(&trans_delay, 0, sizeof(trans_delay));
+		trans_delay.delay_usecs = ec_spi->start_of_msg_delay;
+		spi_message_add_tail(&trans_delay, &msg);
+	}
+
 	/* Transmit phase - send our message */
 	memset(&trans, 0, sizeof(trans));
 	trans.tx_buf = ec_dev->dout;
 	trans.rx_buf = rx_buf;
 	trans.len = len;
 	trans.cs_change = 1;
-	spi_message_init(&msg);
 	spi_message_add_tail(&trans, &msg);
 	ret = spi_sync(ec_spi->spi, &msg);
 
@@ -602,6 +615,10 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
 	u32 val;
 	int ret;
 
+	ret = of_property_read_u32(np, "google,cros-ec-spi-pre-delay", &val);
+	if (!ret)
+		ec_spi->start_of_msg_delay = val;
+
 	ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
 	if (!ret)
 		ec_spi->end_of_msg_delay = val;
-- 
2.1.4
