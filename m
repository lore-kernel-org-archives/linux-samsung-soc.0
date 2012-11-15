From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/4] i2c-s3c2410: do not generate STOP for QUIRK_HDMIPHY
Date: Thu, 15 Nov 2012 17:43:31 +0530
Message-ID: <1352981613-2098-3-git-send-email-ch.naveen@samsung.com>
References: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20257 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2993257Ab2KOLx7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Nov 2012 06:53:59 -0500
In-reply-to: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, khali@linux-fr.org, w.sang@pengutronix.de, naveenkrishna.ch@gmail.com, djkurtz@chromium.org

From: Daniel Kurtz <djkurtz@chromium.org>

buses

The datasheet says that the STOP sequence should be:
 1) I2CSTAT.5 = 0	- Clear BUSY (or 'generate STOP')
 2) I2CCON.4 = 0	- Clear IRQPEND
 3) Wait until the stop condition takes effect.
 4*) I2CSTAT.4 = 0 	- Clear TXRXEN

Where, step "4*" is only for buses with the "HDMIPHY" quirk.

However, after much experimentation, it appears that:
 a) normal buses automatically clear BUSY and transition from
    Master->Slave when they complete generating a STOP condition.
    Therefore, step (3) can be done in doxfer() by polling I2CCON.4
    after starting the STOP generation here.
 b) HDMIPHY bus does neither, so there is no way to do step 3.
    There is no indication when this bus has finished generating STOP.

In fact, we have found that as soon as the IRQPEND bit is cleared in
step 2, the HDMIPHY bus generates the STOP condition, and then immediately
starts transferring another data byte, even though the bus is supposedly
stopped.  This is presumably because the bus is still in "Master" mode,
and its BUSY bit is still set.

To avoid these extra post-STOP transactions on HDMI phy devices, we just
disable Serial Output on the bus (I2CSTAT.4 = 0) directly, instead of
first generating a proper STOP condition.  This should float SDA & SCK
terminating the transfer.  Subsequent transfers start with a proper START
condition, and proceed normally.

The HDMIPHY bus is an internal bus that always has exactly two devices,
the host as Master and the HDMIPHY device as the slave. Skipping the STOP
condition has been tested on this bus and works.

Also, since we disable the bus directly from the isr, we can skip the bus
idle polling loop at the end of doxfer().

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Daniel Kurtz <djkurtz@chromium.org>
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |   47 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 155cb04..fc4bf35 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -234,8 +234,47 @@ static inline void s3c24xx_i2c_stop(struct s3c24xx_i2c *i2c, int ret)
 
 	dev_dbg(i2c->dev, "STOP\n");
 
-	/* stop the transfer */
-	iicstat &= ~S3C2410_IICSTAT_START;
+	/*
+	 * The datasheet says that the STOP sequence should be:
+	 *  1) I2CSTAT.5 = 0	- Clear BUSY (or 'generate STOP')
+	 *  2) I2CCON.4 = 0	- Clear IRQPEND
+	 *  3) Wait until the stop condition takes effect.
+	 *  4*) I2CSTAT.4 = 0	- Clear TXRXEN
+	 *
+	 * Where, step "4*" is only for buses with the "HDMIPHY" quirk.
+	 *
+	 * However, after much experimentation, it appears that:
+	 * a) normal buses automatically clear BUSY and transition from
+	 *    Master->Slave when they complete generating a STOP condition.
+	 *    Therefore, step (3) can be done in doxfer() by polling I2CCON.4
+	 *    after starting the STOP generation here.
+	 * b) HDMIPHY bus does neither, so there is no way to do step 3.
+	 *    There is no indication when this bus has finished generating
+	 *    STOP.
+	 *
+	 * In fact, we have found that as soon as the IRQPEND bit is cleared in
+	 * step 2, the HDMIPHY bus generates the STOP condition, and then
+	 * immediately starts transferring another data byte, even though the
+	 * bus is supposedly stopped.  This is presumably because the bus is
+	 * still in "Master" mode, and its BUSY bit is still set.
+	 *
+	 * To avoid these extra post-STOP transactions on HDMI phy devices, we
+	 * just disable Serial Output on the bus (I2CSTAT.4 = 0) directly,
+	 * instead of first generating a proper STOP condition.  This should
+	 * float SDA & SCK terminating the transfer.  Subsequent transfers
+	 *  start with a proper START condition, and proceed normally.
+	 *
+	 * The HDMIPHY bus is an internal bus that always has exactly two
+	 * devices, the host as Master and the HDMIPHY device as the slave.
+	 * Skipping the STOP condition has been tested on this bus and works.
+	 */
+	if (i2c->quirks & QUIRK_HDMIPHY) {
+		/* Stop driving the I2C pins */
+		iicstat &= ~S3C2410_IICSTAT_TXRXEN;
+	} else {
+		/* stop the transfer */
+		iicstat &= ~S3C2410_IICSTAT_START;
+	}
 	writel(iicstat, i2c->regs + S3C2410_IICSTAT);
 
 	i2c->state = STATE_STOP;
@@ -560,6 +599,10 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	else if (ret != num)
 		dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
 
+	/* For QUIRK_HDMIPHY, bus is already disabled */
+	if (i2c->quirks & QUIRK_HDMIPHY)
+		goto out;
+
 	/* ensure the stop has been through the bus */
 
 	dev_dbg(i2c->dev, "waiting for bus idle\n");
-- 
1.7.9.5
