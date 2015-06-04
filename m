From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v6 8/8] mfd: cros_ec: spi: Add delay for asserting CS
Date: Thu,  4 Jun 2015 10:05:54 +0200
Message-ID: <1433405154-16273-9-git-send-email-javier.martinez@collabora.co.uk>
References: <1433405154-16273-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43418 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752802AbbFDIHC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Jun 2015 04:07:02 -0400
In-Reply-To: <1433405154-16273-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

From: Alexandru M Stan <amstan@chromium.org>

Some ECs need a little time for waking up before they can accept
SPI data at a high speed. This is configurable via a DT property
"google,cros-ec-spi-pre-delay".

This patch makes the cros_ec_spi driver to cause a delay before
the beginning of a SPI transaction, to make sure that the EC has
already woken up, if the property has been defined in the DTS.

Signed-off-by: Alexandru M Stan <amstan@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Lee Jones <lee.jones@linaro.org>
---

Changes since v5: None.

Changes since v4: None.

Changes since v3:
 - New patch, split DT binding and driver implementation as suggested
   by Lee Jones.
 - Add tested-by tag from Heiko Stuebner.
 - Add acked-by tag from Lee Jones.
---
 drivers/mfd/cros_ec_spi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

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
