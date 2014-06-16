From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 07/10] mfd: cros_ec: cleanup: remove unused fields from struct cros_ec_device
Date: Mon, 16 Jun 2014 14:39:57 -0700
Message-ID: <1402954800-28215-8-git-send-email-dianders@chromium.org>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f201.google.com ([209.85.192.201]:55516 "EHLO
	mail-pd0-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755908AbaFPVkT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jun 2014 17:40:19 -0400
Received: by mail-pd0-f201.google.com with SMTP id v10so473818pde.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2014 14:40:19 -0700 (PDT)
In-Reply-To: <1402954800-28215-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, Doug Anderson <dianders@chromium.org>, sameo@linux.intel.com, linux-kernel@vger.kernel.org

From: Bill Richardson <wfrichar@chromium.org>

struct cros_ec_device has a superfluous "name" field. We can get all the
debugging info we need from the existing ec_name and phys_name fields, so
let's take out the extra field.

Signed-off-by: Bill Richardson <wfrichar@chromium.org>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 drivers/mfd/cros_ec.c       | 2 +-
 drivers/mfd/cros_ec_i2c.c   | 1 -
 drivers/mfd/cros_ec_spi.c   | 1 -
 include/linux/mfd/cros_ec.h | 2 --
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
index 9304056..d242714 100644
--- a/drivers/mfd/cros_ec.c
+++ b/drivers/mfd/cros_ec.c
@@ -138,7 +138,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		goto fail_mfd;
 	}
 
-	dev_info(dev, "Chrome EC (%s)\n", ec_dev->name);
+	dev_info(dev, "Chrome EC device registered\n");
 
 	return 0;
 
diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
index 37ed12f..5bb32f5 100644
--- a/drivers/mfd/cros_ec_i2c.c
+++ b/drivers/mfd/cros_ec_i2c.c
@@ -132,7 +132,6 @@ static int cros_ec_i2c_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, ec_dev);
-	ec_dev->name = "I2C";
 	ec_dev->dev = dev;
 	ec_dev->priv = client;
 	ec_dev->irq = client->irq;
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 2d713fe..09ca789 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -374,7 +374,6 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	cros_ec_spi_dt_probe(ec_spi, dev);
 
 	spi_set_drvdata(spi, ec_dev);
-	ec_dev->name = "SPI";
 	ec_dev->dev = dev;
 	ec_dev->priv = ec_spi;
 	ec_dev->irq = spi->irq;
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index f27c037..2b0c598 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -67,7 +67,6 @@ struct cros_ec_command {
  * @command_recv: receive a response
  * @command_sendrecv: send a command and receive a response
  *
- * @name: Name of this EC interface
  * @priv: Private data
  * @irq: Interrupt to use
  * @din: input buffer (for data from EC)
@@ -104,7 +103,6 @@ struct cros_ec_device {
 				void *in_buf, int in_len);
 
 	/* These are used to implement the platform-specific interface */
-	const char *name;
 	void *priv;
 	int irq;
 	uint8_t *din;
-- 
2.0.0.526.g5318336
