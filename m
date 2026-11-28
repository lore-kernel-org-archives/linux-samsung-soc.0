Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873909;
	b=cxS6v9ZwUm1XUFgyTU5e0Lek7V2RaRsk/4b0Co+0Xc6MVxk/v+Q8hpxTgPURjI2/CMMJ
	 iUf67Fd7aFkmkoinrMFUvXwnDsgq84EbTlLe9KZ/NynB35C5tEmjZ1Vh5rOupFHGNYOWo
	 bsW07DvT/ukvs8WnJzpkpqPXVl5QPPqKX4hcKTWDSXBA90u6ErAf+Z+WpJ0Hn/Rma3XQn
	 Fr9AotlTDTLqv5wp7nYDqi7ovL7qszwcbUn2DhWuzCFGTn9jou0tLN3e81ONf5vWh7x2l
	 XHVGQ+ovJm6DBue33W/AoUQXlaek5q71cDeKoty+nIDVfvD2OUxrMX+tVxEPzSwCUTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873909;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=2rIdvyag7RMft4z07neHY8CRy2yXCDH9QVUfpJM2tTI=;
	b=LBakEVphU+lNtEqRyGso1gBNumSYqJQ6axq/d6Z3l9pWVPXluJmzHKCSbrGzBt0DQ55Z
	 bg09n6qiHmszim+x8Du9plwM77x00SnpoaSkMpQKWhFsaazZArNtgcdQ6MLPOcmW2sWQt
	 l5q8sJV6S/kSMJxPfWvhUoPvBNV2hkklJMxxz5sHw5HEKYjBWpsMtQZZ/UFwCzri7E0h/
	 hhNpd/aWiug0/l0dCzO9X8WuD18xPmV+bKaoz45ALme/VDHkI6NgwruseBW9NtOLzpw0H
	 Qf8NYt8fGG11fJnn07ds54qUABlRHwzZAV47hsovGO+XS5dMaSYhz6mvTflaqway4Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=wV0HWz0P;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94408606A686;
	Sat, 28 Nov 2026 13:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94408606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=wV0HWz0P
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jcBXX6GqczKmTr;
	Sat, 28 Nov 2026 14:51:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rIdvyag7RMft4z07neHY8CRy2yXCDH9QVUfpJM2tTI=;
	b=wV0HWz0PV9AWDc9G/mbpRvO2DLWtIWykyjyLcsjVBn8VYUNsink5EP9P91/gli0E/y2Uw5
	rfMnx5kZ9mnvPQ5YNnrTraNEiIqLfAskabu+XyI3YQmIV99zf1tEQftJihDYItRv5q0jrr
	tDxrUYofFc95KZYXuyZRcoWh4RVtOGVmRdhv0PKHXY+JNXlRaqMdElbPEK1Y4CyBmC07yB
	ZNkH/cdnGTjBU9mm9BSDEWuYy1R2cvfU0Qs4Xw6wKr4ZZhC3Az4MddSH1avO9ufKLoCVuU
	uTQEnuebEJ96m2aaH9ZSYkxlNCCzNyup63/BtWXaAhwu+SVKyBXBSSy5ZzpgWA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:29 +0100
Subject: [PATCH v2 2/7] Input: s6sy761 - split into core and I2C modules
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-2-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXX6GqczKmTr

Split this driver into a bus-agnostic core and I2C transport part in
preparation for adding SPI support. Also add a mutex because the
driver now has a transfer buffer shared between IRQ, sysfs
and PM threads.

The Kconfig is backwards-compatible and should work on boards with an
S6SY761 touchscreen as before. The I2C transfers of the driver should be
byte by byte identical.

The modules are now called s6sy761_core and s6sy761_i2c.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 drivers/input/touchscreen/Kconfig                  |   8 +-
 drivers/input/touchscreen/Makefile                 |   3 +-
 .../touchscreen/{s6sy761.c => s6sy761_core.c}      | 214 +++++++++------------
 drivers/input/touchscreen/s6sy761_core.h           |  34 ++++
 drivers/input/touchscreen/s6sy761_i2c.c            | 111 +++++++++++
 5 files changed, 244 insertions(+), 126 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 9b9ae8ac3f7f..76651a61324f 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -535,8 +535,12 @@ config TOUCHSCREEN_S6SY761
 
 	  If unsure, say N
 
-	  To compile this driver as module, choose M here: the
-	  module will be called s6sy761.
+	  To compile this driver as a module, choose M here: the
+	  modules will be called s6sy761_core and s6sy761_i2c.
+	select TOUCHSCREEN_S6SY761_I2C if I2C
+
+config TOUCHSCREEN_S6SY761_I2C
+	tristate
 
 config TOUCHSCREEN_GUNZE
 	tristate "Gunze AHL-51S touchscreen"
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index bfd9de83389d..24b8fb1e38d3 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -77,7 +77,8 @@ obj-$(CONFIG_TOUCHSCREEN_USB_COMPOSITE)	+= usbtouchscreen.o
 obj-$(CONFIG_TOUCHSCREEN_PENMOUNT)	+= penmount.o
 obj-$(CONFIG_TOUCHSCREEN_PIXCIR)	+= pixcir_i2c_ts.o
 obj-$(CONFIG_TOUCHSCREEN_RM_TS)		+= raydium_i2c_ts.o
-obj-$(CONFIG_TOUCHSCREEN_S6SY761)	+= s6sy761.o
+obj-$(CONFIG_TOUCHSCREEN_S6SY761)	+= s6sy761_core.o
+obj-$(CONFIG_TOUCHSCREEN_S6SY761_I2C)	+= s6sy761_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_SILEAD)	+= silead.o
 obj-$(CONFIG_TOUCHSCREEN_SIS_I2C)	+= sis_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_ST1232)	+= st1232.o
diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761_core.c
similarity index 71%
rename from drivers/input/touchscreen/s6sy761.c
rename to drivers/input/touchscreen/s6sy761_core.c
index 899c179fb2d3..0e455060dbc0 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761_core.c
@@ -3,18 +3,21 @@
 //
 // Copyright (c) 2017 Samsung Electronics Co., Ltd.
 // Copyright (c) 2017 Andi Shyti <andi@etezian.org>
+// Copyright (c) 2026 Lukas Timmermann <foss@timmermann.space>
 
 #include <linux/unaligned.h>
 #include <linux/delay.h>
-#include <linux/i2c.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include "s6sy761_core.h"
+
 /* commands */
 #define S6SY761_SENSE_ON		0x10
 #define S6SY761_SENSE_OFF		0x11
@@ -84,22 +87,18 @@
 #define S6SY761_APP_FLASH		0x3
 #define S6SY761_APP_SLEEP		0x4
 
-#define S6SY761_EVENT_SIZE		8
-#define S6SY761_EVENT_COUNT		32
 #define S6SY761_DEVID_SIZE		3
 #define S6SY761_PANEL_ID_SIZE		11
 #define S6SY761_TS_STATUS_SIZE		5
 #define S6SY761_MAX_FINGERS		10
 
-#define S6SY761_DEV_NAME	"s6sy761"
-
-enum s6sy761_regulators {
-	S6SY761_REGULATOR_VDD,
-	S6SY761_REGULATOR_AVDD,
-};
-
 struct s6sy761_data {
-	struct i2c_client *client;
+	struct device *dev;
+	const struct s6sy761_bus_ops *bus_ops;
+	u8 *xfer_buf;
+	/* serializes bus access and protects xfer_buf */
+	struct mutex xfer_lock;
+	int irq;
 	struct regulator_bulk_data regulators[2];
 	struct input_dev *input;
 	struct touchscreen_properties prop;
@@ -110,33 +109,21 @@ struct s6sy761_data {
 	u8 tx_channel;
 };
 
-/*
- * We can't simply use i2c_smbus_read_i2c_block_data because we
- * need to read more than 255 bytes
- */
-static int s6sy761_read_events(struct s6sy761_data *sdata, u16 n_events)
-{
-	u8 cmd = S6SY761_READ_ALL_EVENT;
-	struct i2c_msg msgs[2] = {
-		{
-			.addr	= sdata->client->addr,
-			.len	= 1,
-			.buf	= &cmd,
-		},
-		{
-			.addr	= sdata->client->addr,
-			.flags	= I2C_M_RD,
-			.len	= (n_events * S6SY761_EVENT_SIZE),
-			.buf	= sdata->data + S6SY761_EVENT_SIZE,
-		},
-	};
-	int ret;
+enum s6sy761_regulators {
+	S6SY761_REGULATOR_VDD,
+	S6SY761_REGULATOR_AVDD,
+};
 
-	ret = i2c_transfer(sdata->client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret < 0)
-		return ret;
+static int s6sy761_read(struct s6sy761_data *sdata, u8 cmd, size_t len, void *buf)
+{
+	guard(mutex)(&sdata->xfer_lock);
+	return sdata->bus_ops->read(sdata->dev, sdata->xfer_buf, cmd, len, buf);
+}
 
-	return ret == ARRAY_SIZE(msgs) ? 0 : -EIO;
+static int s6sy761_write(struct s6sy761_data *sdata, u8 cmd, size_t len, const void *buf)
+{
+	guard(mutex)(&sdata->xfer_lock);
+	return sdata->bus_ops->write(sdata->dev, sdata->xfer_buf, cmd, len, buf);
 }
 
 static void s6sy761_report_coordinates(struct s6sy761_data *sdata,
@@ -226,12 +213,10 @@ static irqreturn_t s6sy761_irq_handler(int irq, void *dev)
 	int ret;
 	u8 n_events;
 
-	ret = i2c_smbus_read_i2c_block_data(sdata->client,
-					    S6SY761_READ_ONE_EVENT,
-					    S6SY761_EVENT_SIZE,
-					    sdata->data);
+	ret = s6sy761_read(sdata, S6SY761_READ_ONE_EVENT,
+			   S6SY761_EVENT_SIZE, sdata->data);
 	if (ret < 0) {
-		dev_err(&sdata->client->dev, "failed to read events\n");
+		dev_err(sdata->dev, "failed to read events\n");
 		return IRQ_HANDLED;
 	}
 
@@ -243,9 +228,11 @@ static irqreturn_t s6sy761_irq_handler(int irq, void *dev)
 		return IRQ_HANDLED;
 
 	if (n_events) {
-		ret = s6sy761_read_events(sdata, n_events);
+		ret = s6sy761_read(sdata, S6SY761_READ_ALL_EVENT,
+				   n_events * S6SY761_EVENT_SIZE,
+				   sdata->data + S6SY761_EVENT_SIZE);
 		if (ret < 0) {
-			dev_err(&sdata->client->dev, "failed to read events\n");
+			dev_err(sdata->dev, "failed to read events\n");
 			return IRQ_HANDLED;
 		}
 	}
@@ -259,7 +246,7 @@ static int s6sy761_input_open(struct input_dev *dev)
 {
 	struct s6sy761_data *sdata = input_get_drvdata(dev);
 
-	return i2c_smbus_write_byte(sdata->client, S6SY761_SENSE_ON);
+	return s6sy761_write(sdata, S6SY761_SENSE_ON, 0, NULL);
 }
 
 static void s6sy761_input_close(struct input_dev *dev)
@@ -267,9 +254,9 @@ static void s6sy761_input_close(struct input_dev *dev)
 	struct s6sy761_data *sdata = input_get_drvdata(dev);
 	int ret;
 
-	ret = i2c_smbus_write_byte(sdata->client, S6SY761_SENSE_OFF);
+	ret = s6sy761_write(sdata, S6SY761_SENSE_OFF, 0, NULL);
 	if (ret)
-		dev_err(&sdata->client->dev, "failed to turn off sensing\n");
+		dev_err(sdata->dev, "failed to turn off sensing\n");
 }
 
 static ssize_t s6sy761_sysfs_devid(struct device *dev,
@@ -286,12 +273,23 @@ static struct attribute *s6sy761_sysfs_attrs[] = {
 	&dev_attr_devid.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(s6sy761_sysfs);
+
+static const struct attribute_group s6sy761_sysfs_group = {
+	.attrs = s6sy761_sysfs_attrs,
+};
+
+const struct attribute_group *s6sy761_sysfs_groups[] = {
+	&s6sy761_sysfs_group,
+	NULL,
+};
+EXPORT_SYMBOL_NS_GPL(s6sy761_sysfs_groups, "S6SY761");
 
 static int s6sy761_power_on(struct s6sy761_data *sdata)
 {
+	__le16 touch_func;
 	u8 buffer[S6SY761_EVENT_SIZE];
 	u8 event;
+	u8 status;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
@@ -302,10 +300,7 @@ static int s6sy761_power_on(struct s6sy761_data *sdata)
 	msleep(140);
 
 	/* double check whether the touch is functional */
-	ret = i2c_smbus_read_i2c_block_data(sdata->client,
-					    S6SY761_READ_ONE_EVENT,
-					    S6SY761_EVENT_SIZE,
-					    buffer);
+	ret = s6sy761_read(sdata, S6SY761_READ_ONE_EVENT, S6SY761_EVENT_SIZE, buffer);
 	if (ret < 0)
 		return ret;
 
@@ -317,18 +312,17 @@ static int s6sy761_power_on(struct s6sy761_data *sdata)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_byte_data(sdata->client, S6SY761_BOOT_STATUS);
+	ret = s6sy761_read(sdata, S6SY761_BOOT_STATUS, 1, &status);
 	if (ret < 0)
 		return ret;
 
 	/* for some reasons the device might be stuck in the bootloader */
-	if (ret != S6SY761_BS_APPLICATION)
+	if (status != S6SY761_BS_APPLICATION)
 		return -ENODEV;
 
 	/* enable touch functionality */
-	ret = i2c_smbus_write_word_data(sdata->client,
-					S6SY761_TOUCH_FUNCTION,
-					S6SY761_MASK_TOUCH);
+	touch_func = cpu_to_le16(S6SY761_MASK_TOUCH);
+	ret = s6sy761_write(sdata, S6SY761_TOUCH_FUNCTION, sizeof(touch_func), &touch_func);
 	if (ret)
 		return ret;
 
@@ -339,25 +333,20 @@ static int s6sy761_hw_init(struct s6sy761_data *sdata,
 			   unsigned int *max_x, unsigned int *max_y)
 {
 	u8 buffer[S6SY761_PANEL_ID_SIZE]; /* larger read size */
+	u8 integrity;
 	int ret;
 
 	ret = s6sy761_power_on(sdata);
 	if (ret)
 		return ret;
 
-	ret = i2c_smbus_read_i2c_block_data(sdata->client,
-					    S6SY761_DEVICE_ID,
-					    S6SY761_DEVID_SIZE,
-					    buffer);
+	ret = s6sy761_read(sdata, S6SY761_DEVICE_ID, S6SY761_DEVID_SIZE, buffer);
 	if (ret < 0)
 		return ret;
 
 	sdata->devid = get_unaligned_be16(buffer + 1);
 
-	ret = i2c_smbus_read_i2c_block_data(sdata->client,
-					    S6SY761_PANEL_INFO,
-					    S6SY761_PANEL_ID_SIZE,
-					    buffer);
+	ret = s6sy761_read(sdata, S6SY761_PANEL_INFO, S6SY761_PANEL_ID_SIZE, buffer);
 	if (ret < 0)
 		return ret;
 
@@ -367,11 +356,10 @@ static int s6sy761_hw_init(struct s6sy761_data *sdata,
 	/* if no tx channels defined, at least keep one */
 	sdata->tx_channel = max_t(u8, buffer[8], 1);
 
-	ret = i2c_smbus_read_byte_data(sdata->client,
-				       S6SY761_FIRMWARE_INTEGRITY);
+	ret = s6sy761_read(sdata, S6SY761_FIRMWARE_INTEGRITY, 1, &integrity);
 	if (ret < 0)
 		return ret;
-	else if (ret != S6SY761_FW_OK)
+	else if (integrity != S6SY761_FW_OK)
 		return -ENODEV;
 
 	return 0;
@@ -381,38 +369,44 @@ static void s6sy761_power_off(void *data)
 {
 	struct s6sy761_data *sdata = data;
 
-	disable_irq(sdata->client->irq);
+	disable_irq(sdata->irq);
 	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
 						sdata->regulators);
 }
 
-static int s6sy761_probe(struct i2c_client *client)
+int s6sy761_probe(struct device *dev, const struct s6sy761_bus_ops *bus_ops, int irq)
 {
 	struct s6sy761_data *sdata;
 	unsigned int max_x, max_y;
 	int err;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
-						I2C_FUNC_SMBUS_BYTE_DATA |
-						I2C_FUNC_SMBUS_I2C_BLOCK))
-		return -ENODEV;
-
-	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
+	sdata = devm_kzalloc(dev, sizeof(*sdata), GFP_KERNEL);
 	if (!sdata)
 		return -ENOMEM;
 
-	i2c_set_clientdata(client, sdata);
-	sdata->client = client;
+	sdata->xfer_buf = devm_kzalloc(dev, S6SY761_XFER_BUFFER_SIZE, GFP_KERNEL);
+	if (!sdata->xfer_buf)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, sdata);
+
+	sdata->bus_ops = bus_ops;
+	sdata->dev = dev;
+	sdata->irq = irq;
+
+	err = devm_mutex_init(dev, &sdata->xfer_lock);
+	if (err)
+		return err;
 
 	sdata->regulators[S6SY761_REGULATOR_VDD].supply = "vdd";
 	sdata->regulators[S6SY761_REGULATOR_AVDD].supply = "avdd";
-	err = devm_regulator_bulk_get(&client->dev,
+	err = devm_regulator_bulk_get(dev,
 				      ARRAY_SIZE(sdata->regulators),
 				      sdata->regulators);
 	if (err)
 		return err;
 
-	err = devm_add_action_or_reset(&client->dev, s6sy761_power_off, sdata);
+	err = devm_add_action_or_reset(dev, s6sy761_power_off, sdata);
 	if (err)
 		return err;
 
@@ -420,12 +414,12 @@ static int s6sy761_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	sdata->input = devm_input_allocate_device(&client->dev);
+	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;
 
 	sdata->input->name = S6SY761_DEV_NAME;
-	sdata->input->id.bustype = BUS_I2C;
+	sdata->input->id.bustype = bus_ops->bustype;
 	sdata->input->open = s6sy761_input_open;
 	sdata->input->close = s6sy761_input_close;
 
@@ -441,7 +435,7 @@ static int s6sy761_probe(struct i2c_client *client)
 
 	if (!input_abs_get_max(sdata->input, ABS_X) ||
 	    !input_abs_get_max(sdata->input, ABS_Y)) {
-		dev_warn(&client->dev, "the axis have not been set\n");
+		dev_warn(dev, "the axis have not been set\n");
 	}
 
 	err = input_mt_init_slots(sdata->input, sdata->tx_channel,
@@ -455,37 +449,39 @@ static int s6sy761_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+	err = devm_request_threaded_irq(dev, sdata->irq, NULL,
 					s6sy761_irq_handler,
 					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 					"s6sy761_irq", sdata);
 	if (err)
 		return err;
 
-	pm_runtime_enable(&client->dev);
+	pm_runtime_enable(dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(s6sy761_probe, "S6SY761");
 
-static void s6sy761_remove(struct i2c_client *client)
+void s6sy761_remove(struct device *dev)
 {
-	pm_runtime_disable(&client->dev);
+	pm_runtime_disable(dev);
 }
+EXPORT_SYMBOL_NS_GPL(s6sy761_remove, "S6SY761");
 
 static int s6sy761_runtime_suspend(struct device *dev)
 {
 	struct s6sy761_data *sdata = dev_get_drvdata(dev);
+	u8 mode = S6SY761_APP_SLEEP;
 
-	return i2c_smbus_write_byte_data(sdata->client,
-				S6SY761_APPLICATION_MODE, S6SY761_APP_SLEEP);
+	return s6sy761_write(sdata, S6SY761_APPLICATION_MODE, 1, &mode);
 }
 
 static int s6sy761_runtime_resume(struct device *dev)
 {
 	struct s6sy761_data *sdata = dev_get_drvdata(dev);
+	u8 mode = S6SY761_APP_NORMAL;
 
-	return i2c_smbus_write_byte_data(sdata->client,
-				S6SY761_APPLICATION_MODE, S6SY761_APP_NORMAL);
+	return s6sy761_write(sdata, S6SY761_APPLICATION_MODE, 1, &mode);
 }
 
 static int s6sy761_suspend(struct device *dev)
@@ -506,51 +502,23 @@ static int s6sy761_resume(struct device *dev)
 	if (err)
 		return err;
 
-	enable_irq(sdata->client->irq);
+	enable_irq(sdata->irq);
 
 	guard(mutex)(&sdata->input->mutex);
 
 	if (!input_device_enabled(sdata->input))
 		return 0;
 
-	err = i2c_smbus_write_byte(sdata->client, S6SY761_SENSE_ON);
+	err = s6sy761_write(sdata, S6SY761_SENSE_ON, 0, NULL);
 
 	return err;
 }
 
-static const struct dev_pm_ops s6sy761_pm_ops = {
+EXPORT_NS_GPL_DEV_PM_OPS(s6sy761_pm_ops, S6SY761) = {
 	SYSTEM_SLEEP_PM_OPS(s6sy761_suspend, s6sy761_resume)
 	RUNTIME_PM_OPS(s6sy761_runtime_suspend, s6sy761_runtime_resume, NULL)
 };
 
-#ifdef CONFIG_OF
-static const struct of_device_id s6sy761_of_match[] = {
-	{ .compatible = "samsung,s6sy761", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, s6sy761_of_match);
-#endif
-
-static const struct i2c_device_id s6sy761_id[] = {
-	{ .name = "s6sy761" },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, s6sy761_id);
-
-static struct i2c_driver s6sy761_driver = {
-	.driver = {
-		.name = S6SY761_DEV_NAME,
-		.dev_groups = s6sy761_sysfs_groups,
-		.of_match_table = of_match_ptr(s6sy761_of_match),
-		.pm = pm_ptr(&s6sy761_pm_ops),
-	},
-	.probe = s6sy761_probe,
-	.remove = s6sy761_remove,
-	.id_table = s6sy761_id,
-};
-
-module_i2c_driver(s6sy761_driver);
-
 MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
-MODULE_DESCRIPTION("Samsung S6SY761 Touch Screen");
-MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Samsung S6SY761 Touch Screen core");
+MODULE_LICENSE("GPL");
diff --git a/drivers/input/touchscreen/s6sy761_core.h b/drivers/input/touchscreen/s6sy761_core.h
new file mode 100644
index 000000000000..059cd5a36a34
--- /dev/null
+++ b/drivers/input/touchscreen/s6sy761_core.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _S6SY761_H
+#define _S6SY761_H
+
+#include <linux/align.h>
+#include <linux/types.h>
+
+#define S6SY761_EVENT_SIZE			8
+#define S6SY761_EVENT_COUNT			32
+/* largest SPI read: reply header + all events + checksum */
+#define S6SY761_XFER_BUFFER_SIZE	ALIGN(7 + S6SY761_EVENT_SIZE * S6SY761_EVENT_COUNT + 1, 4)
+
+#define S6SY761_DEV_NAME	"s6sy761"
+
+struct device;
+struct dev_pm_ops;
+struct attribute_group;
+
+struct s6sy761_bus_ops {
+	u16 bustype;
+	int (*write)(struct device *dev, u8 *xfer_buf,
+		     u8 cmd, size_t length, const void *values);
+	int (*read)(struct device *dev, u8 *xfer_buf,
+		    u8 cmd, size_t length, void *values);
+};
+
+extern const struct dev_pm_ops s6sy761_pm_ops;
+
+extern const struct attribute_group *s6sy761_sysfs_groups[];
+
+int s6sy761_probe(struct device *dev, const struct s6sy761_bus_ops *bus_ops, int irq);
+void s6sy761_remove(struct device *dev);
+
+#endif
diff --git a/drivers/input/touchscreen/s6sy761_i2c.c b/drivers/input/touchscreen/s6sy761_i2c.c
new file mode 100644
index 000000000000..bdebd6908cbf
--- /dev/null
+++ b/drivers/input/touchscreen/s6sy761_i2c.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+// Samsung S6SY761 I2C Touchscreen device driver
+//
+// Copyright (c) 2017 Samsung Electronics Co., Ltd.
+// Copyright (c) 2017 Andi Shyti <andi@etezian.org>
+// Copyright (c) 2026 Lukas Timmermann <foss@timmermann.space>
+
+#include <linux/input.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+
+#include "s6sy761_core.h"
+
+static int s6sy761_i2c_write(struct device *dev, u8 *xfer_buf,
+			     u8 cmd, size_t length, const void *values)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	if (length + 1 > S6SY761_XFER_BUFFER_SIZE)
+		return -EINVAL;
+
+	xfer_buf[0] = cmd;
+
+	if (length)
+		memcpy(xfer_buf + 1, values, length);
+
+	ret = i2c_master_send(client, xfer_buf, length + 1);
+	if (ret < 0)
+		return ret;
+	if (ret != length + 1)
+		return -EIO;
+
+	return 0;
+}
+
+static int s6sy761_i2c_read(struct device *dev, u8 *xfer_buf,
+			    u8 cmd, size_t length, void *values)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_msg msgs[2] = {
+		{
+			.addr	= client->addr,
+			.len	= 1,
+			.buf	= &cmd,
+		},
+		{
+			.addr	= client->addr,
+			.flags	= I2C_M_RD,
+			.len	= length,
+			.buf	= values,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret < 0)
+		return ret;
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : -EIO;
+}
+
+static const struct s6sy761_bus_ops s6sy761_i2c_bus_ops = {
+	.bustype = BUS_I2C,
+	.read = s6sy761_i2c_read,
+	.write = s6sy761_i2c_write,
+};
+
+static int s6sy761_i2c_probe(struct i2c_client *client)
+{
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	return s6sy761_probe(&client->dev, &s6sy761_i2c_bus_ops, client->irq);
+}
+
+static void s6sy761_i2c_remove(struct i2c_client *client)
+{
+	s6sy761_remove(&client->dev);
+}
+
+static const struct of_device_id s6sy761_of_match[] = {
+	{ .compatible = "samsung,s6sy761", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, s6sy761_of_match);
+
+static const struct i2c_device_id s6sy761_id[] = {
+	{ .name = "s6sy761" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, s6sy761_id);
+
+static struct i2c_driver s6sy761_driver = {
+	.driver = {
+		.name = S6SY761_DEV_NAME,
+		.dev_groups = s6sy761_sysfs_groups,
+		.of_match_table = s6sy761_of_match,
+		.pm = pm_ptr(&s6sy761_pm_ops),
+	},
+	.probe = s6sy761_i2c_probe,
+	.remove = s6sy761_i2c_remove,
+	.id_table = s6sy761_id,
+};
+
+module_i2c_driver(s6sy761_driver);
+
+MODULE_IMPORT_NS("S6SY761");
+MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
+MODULE_DESCRIPTION("Samsung S6SY761 Touch Screen");
+MODULE_LICENSE("GPL");

-- 
2.56.1

