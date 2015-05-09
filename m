From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 01/10] mfd: cros_ec: Remove parent field
Date: Sat,  9 May 2015 12:10:32 +0200
Message-ID: <1431166241-15775-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

From: Gwendal Grignou <gwendal@chromium.org>

parent and dev were pointing to the same device structure.
parent is unused, removed.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Reviewed-by: Stephen Barber <smbarber@chromium.org>
Tested-by: Stephen Barber <smbarber@chromium.org>
Reviewed-by: Puthikorn Voravootivat <puthik@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---

Changes since v1:
 - Added Heiko Stuebner and Gwendal Grignou Tested-by tag
 - Added Lee Jones Acked-by tag
 - Use cros_ec instead of cros ec in the subject line to be consistent.
   Suggested by Gwendal Grignou
---
 drivers/mfd/cros_ec_i2c.c             | 1 -
 drivers/mfd/cros_ec_spi.c             | 1 -
 drivers/platform/chrome/cros_ec_lpc.c | 1 -
 include/linux/mfd/cros_ec.h           | 2 --
 4 files changed, 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
index c0c30f4f946f..82b4d6148698 100644
--- a/drivers/mfd/cros_ec_i2c.c
+++ b/drivers/mfd/cros_ec_i2c.c
@@ -145,7 +145,6 @@ static int cros_ec_i2c_probe(struct i2c_client *client,
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_i2c;
 	ec_dev->ec_name = client->name;
 	ec_dev->phys_name = client->adapter->name;
-	ec_dev->parent = &client->dev;
 
 	err = cros_ec_register(ec_dev);
 	if (err) {
diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index bf6e08e8013e..27bd52e5e8b7 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -363,7 +363,6 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_spi;
 	ec_dev->ec_name = ec_spi->spi->modalias;
 	ec_dev->phys_name = dev_name(&ec_spi->spi->dev);
-	ec_dev->parent = &ec_spi->spi->dev;
 	ec_dev->din_size = EC_MSG_BYTES + EC_MSG_PREAMBLE_COUNT;
 	ec_dev->dout_size = EC_MSG_BYTES;
 
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 8f9ac4d7bbd0..860310513cf0 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -214,7 +214,6 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	ec_dev->dev = dev;
 	ec_dev->ec_name = pdev->name;
 	ec_dev->phys_name = dev_name(dev);
-	ec_dev->parent = dev;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_lpc;
 	ec_dev->cmd_readmem = cros_ec_lpc_readmem;
 
diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 324a34683971..14cf522123dd 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -85,7 +85,6 @@ struct cros_ec_command {
  * to using dword.
  * @din_size: size of din buffer to allocate (zero to use static din)
  * @dout_size: size of dout buffer to allocate (zero to use static dout)
- * @parent: pointer to parent device (e.g. i2c or spi device)
  * @wake_enabled: true if this device can wake the system from sleep
  * @cmd_xfer: send command to EC and get response
  *     Returns the number of bytes received if the communication succeeded, but
@@ -113,7 +112,6 @@ struct cros_ec_device {
 	uint8_t *dout;
 	int din_size;
 	int dout_size;
-	struct device *parent;
 	bool wake_enabled;
 	int (*cmd_xfer)(struct cros_ec_device *ec,
 			struct cros_ec_command *msg);
-- 
2.1.4
