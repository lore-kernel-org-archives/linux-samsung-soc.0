Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1F19995A;
	Thu, 12 Dec 2024 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734037763; cv=none; b=IUEbrz8Jy4TfgMSb/i3R2Ht6tIhU5zJmm4y7hiTwhgVcNg0qJmV1gG6Q3mk6ZPFVqxRYnR0q9rtFiAyxwi6qQJNx6cE1AHViM+iKYjQp9pdk/1+Mp0+RcnW9qmo20mzeBXSTiY6Oeb5wD0TWRib1oKtM3r7Kq3y+gEAN3+adw1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734037763; c=relaxed/simple;
	bh=QfyrnTKILMbUFdNwbJQymTtew7cB9NvJzYHeI/IYL2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=No9ecy6C4D8JL/g3pkE/HypVEiGJenhd/bIxVPSH8UDZfrZSNokpWzzqkoZdD/5vWH2yW7qdwyGVjN0+/UprBV6iVu5GtHRK6YnwwEbM9NFfEZWHXEBprnPUV9tY4z8OYDrB0JKNOyorf1aqWsQPEGzVvjjhJUTRQpxyWmCETm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOyBzUSj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOyBzUSj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so1814982a12.1;
        Thu, 12 Dec 2024 13:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734037759; x=1734642559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgIxvdOsMnKX9k+scEpB6Bgeim7EgN0VncA3hBDvj2U=;
        b=aOyBzUSj81MF955+jSX+Hvq3KQ2FH3jO2r8lbNoaAozol4ZdXTvDLZyOKIIHGFTyfy
         rXRhDwx3yaTxedHKhT4yyETmg8pHlZqooG/rFi/7mLZUzxEL2OKOS8l8ofAOWncGy219
         IVrhxZATIxhC1AuhQOIsDk50SyPCoqmdgTrUfvH0dNpDmjLRgpjY6X9qNLuuc44CCN+Y
         rEx7O0RPYynWp/fNpIgyWgfD9yePsFL5nvJuBzt4jm1zKHFb6lbBoCEmT1YQI8l/m4Jf
         oG8vLjBFXiN77DHigh67V14f25Fv3ZbWXHvKvMGhGNBhUhpzvbB4S42WEDRo55PKhepV
         4AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037759; x=1734642559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgIxvdOsMnKX9k+scEpB6Bgeim7EgN0VncA3hBDvj2U=;
        b=SlSI7OTHXvtoYvzIqFYBd4LTGN9hFLTDUzWJFQvSKRwiOGDC58Yj+/DBp5Rl1e6c4P
         EusD7wdhhjv9oSjT0a51xHkLV2iJMYqrvHabO/5ZieCfG2F1WD2qmoW4mgIGAIwQq7CV
         1hZ38irekiYVjCvggNRLbqMx4UGoxyIwJDzw68sYWiNp9AiQwP7FtlEtKmliGVeAsznC
         NO58RAIa4DALZknOJlUu63rv45VHMMQxwPhpd8oUh37DGld1n0/xajuP94a6xbRpe1pd
         JW+JmNMmQmI8TfKL8zPLcRgba2OsPIgvR0xjk+OnNSFXQ+d+T4lOu63MazfArQCn13he
         1cvg==
X-Forwarded-Encrypted: i=1; AJvYcCUypc7p8vNOwwWsw6GnYExsm1zUX4MpzGpB2Z2vQWe6SPiEC+DfQWn/9AwmIDacKwRuSPIEYyXeCTXT@vger.kernel.org, AJvYcCWR+qL4pkvYjJKfTqp/FRwS6lSdq1IGM6zGHjEia0fcJIgZYWjdUOLb4WrZnTMSQHL+zDz3S3y8Llp2yuIT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ep3WTQq21J9pHknoVuLxIDV3dt35FyvYhQMCdfGsKfNOBe3m
	aSJRU1eSGlrAEpLvM2DnCfDTU+n7hvCuGnC6asQopKMGkyIQgKntrzgR/QbY
X-Gm-Gg: ASbGncvovDycefg+cfKBMuiouuSGYd6eM7v672cKIGT4KfauzMVE3oh0vQ1p1vX1RLz
	5xd6o3vu3qzVvLdG/myGx9TrQXENjzX4TuXVkkahgtsdimPzZFMn1m4ieDUCNYlA3lRXMAEJH4j
	KGwjv0m9+5XxyPp/iYJpVIiKohRAYIFFc9cLhFh15x/pHjQtMO53HVK2Wzp7V8rJlsXofjXosTM
	KWBbM/r5gGPGPMW/gcP5Qf/dS414R2gALttOUFETOJ8ZUaj2v8sQdO3egzgrmz7PAL4
X-Google-Smtp-Source: AGHT+IE12N0Ng+HjgXtLiF39tC//8gVPB0GifXeSoFX7MgfHyn0ze9DeSIt1tWfnGtytJGJyx7V1Iw==
X-Received: by 2002:a05:6402:2389:b0:5d6:37ec:60cf with SMTP id 4fb4d7f45d1cf-5d637ec6204mr970555a12.27.1734037758779;
        Thu, 12 Dec 2024 13:09:18 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d0f93d54sm9232348a12.68.2024.12.12.13.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:09:18 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 12 Dec 2024 23:09:02 +0200
Subject: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
In-Reply-To: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734037753; l=17342;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=QfyrnTKILMbUFdNwbJQymTtew7cB9NvJzYHeI/IYL2Q=;
 b=Pz56xXjCyDZ82J93Hde4L+wHHkW7ddYg0eJyTEwYrxXPWrSITFe7thviNVzureL2vWI0Jj9E5
 c73ZP82jUOfCiB2OeyhQipCt6hr0a7hbBFtRpkzO2Vry2CZhVPsIWEv
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add a driver for Samsung SPEEDY serial bus host controller.
SPEEDY is a proprietary 1 wire serial bus used by Samsung
in various devices (usually mobile), like Samsung Galaxy
phones. It is usually used for connecting PMIC or various
other peripherals, like audio codecs or RF components.

This bus can address at most 1MiB (4 bit device address,
8 bit registers per device, 8 bit wide registers:
256*256*16 = 1MiB of address space.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/Kconfig               |  13 +
 drivers/soc/samsung/Makefile              |   2 +
 drivers/soc/samsung/exynos-speedy.c       | 457 ++++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-speedy.h |  56 ++++
 4 files changed, 528 insertions(+)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 1a5dfdc978dc4069eb71c4e8eada7ff1913b86b3..a38150fc9999ded1e1e93e2a9ef43b88175d34bd 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -49,6 +49,19 @@ config EXYNOS_PMU_ARM_DRIVERS
 	bool "Exynos PMU ARMv7-specific driver extensions" if COMPILE_TEST
 	depends on EXYNOS_PMU
 
+config EXYNOS_SPEEDY
+	tristate "Exynos SPEEDY host controller driver"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on OF
+	depends on REGMAP_MMIO
+	help
+	  Enable support for Exynos SPEEDY host controller block.
+	  SPEEDY is a 1 wire proprietary Samsung serial bus, found in
+	  modern Samsung Exynos SoCs, like Exynos8895 and newer.
+
+	  Select this if you have a Samsung Exynos device which uses
+	  SPEEDY bus.
+
 config SAMSUNG_PM_CHECK
 	bool "S3C2410 PM Suspend Memory CRC"
 	depends on PM && (ARCH_S3C64XX || ARCH_S5PV210)
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 248a33d7754af1a1e5fbbbb79413eb300bbbc8e5..9fe824075be77dbcd22c5f1477c4b34029016ed2 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -12,4 +12,6 @@ obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
 					exynos5250-pmu.o exynos5420-pmu.o
 obj-$(CONFIG_EXYNOS_REGULATOR_COUPLER) += exynos-regulator-coupler.o
 
+obj-$(CONFIG_EXYNOS_SPEEDY)	+= exynos-speedy.o
+
 obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= s3c-pm-check.o
diff --git a/drivers/soc/samsung/exynos-speedy.c b/drivers/soc/samsung/exynos-speedy.c
new file mode 100644
index 0000000000000000000000000000000000000000..e897b67c80edacee485169ea6dc1ffe0cefdd21f
--- /dev/null
+++ b/drivers/soc/samsung/exynos-speedy.c
@@ -0,0 +1,457 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * exynos-speedy.c - Samsung Exynos SPEEDY Host Controller Driver
+ *
+ * Copyright 2024, Markuss Broks <markuss.broks@gmail.com>
+ * Copyright 2024, Maksym Holovach <nergzd@nergzd723.xyz>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <linux/soc/samsung/exynos-speedy.h>
+
+/* Speedy MMIO register map */
+#define SPEEDY_CTRL					0x000
+#define SPEEDY_FIFO_CTRL				0x004
+#define SPEEDY_CMD					0x008
+#define SPEEDY_INT_ENABLE				0x00C
+#define SPEEDY_INT_STATUS				0x010
+#define SPEEDY_FIFO_STATUS				0x030
+#define SPEEDY_TX_DATA					0x034
+#define SPEEDY_RX_DATA					0x038
+#define SPEEDY_PACKET_GAP_TIME				0x044
+#define SPEEDY_TIMEOUT_COUNT				0x048
+#define SPEEDY_FIFO_DEBUG				0x100
+#define SPEEDY_CTRL_STATUS				0x104
+
+/* SPEEDY_CTRL register bits */
+#define SPEEDY_ENABLE					(1 << 0)
+#define SPEEDY_TIMEOUT_CMD_DISABLE			(1 << 1)
+#define SPEEDY_TIMEOUT_STANDBY_DISABLE			(1 << 2)
+#define SPEEDY_TIMEOUT_DATA_DISABLE			(1 << 3)
+#define SPEEDY_ALWAYS_PULLUP_EN				(1 << 7)
+#define SPEEDY_DATA_WIDTH_8BIT				(0 << 8)
+#define SPEEDY_REMOTE_RESET_REQ				(1 << 30)
+#define SPEEDY_SW_RST					(1 << 31)
+
+/* SPEEDY_FIFO_CTRL register bits */
+#define SPEEDY_RX_TRIGGER_LEVEL(x)			((x) << 0)
+#define SPEEDY_TX_TRIGGER_LEVEL(x)			((x) << 8)
+#define SPEEDY_FIFO_RESET				(1 << 31)
+
+/* SPEEDY_CMD register bits */
+#define SPEEDY_BURST_LENGTH(x)				((x) << 0)
+#define SPEEDY_BURST_FIXED				(0 << 5)
+#define SPEEDY_BURST_INCR				(1 << 5)
+#define SPEEDY_BURST_EXTENSION				(2 << 5)
+#define SPEEDY_ACCESS_BURST				(0 << 19)
+#define SPEEDY_ACCESS_RANDOM				(1 << 19)
+#define SPEEDY_DIRECTION_READ				(0 << 20)
+#define SPEEDY_DIRECTION_WRITE				(1 << 20)
+
+/* SPEEDY_INT_ENABLE register bits */
+#define SPEEDY_TRANSFER_DONE_EN				(1 << 0)
+#define SPEEDY_TIMEOUT_CMD_EN				(1 << 1)
+#define SPEEDY_TIMEOUT_STANDBY_EN			(1 << 2)
+#define SPEEDY_TIMEOUT_DATA_EN				(1 << 3)
+#define SPEEDY_FIFO_TX_ALMOST_EMPTY_EN			(1 << 4)
+#define SPEEDY_FIFO_RX_ALMOST_FULL_EN			(1 << 8)
+#define SPEEDY_RX_FIFO_INT_TRAILER_EN			(1 << 9)
+#define SPEEDY_RX_MODEBIT_ERR_EN			(1 << 16)
+#define SPEEDY_RX_GLITCH_ERR_EN				(1 << 17)
+#define SPEEDY_RX_ENDBIT_ERR_EN				(1 << 18)
+#define SPEEDY_TX_LINE_BUSY_ERR_EN			(1 << 20)
+#define SPEEDY_TX_STOPBIT_ERR_EN			(1 << 21)
+#define SPEEDY_REMOTE_RESET_REQ_EN			(1 << 31)
+
+/* SPEEDY_INT_STATUS register bits */
+#define SPEEDY_TRANSFER_DONE				(1 << 0)
+#define SPEEDY_TIMEOUT_CMD				(1 << 1)
+#define SPEEDY_TIMEOUT_STANDBY				(1 << 2)
+#define SPEEDY_TIMEOUT_DATA				(1 << 3)
+#define SPEEDY_FIFO_TX_ALMOST_EMPTY			(1 << 4)
+#define SPEEDY_FIFO_RX_ALMOST_FULL			(1 << 8)
+#define SPEEDY_RX_FIFO_INT_TRAILER			(1 << 9)
+#define SPEEDY_RX_MODEBIT_ERR				(1 << 16)
+#define SPEEDY_RX_GLITCH_ERR				(1 << 17)
+#define SPEEDY_RX_ENDBIT_ERR				(1 << 18)
+#define SPEEDY_TX_LINE_BUSY_ERR				(1 << 20)
+#define SPEEDY_TX_STOPBIT_ERR				(1 << 21)
+#define SPEEDY_REMOTE_RESET_REQ_STAT			(1 << 31)
+
+/* SPEEDY_FIFO_STATUS register bits */
+#define SPEEDY_VALID_DATA_CNT				(0 << 0)
+#define SPEEDY_FIFO_FULL				(1 << 5)
+#define SPEEDY_FIFO_EMPTY				(1 << 6)
+
+/* SPEEDY_PACKET_GAP_TIME register bits */
+#define SPEEDY_FIFO_TX_ALMOST_EMPTY			(1 << 4)
+#define SPEEDY_FIFO_RX_ALMOST_FULL			(1 << 8)
+#define SPEEDY_FSM_INIT					(1 << 1)
+#define SPEEDY_FSM_TX_CMD				(1 << 2)
+#define SPEEDY_FSM_STANDBY				(1 << 3)
+#define SPEEDY_FSM_DATA					(1 << 4)
+#define SPEEDY_FSM_TIMEOUT				(1 << 5)
+#define SPEEDY_FSM_TRANS_DONE				(1 << 6)
+#define SPEEDY_FSM_IO_RX_STAT_MASK			(3 << 7)
+#define SPEEDY_FSM_IO_TX_IDLE				(1 << 9)
+#define SPEEDY_FSM_IO_TX_GET_PACKET			(1 << 10)
+#define SPEEDY_FSM_IO_TX_PACKET				(1 << 11)
+#define SPEEDY_FSM_IO_TX_DONE				(1 << 12)
+
+#define SPEEDY_RX_LENGTH(n)				((n) << 0)
+#define SPEEDY_TX_LENGTH(n)				((n) << 8)
+
+#define SPEEDY_DEVICE(x)				((x & 0xf) << 15)
+#define SPEEDY_ADDRESS(x)				((x & 0xff) << 7)
+
+static const struct of_device_id speedy_match[] = {
+	{ .compatible = "samsung,exynos9810-speedy" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, speedy_match);
+
+static const struct regmap_config speedy_map_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+};
+
+/**
+ * speedy_int_clear() - clear interrupt status
+ * @speedy:	pointer to speedy controller struct
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+static int speedy_int_clear(struct speedy_controller *speedy)
+{
+	int ret;
+
+	ret = regmap_set_bits(speedy->map, SPEEDY_INT_STATUS, 0xffffffff);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+/**
+ * speedy_fifo_reset() - reset FIFO of the controller
+ * @speedy:	pointer to speedy controller struct
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+static int speedy_fifo_reset(struct speedy_controller *speedy)
+{
+	int ret;
+
+	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL, SPEEDY_FIFO_RESET);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+/**
+ * _speedy_read() - internal speedy read operation
+ * @speedy:	pointer to speedy controller struct
+ * @reg:	address of device on the bus
+ * @addr:       address to read
+ * @val:        pointer to store result
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+static int _speedy_read(struct speedy_controller *speedy, u32 reg, u32 addr, u32 *val)
+{
+	int ret;
+	u32 cmd, int_ctl, int_status;
+
+	mutex_lock(&speedy->io_lock);
+
+	ret = speedy_fifo_reset(speedy);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
+			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
+	if (ret)
+		return ret;
+
+	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
+	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
+
+	int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
+		  SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
+		  SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
+		  SPEEDY_REMOTE_RESET_REQ_EN;
+
+	ret = speedy_int_clear(speedy);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
+	if (ret)
+		return ret;
+
+	/* Wait for xfer done */
+	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
+				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
+	if (ret)
+		return ret;
+
+	ret = speedy_int_clear(speedy);
+
+	mutex_unlock(&speedy->io_lock);
+
+	return ret;
+}
+
+int exynos_speedy_read(const struct speedy_device *device, u32 addr, u32 *val)
+{
+	return _speedy_read(device->speedy, device->reg, addr, val);
+}
+EXPORT_SYMBOL_GPL(exynos_speedy_read);
+
+/**
+ * _speedy_write() - internal speedy write operation
+ * @speedy:	pointer to speedy controller struct
+ * @reg:	address of device on the bus
+ * @addr:       address to write
+ * @val:        value to write
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+static int _speedy_write(struct speedy_controller *speedy, u32 reg, u32 addr, u32 val)
+{
+	int ret;
+	u32 cmd, int_ctl, int_status;
+
+	mutex_lock(&speedy->io_lock);
+
+	ret = speedy_fifo_reset(speedy);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
+			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
+	if (ret)
+		return ret;
+
+	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_WRITE |
+	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
+
+	int_ctl = (SPEEDY_TRANSFER_DONE_EN |
+		   SPEEDY_FIFO_TX_ALMOST_EMPTY_EN |
+		   SPEEDY_TX_LINE_BUSY_ERR_EN |
+		   SPEEDY_TX_STOPBIT_ERR_EN |
+		   SPEEDY_REMOTE_RESET_REQ_EN);
+
+	ret = speedy_int_clear(speedy);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(speedy->map, SPEEDY_TX_DATA, val);
+	if (ret)
+		return ret;
+
+	/* Wait for xfer done */
+	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
+				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
+	if (ret)
+		return ret;
+
+	speedy_int_clear(speedy);
+
+	mutex_unlock(&speedy->io_lock);
+
+	return 0;
+}
+
+int exynos_speedy_write(const struct speedy_device *device, u32 addr, u32 val)
+{
+	return _speedy_write(device->speedy, device->reg, addr, val);
+}
+EXPORT_SYMBOL_GPL(exynos_speedy_write);
+
+static void devm_speedy_release(struct device *dev, void *res)
+{
+	const struct speedy_device **ptr = res;
+	const struct speedy_device *handle = *ptr;
+
+	kfree(handle);
+}
+
+/**
+ * speedy_get_by_phandle() - internal get speedy device handle
+ * @np:	pointer to OF device node of device
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+static const struct speedy_device *speedy_get_device(struct device_node *np)
+{
+	const struct of_device_id *speedy_id;
+	struct device_node *speedy_np;
+	struct platform_device *speedy_pdev;
+	struct speedy_controller *speedy = NULL;
+	struct speedy_device *handle;
+	int ret;
+
+	if (!np) {
+		pr_err("I need a device pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	speedy_np = of_get_parent(np);
+	if (!speedy_np)
+		return ERR_PTR(-ENODEV);
+
+	/* Verify if parent node is a speedy controller */
+	speedy_id = of_match_node(speedy_match, speedy_np);
+	if (!speedy_id) {
+		handle = ERR_PTR(-EINVAL);
+		goto out;
+	}
+
+	/* Get platform device of the speedy controller */
+	speedy_pdev = of_find_device_by_node(speedy_np);
+	if (!speedy_pdev) {
+		handle = ERR_PTR(-EPROBE_DEFER);
+		goto out;
+	}
+
+	/* Get drvdata of speedy controller */
+	speedy = platform_get_drvdata(speedy_pdev);
+	if (!speedy) {
+		handle = ERR_PTR(-EINVAL);
+		goto out;
+	}
+
+	handle = kzalloc(sizeof(struct speedy_device), GFP_KERNEL);
+	if (!handle) {
+		handle = ERR_PTR(-ENOMEM);
+		goto out;
+	}
+	handle->speedy = speedy;
+	ret = of_property_read_u32(np, "reg", &handle->reg);
+	if (ret) {
+		kfree(handle);
+		handle = ERR_PTR(-EINVAL);
+		goto out;
+	}
+
+out:
+	of_node_put(speedy_np);
+	return handle;
+}
+
+const struct speedy_device *devm_speedy_get_device(struct device *dev)
+{
+	const struct speedy_device *handle;
+	const struct speedy_device **ptr;
+
+	ptr = devres_alloc(devm_speedy_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	handle = speedy_get_device(dev_of_node(dev));
+	if (!IS_ERR(handle)) {
+		*ptr = handle;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_speedy_get_device);
+
+static int speedy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct speedy_controller *speedy;
+	void __iomem *mem;
+	int ret;
+
+	speedy = devm_kzalloc(dev, sizeof(struct speedy_controller), GFP_KERNEL);
+	if (!speedy)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, speedy);
+	speedy->pdev = pdev;
+
+	mutex_init(&speedy->io_lock);
+
+	mem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mem))
+		return dev_err_probe(dev, PTR_ERR(mem), "Failed to ioremap memory\n");
+
+	speedy->map = devm_regmap_init_mmio(dev, mem, &speedy_map_cfg);
+	if (IS_ERR(speedy->map))
+		return dev_err_probe(dev, PTR_ERR(speedy->map), "Failed to init the regmap\n");
+
+	/* Clear any interrupt status remaining */
+	ret = speedy_int_clear(speedy);
+	if (ret)
+		return ret;
+
+	/* Reset the controller */
+	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_SW_RST);
+	if (ret)
+		return ret;
+
+	msleep(20);
+
+	/* Enable the hw */
+	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_ENABLE);
+	if (ret)
+		return ret;
+
+	msleep(20);
+
+	/* Probe child devices */
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, dev);
+	if (ret)
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+
+	return ret;
+}
+
+static struct platform_driver speedy_driver = {
+	.probe = speedy_probe,
+	.driver = {
+		.name = "exynos-speedy",
+		.of_match_table = speedy_match,
+	},
+};
+
+module_platform_driver(speedy_driver);
+
+MODULE_DESCRIPTION("Samsung Exynos SPEEDY host controller driver");
+MODULE_AUTHOR("Markuss Broks <markuss.broks@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/samsung/exynos-speedy.h b/include/linux/soc/samsung/exynos-speedy.h
new file mode 100644
index 0000000000000000000000000000000000000000..b2857d65d3b50927373866dd8ae1c47e98af6d7b
--- /dev/null
+++ b/include/linux/soc/samsung/exynos-speedy.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2024, Markuss Broks <markuss.broks@gmail.com>
+ * Copyright 2024, Maksym Holovach <nergzd@nergzd723.xyz>
+ */
+
+#ifndef __EXYNOS_SPEEDY_H
+#define __EXYNOS_SPEEDY_H
+
+#include <linux/types.h>
+
+struct device;
+struct mutex;
+struct platform_device;
+struct regmap;
+
+struct speedy_controller {
+	struct mutex io_lock;
+	struct platform_device *pdev;
+	struct regmap *map;
+};
+
+struct speedy_device {
+	u32 reg;
+	struct speedy_controller *speedy;
+};
+
+/**
+ * exynos_speedy_read() - exynos speedy read operation
+ * @device:	pointer to speedy device struct
+ * @addr:       address to read
+ * @val:        pointer to store result
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+int exynos_speedy_read(const struct speedy_device *device, u32 addr, u32 *val);
+
+/**
+ * exynos_speedy_write() - exynos speedy write operation
+ * @device:	pointer to speedy device struct
+ * @addr:       address to write
+ * @val:        value to write
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+int exynos_speedy_write(const struct speedy_device *device, u32 addr, u32 val);
+
+/**
+ * devm_speedy_get_device() - managed get speedy device.
+ * @dev:	device pointer requesting speedy device handle.
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ */
+const struct speedy_device *devm_speedy_get_device(struct device *dev);
+
+#endif /* __EXYNOS_SPEEDY_H */

-- 
2.47.0

