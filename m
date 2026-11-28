Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873911;
	b=Y6X3IZxiLi+TzvIHzm3bNJaRtjnSO796m4fGVE9bDova90E4gDPIQ11jU+BNC807bHUO
	 pfO/SOHJtxze9W5isgxwyb/9K22JRz37TPW8iL+vxjEWmOLiU82BcaC9d615KyJUuj8VP
	 srZFzTDuu4TC14h3hrJRm1kaEqOa5b3LvkcCuMpvoZ77fyZ5Rv+frQl1xv2uiYZdZnHQ7
	 1WJS8o0UVjnDOjCUHDPOMUQVmfTem54nl5NQNwURpJ/NIxOvgY3Ax8E6rJ+RLiwsIv44X
	 HzYL6I2TTdPyjOOmtjE+x+mK894ZKa6KHr2j9cM57ymGjk5ep0P14PdZYIPoiIi90Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873911;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=7A7FKCFXeTQyXQrR2wbRKZ1capbq1+IiSDAaT4F6Pvg=;
	b=pQcjR9A/ntMh4pPBvhyAmAAXlp23AkOflKGe3+BJ1Fx9USwRY5B9H6vup22buQ6b9hv3
	 ZS9spsfzfVAYOpRYa6tM0REG/5DFZpMunBecXN6YOrAxBLNzYDFSEA89KJGQLP7hQN0eJ
	 QZeFKdmB/dCfrYigWhACXbuy720J1iMIiPBjHT+QocgI7e3FXIwuCMPjxvXtW/pcIKUTS
	 utuxVIO5zEXDQVnYldFIpYITLeCrmiY+0tcRb1zj9XGNfHU4zd9qV6WclDchV3LBSPz8k
	 N+B6h13NSpF4TyPbMn8z0xT4UJqR+acxB93YKVglAfzaS5BLY3e5UbwSf2Sa9xljsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=RV9nEUDL;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD1606A32F;
	Sat, 28 Nov 2026 13:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DD1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=RV9nEUDL
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jcBXZ57pfzMktr;
	Sat, 28 Nov 2026 14:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7A7FKCFXeTQyXQrR2wbRKZ1capbq1+IiSDAaT4F6Pvg=;
	b=RV9nEUDLJBSvmFswqvx/1eDWXLgZo5WfdoihwfZBrG17Bpu+i4P+UUjoV6Y142mkt1ZWoC
	qCj9Q+ejr92A2Y7HwL24DXuz49LqDES7oxQ0HG/pujNPs88J/0WIRe8rf4PqYpwR1pwTAw
	3GFHX7UgBewAlPXSO59z1aN2ozf4ysH5F5TrFGFYUuZU85GOEGSgw4gLXgpAysSUWC7xiI
	427qm6/BOwS1K5JUOnx15SVDqBG9ge8it5LFRIQvrdFoEpgH0cKhwPOoPy8oxFRuZdsR1M
	oo1krzoNeTQD80buSv2+2TnnkKX1BiiLb4avxQnVw/udL2tjH66X+/89Rab1bQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:31 +0100
Subject: [PATCH v2 4/7] Input: s6sy761 - add SPI support for S6SY791
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
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-4-1be5c1029087@timmermann.space>
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
X-Rspamd-Queue-Id: 4jcBXZ57pfzMktr

The S6SY791 uses the same commands as the S6SY761, wrapped in an SPI
frame: a sync byte, length fields, the opcode, the payload and an 8-bit
checksum, padded to a multiple of 4 bytes. Reads are a request frame
followed by a reply frame after an opcode-specific delay, taken from
Google's downstream driver.

The reply is clocked out full duplex with zeroed tx data. On gs101
(spi-s3c64xx) a receive-only transfer leaves MOSI undefined, and the
controller then ignores the next command.

Tested on a Google Pixel 6 Pro (raven).

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 drivers/input/touchscreen/Kconfig       |  14 ++-
 drivers/input/touchscreen/Makefile      |   1 +
 drivers/input/touchscreen/s6sy761_spi.c | 171 ++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 76651a61324f..49788ca10d80 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -528,20 +528,26 @@ config TOUCHSCREEN_IPROC
 	  module will be called bcm_iproc_tsc.
 
 config TOUCHSCREEN_S6SY761
-	tristate "Samsung S6SY761 Touchscreen driver"
-	depends on I2C
+	tristate "Samsung S6SY761/S6SY791 Touchscreen driver"
+	depends on I2C || SPI
 	help
-	  Say Y if you have the Samsung S6SY761 driver
+	  Say Y here if you have a Samsung S6SY761 or S6SY791
+	  touchscreen controller connected to your system via I2C or SPI.
 
 	  If unsure, say N
 
 	  To compile this driver as a module, choose M here: the
-	  modules will be called s6sy761_core and s6sy761_i2c.
+	  modules will be called s6sy761_core, s6sy761_i2c and
+	  s6sy761_spi.
 	select TOUCHSCREEN_S6SY761_I2C if I2C
+	select TOUCHSCREEN_S6SY761_SPI if SPI
 
 config TOUCHSCREEN_S6SY761_I2C
 	tristate
 
+config TOUCHSCREEN_S6SY761_SPI
+	tristate
+
 config TOUCHSCREEN_GUNZE
 	tristate "Gunze AHL-51S touchscreen"
 	select SERIO
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 24b8fb1e38d3..b76009f89bec 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_TOUCHSCREEN_PIXCIR)	+= pixcir_i2c_ts.o
 obj-$(CONFIG_TOUCHSCREEN_RM_TS)		+= raydium_i2c_ts.o
 obj-$(CONFIG_TOUCHSCREEN_S6SY761)	+= s6sy761_core.o
 obj-$(CONFIG_TOUCHSCREEN_S6SY761_I2C)	+= s6sy761_i2c.o
+obj-$(CONFIG_TOUCHSCREEN_S6SY761_SPI)	+= s6sy761_spi.o
 obj-$(CONFIG_TOUCHSCREEN_SILEAD)	+= silead.o
 obj-$(CONFIG_TOUCHSCREEN_SIS_I2C)	+= sis_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_ST1232)	+= st1232.o
diff --git a/drivers/input/touchscreen/s6sy761_spi.c b/drivers/input/touchscreen/s6sy761_spi.c
new file mode 100644
index 000000000000..ddb849cd4845
--- /dev/null
+++ b/drivers/input/touchscreen/s6sy761_spi.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+// Samsung S6SY761 SPI Touchscreen device driver
+//
+// Copyright (c) 2026 Lukas Timmermann <foss@timmermann.space>
+
+#include <linux/delay.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/unaligned.h>
+
+#include "s6sy761_core.h"
+
+#define S6SY761_SPI_SYNC_CODE		0xaa
+#define S6SY761_SPI_HEADER_SIZE		5 /* sync, 2 len, 2 reserved */
+#define S6SY761_SPI_CHECKSUM_SIZE	1
+#define S6SY761_SPI_READ_HEADER_SIZE	7 /* sync, 4 len, opcode, status */
+
+/* opcodes that need a longer wait before the reply is ready */
+#define S6SY761_SPI_CMD_FW_INTEGRITY	0x21
+#define S6SY761_SPI_CMD_READ_ALL_EVENT	0x61
+
+static u8 s6sy761_spi_checksum(const u8 *buf, size_t len)
+{
+	u8 sum = 0;
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		sum += buf[i];
+
+	return sum;
+}
+
+static int s6sy761_spi_write(struct device *dev, u8 *xfer_buf,
+			     u8 cmd, size_t length, const void *values)
+{
+	struct spi_device *spi = to_spi_device(dev);
+
+	/* header + opcode + payload + checksum */
+	size_t frame_len = S6SY761_SPI_HEADER_SIZE + 1 + length +
+				S6SY761_SPI_CHECKSUM_SIZE;
+	size_t xfer_len = ALIGN(frame_len, 4);
+
+	if (xfer_len > S6SY761_XFER_BUFFER_SIZE)
+		return -EINVAL;
+
+	xfer_buf[0] = S6SY761_SPI_SYNC_CODE;
+	put_unaligned_be16(length + 1, xfer_buf + 1);
+	xfer_buf[3] = 0;
+	xfer_buf[4] = 0;
+	xfer_buf[5] = cmd;
+
+	if (length)
+		memcpy(xfer_buf + 6, values, length);
+
+	xfer_buf[frame_len - 1] = s6sy761_spi_checksum(xfer_buf, frame_len - 1);
+
+	/* the chip expects transfers in multiples of 4 bytes */
+	memset(xfer_buf + frame_len, 0, xfer_len - frame_len);
+
+	return spi_write(spi, xfer_buf, xfer_len);
+}
+
+static unsigned int s6sy761_spi_read_delay_us(u8 cmd)
+{
+	switch (cmd) {
+	case S6SY761_SPI_CMD_FW_INTEGRITY:
+		return 20000;
+	case S6SY761_SPI_CMD_READ_ALL_EVENT:
+		return 550;
+	default:
+		return 100;
+	}
+}
+
+static int s6sy761_spi_read(struct device *dev, u8 *xfer_buf,
+			    u8 cmd, size_t length, void *values)
+{
+	struct spi_device *spi = to_spi_device(dev);
+	struct spi_transfer reply = { };
+	/* request: header + opcode + checksum, no payload */
+	size_t req_len = S6SY761_SPI_HEADER_SIZE + 1 +
+			 S6SY761_SPI_CHECKSUM_SIZE;
+	/* reply: header + data + checksum */
+	size_t resp_len = S6SY761_SPI_READ_HEADER_SIZE + length +
+			  S6SY761_SPI_CHECKSUM_SIZE;
+	int ret;
+
+	if (ALIGN(resp_len, 4) > S6SY761_XFER_BUFFER_SIZE)
+		return -EINVAL;
+
+	/* tell the chip what to read and how much */
+	xfer_buf[0] = S6SY761_SPI_SYNC_CODE;
+	put_unaligned_be16(1, xfer_buf + 1);		/* write length: opcode */
+	put_unaligned_be16(length, xfer_buf + 3);	/* read length */
+	xfer_buf[5] = cmd;
+	xfer_buf[req_len - 1] = s6sy761_spi_checksum(xfer_buf, req_len - 1);
+	memset(xfer_buf + req_len, 0, ALIGN(req_len, 4) - req_len);
+
+	ret = spi_write(spi, xfer_buf, ALIGN(req_len, 4));
+	if (ret)
+		return ret;
+
+	/* give the chip time to prepare the reply */
+	fsleep(s6sy761_spi_read_delay_us(cmd));
+
+	memset(xfer_buf, 0, ALIGN(resp_len, 4));
+	reply.tx_buf = xfer_buf;
+	reply.rx_buf = xfer_buf;
+	reply.len = ALIGN(resp_len, 4);
+	ret = spi_sync_transfer(spi, &reply, 1);
+	if (ret)
+		return ret;
+
+	if (xfer_buf[0] != S6SY761_SPI_SYNC_CODE ||
+	    xfer_buf[5] != cmd ||
+	    xfer_buf[resp_len - 1] !=
+			s6sy761_spi_checksum(xfer_buf, resp_len - 1))
+		return -EIO;
+
+	memcpy(values, xfer_buf + S6SY761_SPI_READ_HEADER_SIZE, length);
+
+	return 0;
+}
+
+static const struct s6sy761_bus_ops s6sy761_spi_bus_ops = {
+	.bustype = BUS_SPI,
+	.read = s6sy761_spi_read,
+	.write = s6sy761_spi_write,
+};
+
+static int s6sy761_spi_probe(struct spi_device *spi)
+{
+	return s6sy761_probe(&spi->dev, &s6sy761_spi_bus_ops, spi->irq);
+}
+
+static void s6sy761_spi_remove(struct spi_device *spi)
+{
+	s6sy761_remove(&spi->dev);
+}
+
+static const struct of_device_id s6sy761_of_match[] = {
+	{ .compatible = "samsung,s6sy791", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, s6sy761_of_match);
+
+static const struct spi_device_id s6sy761_id[] = {
+	{ "s6sy791" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, s6sy761_id);
+
+static struct spi_driver s6sy761_driver = {
+	.driver = {
+		.name = S6SY761_DEV_NAME,
+		.dev_groups = s6sy761_sysfs_groups,
+		.of_match_table = s6sy761_of_match,
+		.pm = pm_ptr(&s6sy761_pm_ops),
+	},
+	.probe = s6sy761_spi_probe,
+	.remove = s6sy761_spi_remove,
+	.id_table = s6sy761_id,
+};
+
+module_spi_driver(s6sy761_driver);
+
+MODULE_IMPORT_NS("S6SY761");
+MODULE_AUTHOR("Lukas Timmermann <foss@timmermann.space>");
+MODULE_DESCRIPTION("Samsung S6SY791 Touch Screen");
+MODULE_LICENSE("GPL");

-- 
2.56.1

