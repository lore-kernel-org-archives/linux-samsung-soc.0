Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9323ED56
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Feb 2025 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942200; cv=none; b=jW5usljF+qsP7wOIy9pPu0H40dP3UhxT8Kz+G7SeSoBQaWL4VDvojJZRhX6iuOmZ02SvNyXAFmdZ5zoK9+apkkdU8lAtJlU+jsLxm1ovIFNp8HcZTQDOZKuHeTFfmje0DX3BQtDoCMYgn2qj2ewLLK2Iit0aTb6DF+Kq5n3rzyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942200; c=relaxed/simple;
	bh=+hae5A8TchOuLUl1/2FezPEMICGV9Ekh0jygkpaQUdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YNh3uv2Phx9/sqGaj/IQ/xfSN89y+Eif+9j8q++BwfjEoGYQEOqaReNe31xG8C+G9s9WdjqOknNiK3E2K+QcixELA5VoCYp1i1c+AoGM1CBRHWwWsE5cBZono1S7eBldArJCNr3/EKXOpzmgWviEJZ+QVqR0KZtsHP8QDMLViTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QU5fMy0A; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QU5fMy0A"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso22044765e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2025 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738942195; x=1739546995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twYfo2w0TdbI3PjRsSwcFyHlGo2y91kEWXyL9OMNnXc=;
        b=QU5fMy0Apz6Mlhn9GJdodlojnyamV7moiq3q6sLIt+Z7duzGgqL2P1OJBJwux5zK31
         SUETj3Htx4GxKjnCuru/b6bdQu5+frEPBCNnJK522UM0l1TbYhzzb5CNGDYpGVbY+nWC
         imX0KfUWykl1by7Zt0TOqzJrTXZ/Hn64TSIbkSuzvCUDfvnswZiniMiChlLN24BnZz+Y
         hnHWr/oQCjdWaCM+aqRWlbcanl1XnRcpUMTIygaeQoNFi3r7Rfi8Vs7hgcBS6sSo4nfb
         xj9c8t/aDHFh/zhmqO6vexcnVpVO8NUr06iDuhnGryhjrG/NF0E81rnsqJLRM09WLB5m
         Ldsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942195; x=1739546995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twYfo2w0TdbI3PjRsSwcFyHlGo2y91kEWXyL9OMNnXc=;
        b=BWCLjDbCo5EtG2NqKiPwXvxNP8uVk/nwyo42/NtvNZjw7+i/ExaEl3gBT73/f1JcSV
         YYJ+w+YJqFMcR/H39v4BUOU2YTCLpP+8/aFtNp3vvdW2sjtsHN/fpaqoORfjef5NNcbk
         a4nJ1nApM+N5ZoyNqsnivHbk1BY4TLio4E4iTrz0m9IhTjmtLGrbZg3lJl/BJINGulA4
         gi/KWAoEv6Cz7ggRsx8egQpcIQHEZEmsQBT15mRNKYYtNsJon/ktwgvohBXJHETRuyOY
         r2Cv+6Cu55lZw1u43AmwM5D+4xfmgxiOHPrIL++icwF05nqSTIio7TkFdW2XSzc7JtQR
         snTg==
X-Forwarded-Encrypted: i=1; AJvYcCWbJVp4EAlYIRL/Ouz6IxZUnv3HMVE5ur/l9JtjHiW8lSGZat1Mctwj+iWHwS3S4b3xFBtp22AzGhuHZjJo01RryQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+Zmrv9L4xtRz2u8mlGwvq+w5/YCKrxOmOhuQzV1YAgsts8du
	94HsMvGF3vn23lsGojA0zefAHTh9asmXX3cO3u8VmW5C0rDKf8NCK2LLEBGtQD4=
X-Gm-Gg: ASbGncvjS3120PgUNkwyLjnCYTusqfoPIEIQEHwwz8ABEdTFAfK+/rEVBpzde0vc+pA
	87SI2WoGnu52x7MlnBXXUyqu50lijaNi0tD+NQM3/UPbK4GfMMJ+ElM+SWvX9zNL/UBYlaKVJ1F
	DmM3cFtCXSnaxnX+x6npde5oGhu9DAb4oS5EgKHt/nNZ272t+uKcYU0NcKpPPIo+KzRHLuGGljT
	M8XhOk3tPkoHpbyve2uNpMW2xHrRjcQmj0t1zGDTpghUuGO+0MBQqrIDClGKr4CiM+7gzPKDFlH
	E/OUUnmv1KwokN+SPjmqM7gTOVspC7pMWT7NpA6hQmDNPL3Tg8WegHMAyiwe99wJDG4uaRE=
X-Google-Smtp-Source: AGHT+IEmfqC22PW4hUJUebUitgN6/7KKQWk7k+ES3+r02V9CTFSXAUUYe2xOK0QfMTDOWd7z50yjGg==
X-Received: by 2002:a05:600c:3c84:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43924991e0cmr35654235e9.14.1738942194737;
        Fri, 07 Feb 2025 07:29:54 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm57141905e9.10.2025.02.07.07.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:29:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:29:48 +0000
Subject: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
References: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
In-Reply-To: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738942192; l=35364;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=+hae5A8TchOuLUl1/2FezPEMICGV9Ekh0jygkpaQUdc=;
 b=Y9M/J+T1S5scFt1lzyzEBZJD6e+0hveKNyte6+o2OxIZLo6HWoBeUoVkP4PvUafaBlUECCEIA
 4+PStQQcJDZDdt1uI8J5VbGI+3gXT06JzzJ7EFXED9lOSGVIb1LdnPG
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Alive Clock and Power Manager (ACPM) Message Protocol is defined for
the purpose of communication between the ACPM firmware and masters
(AP, AOC, ...). ACPM firmware operates on the Active Power Management
(APM) module that handles overall power activities.

ACPM and masters regard each other as independent hardware component and
communicate with each other using mailbox messages and shared memory.

This protocol driver provides the interface for all the client drivers
making use of the features offered by the APM. Add ACPM protocol support.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/samsung/Kconfig                   |  14 +
 drivers/firmware/samsung/Makefile                  |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 229 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  29 +
 drivers/firmware/samsung/exynos-acpm.c             | 771 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  23 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  49 ++
 9 files changed, 1121 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 71d8b26c4103..24edb956831b 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
 source "drivers/firmware/microchip/Kconfig"
 source "drivers/firmware/psci/Kconfig"
 source "drivers/firmware/qcom/Kconfig"
+source "drivers/firmware/samsung/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 7a8d486e718f..91efcc868a05 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -33,6 +33,7 @@ obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
 obj-y				+= qcom/
+obj-y				+= samsung/
 obj-y				+= smccc/
 obj-y				+= tegra/
 obj-y				+= xilinx/
diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
new file mode 100644
index 000000000000..16d81aeb1d41
--- /dev/null
+++ b/drivers/firmware/samsung/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config EXYNOS_ACPM_PROTOCOL
+	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on MAILBOX
+	help
+	  Alive Clock and Power Manager (ACPM) Message Protocol is defined for
+	  the purpose of communication between the ACPM firmware and masters
+	  (AP, AOC, ...). ACPM firmware operates on the Active Power Management
+	  (APM) module that handles overall power activities.
+
+	  This protocol driver provides interface for all the client drivers
+	  making use of the features offered by the APM.
diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
new file mode 100644
index 000000000000..7b4c9f6f34f5
--- /dev/null
+++ b/drivers/firmware/samsung/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
+obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
new file mode 100644
index 000000000000..1ad3c0b4e39b
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+#include <linux/bitfield.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-pmic.h"
+
+#define ACPM_PMIC_CHANNEL		GENMASK(15, 12)
+#define ACPM_PMIC_TYPE			GENMASK(11, 8)
+#define ACPM_PMIC_REG			GENMASK(7, 0)
+
+#define ACPM_PMIC_RETURN		GENMASK(31, 24)
+#define ACPM_PMIC_MASK			GENMASK(23, 16)
+#define ACPM_PMIC_VALUE			GENMASK(15, 8)
+#define ACPM_PMIC_FUNC			GENMASK(7, 0)
+
+#define ACPM_PMIC_BULK_SHIFT		8
+#define ACPM_PMIC_BULK_MASK		GENMASK(7, 0)
+#define ACPM_PMIC_BULK_MAX_COUNT	8
+
+enum exynos_acpm_pmic_func {
+	ACPM_PMIC_READ,
+	ACPM_PMIC_WRITE,
+	ACPM_PMIC_UPDATE,
+	ACPM_PMIC_BULK_READ,
+	ACPM_PMIC_BULK_WRITE,
+};
+
+static inline u32 acpm_pmic_set_bulk(u32 data, unsigned int i)
+{
+	return (data & ACPM_PMIC_BULK_MASK) << (ACPM_PMIC_BULK_SHIFT * i);
+}
+
+static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
+{
+	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
+}
+
+static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd,
+			       unsigned int acpm_chan_id)
+{
+	xfer->txd = cmd;
+	xfer->rxd = cmd;
+	xfer->txlen = sizeof(cmd);
+	xfer->rxlen = sizeof(cmd);
+	xfer->acpm_chan_id = acpm_chan_id;
+}
+
+static void acpm_pmic_init_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_READ);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+int acpm_pmic_read_reg(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+		       u8 *buf)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
+	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	*buf = FIELD_GET(ACPM_PMIC_VALUE, xfer.rxd[1]);
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+}
+
+static void acpm_pmic_init_bulk_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
+					 u8 count)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_BULK_READ) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, count);
+}
+
+int acpm_pmic_bulk_read(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			u8 count, u8 *buf)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int i, ret;
+
+	if (count > ACPM_PMIC_BULK_MAX_COUNT)
+		return -EINVAL;
+
+	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
+	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	ret = FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < count; i++) {
+		if (i < 4)
+			buf[i] = acpm_pmic_get_bulk(xfer.rxd[2], i);
+		else
+			buf[i] = acpm_pmic_get_bulk(xfer.rxd[3], i - 4);
+	}
+
+	return 0;
+}
+
+static void acpm_pmic_init_write_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
+				     u8 value)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_WRITE) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, value);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+int acpm_pmic_write_reg(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			u8 value)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
+	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+}
+
+static void acpm_pmic_init_bulk_write_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
+					  u8 count, const u8 *buf)
+{
+	int i;
+
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_BULK_WRITE) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, count);
+
+	for (i = 0; i < count; i++) {
+		if (i < 4)
+			cmd[2] |= acpm_pmic_set_bulk(buf[i], i);
+		else
+			cmd[3] |= acpm_pmic_set_bulk(buf[i], i - 4);
+	}
+}
+
+int acpm_pmic_bulk_write(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			 u8 count, const u8 *buf)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	if (count > ACPM_PMIC_BULK_MAX_COUNT)
+		return -EINVAL;
+
+	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
+	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+}
+
+static void acpm_pmic_init_update_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan,
+				      u8 value, u8 mask)
+{
+	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
+		 FIELD_PREP(ACPM_PMIC_REG, reg) |
+		 FIELD_PREP(ACPM_PMIC_CHANNEL, chan);
+	cmd[1] = FIELD_PREP(ACPM_PMIC_FUNC, ACPM_PMIC_UPDATE) |
+		 FIELD_PREP(ACPM_PMIC_VALUE, value) |
+		 FIELD_PREP(ACPM_PMIC_MASK, mask);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+int acpm_pmic_update_reg(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			 u8 value, u8 mask)
+{
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
+	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(ACPM_PMIC_RETURN, xfer.rxd[1]);
+}
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM PMIC protocol driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.h b/drivers/firmware/samsung/exynos-acpm-pmic.h
new file mode 100644
index 000000000000..078421888a14
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_PMIC_H__
+#define __EXYNOS_ACPM_PMIC_H__
+
+#include <linux/types.h>
+
+struct acpm_handle;
+
+int acpm_pmic_read_reg(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+		       u8 *buf);
+int acpm_pmic_bulk_read(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			u8 count, u8 *buf);
+int acpm_pmic_write_reg(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			u8 value);
+int acpm_pmic_bulk_write(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			 u8 count, const u8 *buf);
+int acpm_pmic_update_reg(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			 u8 value, u8 mask);
+#endif /* __EXYNOS_ACPM_PMIC_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
new file mode 100644
index 000000000000..4606a359e629
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -0,0 +1,771 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mailbox/exynos-message.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/math.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-pmic.h"
+
+#define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
+
+/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
+#define ACPM_POLL_TIMEOUT		5000
+#define ACPM_TX_TIMEOUT_US		500000
+
+#define ACPM_GS101_INITDATA_BASE	0xa000
+
+/**
+ * struct acpm_shmem - shared memory configuration information.
+ * @reserved:	unused fields.
+ * @chans:	offset to array of struct acpm_chan_shmem.
+ * @reserved1:	unused fields.
+ * @num_chans:	number of channels.
+ */
+struct acpm_shmem {
+	u32 reserved[2];
+	u32 chans;
+	u32 reserved1[3];
+	u32 num_chans;
+};
+
+/**
+ * struct acpm_chan_shmem - descriptor of a shared memory channel.
+ *
+ * @id:			channel ID.
+ * @reserved:		unused fields.
+ * @rx_rear:		rear pointer of APM RX queue (TX for AP).
+ * @rx_front:		front pointer of APM RX queue (TX for AP).
+ * @rx_base:		base address of APM RX queue (TX for AP).
+ * @reserved1:		unused fields.
+ * @tx_rear:		rear pointer of APM TX queue (RX for AP).
+ * @tx_front:		front pointer of APM TX queue (RX for AP).
+ * @tx_base:		base address of APM TX queue (RX for AP).
+ * @qlen:		queue length. Applies to both TX/RX queues.
+ * @mlen:		message length. Applies to both TX/RX queues.
+ * @reserved2:		unused fields.
+ * @poll_completion:	true when the channel works on polling.
+ */
+struct acpm_chan_shmem {
+	u32 id;
+	u32 reserved[3];
+	u32 rx_rear;
+	u32 rx_front;
+	u32 rx_base;
+	u32 reserved1[3];
+	u32 tx_rear;
+	u32 tx_front;
+	u32 tx_base;
+	u32 qlen;
+	u32 mlen;
+	u32 reserved2[2];
+	u32 poll_completion;
+};
+
+/**
+ * struct acpm_queue - exynos acpm queue.
+ *
+ * @rear:	rear address of the queue.
+ * @front:	front address of the queue.
+ * @base:	base address of the queue.
+ */
+struct acpm_queue {
+	void __iomem *rear;
+	void __iomem *front;
+	void __iomem *base;
+};
+
+/**
+ * struct acpm_rx_data - RX queue data.
+ *
+ * @cmd:	pointer to where the data shall be saved.
+ * @n_cmd:	number of 32-bit commands.
+ * @response:	true if the client expects the RX data.
+ */
+struct acpm_rx_data {
+	u32 *cmd;
+	size_t n_cmd;
+	bool response;
+};
+
+#define ACPM_SEQNUM_MAX    64
+
+/**
+ * struct acpm_chan - driver internal representation of a channel.
+ * @cl:		mailbox client.
+ * @chan:	mailbox channel.
+ * @acpm:	pointer to driver private data.
+ * @tx:		TX queue. The enqueue is done by the host.
+ *			- front index is written by the host.
+ *			- rear index is written by the firmware.
+ *
+ * @rx:		RX queue. The enqueue is done by the firmware.
+ *			- front index is written by the firmware.
+ *			- rear index is written by the host.
+ * @tx_lock:	protects TX queue.
+ * @rx_lock:	protects RX queue.
+ * @qlen:	queue length. Applies to both TX/RX queues.
+ * @mlen:	message length. Applies to both TX/RX queues.
+ * @seqnum:	sequence number of the last message enqueued on TX queue.
+ * @id:		channel ID.
+ * @poll_completion:	indicates if the transfer needs to be polled for
+ *			completion or interrupt mode is used.
+ * @bitmap_seqnum: bitmap that tracks the messages on the TX/RX queues.
+ * @rx_data:	internal buffer used to drain the RX queue.
+ */
+struct acpm_chan {
+	struct mbox_client cl;
+	struct mbox_chan *chan;
+	struct acpm_info *acpm;
+	struct acpm_queue tx;
+	struct acpm_queue rx;
+	struct mutex tx_lock;
+	struct mutex rx_lock;
+
+	unsigned int qlen;
+	unsigned int mlen;
+	u8 seqnum;
+	u8 id;
+	bool poll_completion;
+
+	DECLARE_BITMAP(bitmap_seqnum, ACPM_SEQNUM_MAX - 1);
+	struct acpm_rx_data rx_data[ACPM_SEQNUM_MAX];
+};
+
+/**
+ * struct acpm_info - driver's private data.
+ * @shmem:	pointer to the SRAM configuration data.
+ * @sram_base:	base address of SRAM.
+ * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
+ * @dev:	pointer to the exynos-acpm device.
+ * @handle:	instance of acpm_handle to send to clients.
+ * @num_chans:	number of channels available for this controller.
+ */
+struct acpm_info {
+	struct acpm_shmem __iomem *shmem;
+	void __iomem *sram_base;
+	struct acpm_chan *chans;
+	struct device *dev;
+	struct acpm_handle handle;
+	u32 num_chans;
+};
+
+/**
+ * struct acpm_match_data - of_device_id data.
+ * @initdata_base:	offset in SRAM where the channels configuration resides.
+ */
+struct acpm_match_data {
+	loff_t initdata_base;
+};
+
+#define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
+#define handle_to_acpm_info(h) container_of(h, struct acpm_info, handle)
+
+/**
+ * acpm_get_rx() - get response from RX queue.
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer to get response for.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
+{
+	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
+	const void __iomem *base, *addr;
+	struct acpm_rx_data *rx_data;
+	u32 i, val, mlen;
+	bool rx_set = false;
+
+	rx_front = readl(achan->rx.front);
+	i = readl(achan->rx.rear);
+
+	/* Bail out if RX is empty. */
+	if (i == rx_front)
+		return 0;
+
+	base = achan->rx.base;
+	mlen = achan->mlen;
+
+	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
+
+	/* Drain RX queue. */
+	do {
+		/* Read RX seqnum. */
+		addr = base + mlen * i;
+		val = readl(addr);
+
+		rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, val);
+		if (!rx_seqnum)
+			return -EIO;
+		/*
+		 * mssg seqnum starts with value 1, whereas the driver considers
+		 * the first mssg at index 0.
+		 */
+		seqnum = rx_seqnum - 1;
+		rx_data = &achan->rx_data[seqnum];
+
+		if (rx_data->response) {
+			if (rx_seqnum == tx_seqnum) {
+				__ioread32_copy(xfer->rxd, addr,
+						xfer->rxlen / 4);
+				rx_set = true;
+				clear_bit(seqnum, achan->bitmap_seqnum);
+			} else {
+				/*
+				 * The RX data corresponds to another request.
+				 * Save the data to drain the queue, but don't
+				 * clear yet the bitmap. It will be cleared
+				 * after the response is copied to the request.
+				 */
+				__ioread32_copy(rx_data->cmd, addr,
+						xfer->rxlen / 4);
+			}
+		} else {
+			clear_bit(seqnum, achan->bitmap_seqnum);
+		}
+
+		i = (i + 1) % achan->qlen;
+	} while (i != rx_front);
+
+	/* We saved all responses, mark RX empty. */
+	writel(rx_front, achan->rx.rear);
+
+	/*
+	 * If the response was not in this iteration of the queue, check if the
+	 * RX data was previously saved.
+	 */
+	rx_data = &achan->rx_data[tx_seqnum - 1];
+	if (!rx_set && rx_data->response) {
+		rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM,
+				      rx_data->cmd[0]);
+
+		if (rx_seqnum == tx_seqnum) {
+			memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
+			clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * acpm_dequeue_by_polling() - RX dequeue by polling.
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer being waited for.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_dequeue_by_polling(struct acpm_chan *achan,
+				   const struct acpm_xfer *xfer)
+{
+	struct device *dev = achan->acpm->dev;
+	unsigned int cnt_20us = 0;
+	u32 seqnum;
+	int ret;
+
+	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
+
+	do {
+		mutex_lock(&achan->rx_lock);
+		ret = acpm_get_rx(achan, xfer);
+		mutex_unlock(&achan->rx_lock);
+		if (ret)
+			return ret;
+
+		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
+			return 0;
+
+		/* Determined experimentally. */
+		usleep_range(20, 30);
+		cnt_20us++;
+	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+
+	return -ETIME;
+}
+
+/**
+ * acpm_wait_for_queue_slots() - wait for queue slots.
+ *
+ * @achan:		ACPM channel info.
+ * @next_tx_front:	next front index of the TX queue.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
+{
+	u32 val, ret;
+
+	/*
+	 * Wait for RX front to keep up with TX front. Make sure there's at
+	 * least one element between them.
+	 */
+	ret = readl_poll_timeout(achan->rx.front, val, next_tx_front != val, 0,
+				 ACPM_TX_TIMEOUT_US);
+	if (ret) {
+		dev_err(achan->acpm->dev, "RX front can not keep up with TX front.\n");
+		return ret;
+	}
+
+	ret = readl_poll_timeout(achan->tx.rear, val, next_tx_front != val, 0,
+				 ACPM_TX_TIMEOUT_US);
+	if (ret)
+		dev_err(achan->acpm->dev, "TX queue is full.\n");
+
+	return ret;
+}
+
+/**
+ * acpm_prepare_xfer() - prepare a transfer before writing the message to the
+ * TX queue.
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer being prepared.
+ */
+static void acpm_prepare_xfer(struct acpm_chan *achan,
+			      const struct acpm_xfer *xfer)
+{
+	struct acpm_rx_data *rx_data;
+	u32 *txd = (u32 *)xfer->txd;
+
+	/* Prevent chan->seqnum from being re-used */
+	do {
+		if (++achan->seqnum == ACPM_SEQNUM_MAX)
+			achan->seqnum = 1;
+	} while (test_bit(achan->seqnum - 1, achan->bitmap_seqnum));
+
+	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
+
+	/* Clear data for upcoming responses */
+	rx_data = &achan->rx_data[achan->seqnum - 1];
+	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
+	if (xfer->rxd)
+		rx_data->response = true;
+
+	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
+}
+
+/**
+ * acpm_wait_for_message_response - an helper to group all possible ways of
+ * waiting for a synchronous message response.
+ *
+ * @achan:	ACPM channel info.
+ * @xfer:	reference to the transfer being waited for.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_wait_for_message_response(struct acpm_chan *achan,
+					  const struct acpm_xfer *xfer)
+{
+	/* Just polling mode supported for now. */
+	return acpm_dequeue_by_polling(achan, xfer);
+}
+
+/**
+ * acpm_do_xfer() - do one transfer.
+ * @handle:	pointer to the acpm handle.
+ * @xfer:	transfer to initiate and wait for response.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
+{
+	struct acpm_info *acpm = handle_to_acpm_info(handle);
+	struct exynos_mbox_msg msg;
+	struct acpm_chan *achan;
+	u32 idx, tx_front;
+	int ret;
+
+	if (xfer->acpm_chan_id >= acpm->num_chans)
+		return -EINVAL;
+
+	achan = &acpm->chans[xfer->acpm_chan_id];
+
+	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
+		return -EINVAL;
+
+	if (!achan->poll_completion) {
+		dev_err(achan->acpm->dev, "Interrupt mode not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	mutex_lock(&achan->tx_lock);
+
+	tx_front = readl(achan->tx.front);
+	idx = (tx_front + 1) % achan->qlen;
+
+	ret = acpm_wait_for_queue_slots(achan, idx);
+	if (ret) {
+		mutex_unlock(&achan->tx_lock);
+		return ret;
+	}
+
+	acpm_prepare_xfer(achan, xfer);
+
+	/* Write TX command. */
+	__iowrite32_copy(achan->tx.base + achan->mlen * tx_front, xfer->txd,
+			 xfer->txlen / 4);
+
+	/* Advance TX front. */
+	writel(idx, achan->tx.front);
+
+	mutex_unlock(&achan->tx_lock);
+
+	msg.chan_id = xfer->acpm_chan_id;
+	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
+	ret = mbox_send_message(achan->chan, (void *)&msg);
+	if (ret < 0)
+		return ret;
+
+	ret = acpm_wait_for_message_response(achan, xfer);
+
+	/*
+	 * NOTE: we might prefer not to need the mailbox ticker to manage the
+	 * transfer queueing since the protocol layer queues things by itself.
+	 * Unfortunately, we have to kick the mailbox framework after we have
+	 * received our message.
+	 */
+	mbox_client_txdone(achan->chan, ret);
+
+	return ret;
+}
+
+/**
+ * acpm_chan_shmem_get_params() - get channel parameters and addresses of the
+ * TX/RX queues.
+ * @achan:	ACPM channel info.
+ * @chan_shmem:	__iomem pointer to a channel described in shared memory.
+ */
+static void acpm_chan_shmem_get_params(struct acpm_chan *achan,
+				struct acpm_chan_shmem __iomem *chan_shmem)
+{
+	void __iomem *base = achan->acpm->sram_base;
+	struct acpm_queue *rx = &achan->rx;
+	struct acpm_queue *tx = &achan->tx;
+
+	achan->mlen = readl(&chan_shmem->mlen);
+	achan->poll_completion = readl(&chan_shmem->poll_completion);
+	achan->id = readl(&chan_shmem->id);
+	achan->qlen = readl(&chan_shmem->qlen);
+
+	tx->base = base + readl(&chan_shmem->rx_base);
+	tx->rear = base + readl(&chan_shmem->rx_rear);
+	tx->front = base + readl(&chan_shmem->rx_front);
+
+	rx->base = base + readl(&chan_shmem->tx_base);
+	rx->rear = base + readl(&chan_shmem->tx_rear);
+	rx->front = base + readl(&chan_shmem->tx_front);
+
+	dev_vdbg(achan->acpm->dev, "ID = %d poll = %d, mlen = %d, qlen = %d\n",
+		 achan->id, achan->poll_completion, achan->mlen, achan->qlen);
+}
+
+/**
+ * acpm_achan_alloc_cmds() - allocate buffers for retrieving data from the ACPM
+ * firmware.
+ * @achan:	ACPM channel info.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
+{
+	struct device *dev = achan->acpm->dev;
+	struct acpm_rx_data *rx_data;
+	size_t cmd_size, n_cmd;
+	int i;
+
+	if (achan->mlen == 0)
+		return 0;
+
+	cmd_size = sizeof(*(achan->rx_data[0].cmd));
+	n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
+
+	for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
+		rx_data = &achan->rx_data[i];
+		rx_data->n_cmd = n_cmd;
+		rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
+		if (!rx_data->cmd)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/**
+ * acpm_free_mbox_chans() - free mailbox channels.
+ * @acpm:	pointer to driver data.
+ */
+static void acpm_free_mbox_chans(struct acpm_info *acpm)
+{
+	int i;
+
+	for (i = 0; i < acpm->num_chans; i++)
+		if (!IS_ERR_OR_NULL(acpm->chans[i].chan))
+			mbox_free_channel(acpm->chans[i].chan);
+}
+
+/**
+ * acpm_channels_init() - initialize channels based on the configuration data in
+ * the shared memory.
+ * @acpm:	pointer to driver data.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int acpm_channels_init(struct acpm_info *acpm)
+{
+	struct acpm_shmem __iomem *shmem = acpm->shmem;
+	struct acpm_chan_shmem __iomem *chans_shmem;
+	struct device *dev = acpm->dev;
+	int i, ret;
+
+	acpm->num_chans = readl(&shmem->num_chans);
+	acpm->chans = devm_kcalloc(dev, acpm->num_chans, sizeof(*acpm->chans),
+				   GFP_KERNEL);
+	if (!acpm->chans)
+		return -ENOMEM;
+
+	chans_shmem = acpm->sram_base + readl(&shmem->chans);
+
+	for (i = 0; i < acpm->num_chans; i++) {
+		struct acpm_chan_shmem __iomem *chan_shmem = &chans_shmem[i];
+		struct acpm_chan *achan = &acpm->chans[i];
+		struct mbox_client *cl = &achan->cl;
+
+		achan->acpm = acpm;
+
+		acpm_chan_shmem_get_params(achan, chan_shmem);
+
+		ret = acpm_achan_alloc_cmds(achan);
+		if (ret)
+			return ret;
+
+		mutex_init(&achan->rx_lock);
+		mutex_init(&achan->tx_lock);
+
+		cl->dev = dev;
+
+		achan->chan = mbox_request_channel(cl, 0);
+		if (IS_ERR(achan->chan)) {
+			acpm_free_mbox_chans(acpm);
+			return PTR_ERR(achan->chan);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * acpm_setup_ops() - setup the operations structures.
+ * @acpm:	pointer to the driver data.
+ */
+static void acpm_setup_ops(struct acpm_info *acpm)
+{
+	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+
+	pmic_ops->read_reg = acpm_pmic_read_reg;
+	pmic_ops->bulk_read = acpm_pmic_bulk_read;
+	pmic_ops->write_reg = acpm_pmic_write_reg;
+	pmic_ops->bulk_write = acpm_pmic_bulk_write;
+	pmic_ops->update_reg = acpm_pmic_update_reg;
+}
+
+static int acpm_probe(struct platform_device *pdev)
+{
+	const struct acpm_match_data *match_data;
+	struct device *dev = &pdev->dev;
+	struct device_node *shmem;
+	struct acpm_info *acpm;
+	resource_size_t size;
+	struct resource res;
+	int ret;
+
+	acpm = devm_kzalloc(dev, sizeof(*acpm), GFP_KERNEL);
+	if (!acpm)
+		return -ENOMEM;
+
+	shmem = of_parse_phandle(dev->of_node, "shmem", 0);
+	ret = of_address_to_resource(shmem, 0, &res);
+	of_node_put(shmem);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get shared memory.\n");
+
+	size = resource_size(&res);
+	acpm->sram_base = devm_ioremap(dev, res.start, size);
+	if (!acpm->sram_base)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to ioremap shared memory.\n");
+
+	match_data = of_device_get_match_data(dev);
+	if (!match_data)
+		return dev_err_probe(dev, -EINVAL,
+				     "Faile to get match data.\n");
+
+	acpm->shmem = acpm->sram_base + match_data->initdata_base;
+	acpm->dev = dev;
+
+	ret = acpm_channels_init(acpm);
+	if (ret)
+		return ret;
+
+	acpm_setup_ops(acpm);
+
+	platform_set_drvdata(pdev, acpm);
+
+	return 0;
+}
+
+/**
+ * acpm_put_handle() - release the handle acquired by acpm_get_by_phandle.
+ * @handle:	Handle acquired by acpm_get_by_phandle.
+ */
+static void acpm_handle_put(const struct acpm_handle *handle)
+{
+	struct acpm_info *acpm = handle_to_acpm_info(handle);
+	struct device *dev = acpm->dev;
+
+	module_put(dev->driver->owner);
+	/* Drop reference taken with of_find_device_by_node(). */
+	put_device(dev);
+}
+
+/**
+ * devm_acpm_release() - devres release method.
+ * @dev: pointer to device.
+ * @res: pointer to resource.
+ */
+static void devm_acpm_release(struct device *dev, void *res)
+{
+	acpm_handle_put(*(struct acpm_handle **)res);
+}
+
+/**
+ * acpm_get_by_phandle() - get the ACPM handle using DT phandle.
+ * @dev:        device pointer requesting ACPM handle.
+ * @property:   property name containing phandle on ACPM node.
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ */
+static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
+						     const char *property)
+{
+	struct platform_device *pdev;
+	struct device_node *acpm_np;
+	struct device_link *link;
+	struct acpm_info *acpm;
+
+	acpm_np = of_parse_phandle(dev->of_node, property, 0);
+	if (!acpm_np)
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(acpm_np);
+	if (!pdev) {
+		dev_err(dev, "Cannot find device node %s\n", acpm_np->name);
+		of_node_put(acpm_np);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	of_node_put(acpm_np);
+
+	acpm = platform_get_drvdata(pdev);
+	if (!acpm) {
+		dev_err(dev, "Cannot get drvdata from %s\n",
+			dev_name(&pdev->dev));
+		platform_device_put(pdev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (!try_module_get(pdev->dev.driver->owner)) {
+		dev_err(dev, "Cannot get module reference.\n");
+		platform_device_put(pdev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
+	if (!link) {
+		dev_err(&pdev->dev,
+			"Failed to create device link to consumer %s.\n",
+			dev_name(dev));
+		platform_device_put(pdev);
+		module_put(pdev->dev.driver->owner);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &acpm->handle;
+}
+
+/**
+ * devm_acpm_get_by_phandle() - managed get handle using phandle.
+ * @dev:        device pointer requesting ACPM handle.
+ * @property:   property name containing phandle on ACPM node.
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ */
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
+						   const char *property)
+{
+	const struct acpm_handle **ptr, *handle;
+
+	ptr = devres_alloc(devm_acpm_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	handle = acpm_get_by_phandle(dev, property);
+	if (!IS_ERR(handle)) {
+		*ptr = handle;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return handle;
+}
+
+static const struct acpm_match_data acpm_gs101 = {
+	.initdata_base = ACPM_GS101_INITDATA_BASE,
+};
+
+static const struct of_device_id acpm_match[] = {
+	{
+		.compatible = "google,gs101-acpm-ipc",
+		.data = &acpm_gs101,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, acpm_match);
+
+static struct platform_driver acpm_driver = {
+	.probe	= acpm_probe,
+	.driver	= {
+		.name = "exynos-acpm-protocol",
+		.of_match_table	= acpm_match,
+	},
+};
+module_platform_driver(acpm_driver);
+
+MODULE_AUTHOR("Tudor Ambarus <tudor.ambarus@linaro.org>");
+MODULE_DESCRIPTION("Samsung Exynos ACPM mailbox protocol driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
new file mode 100644
index 000000000000..2d14cb58f98c
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_H__
+#define __EXYNOS_ACPM_H__
+
+struct acpm_xfer {
+	const u32 *txd;
+	u32 *rxd;
+	size_t txlen;
+	size_t rxlen;
+	unsigned int acpm_chan_id;
+};
+
+struct acpm_handle;
+
+int acpm_do_xfer(const struct acpm_handle *handle,
+		 const struct acpm_xfer *xfer);
+
+#endif /* __EXYNOS_ACPM_H__ */
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
new file mode 100644
index 000000000000..7b34b36c9553
--- /dev/null
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#ifndef __EXYNOS_ACPM_PROTOCOL_H
+#define __EXYNOS_ACPM_PROTOCOL_H
+
+#include <linux/types.h>
+
+struct acpm_handle;
+
+struct acpm_pmic_ops {
+	int (*read_reg)(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			u8 *buf);
+	int (*bulk_read)(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			 u8 count, u8 *buf);
+	int (*write_reg)(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			 u8 value);
+	int (*bulk_write)(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			  u8 count, const u8 *buf);
+	int (*update_reg)(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
+			  u8 value, u8 mask);
+};
+
+struct acpm_ops {
+	struct acpm_pmic_ops pmic_ops;
+};
+
+/**
+ * struct acpm_handle - Reference to an initialized protocol instance
+ * @ops:
+ */
+struct acpm_handle {
+	struct acpm_ops ops;
+};
+
+struct device;
+
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
+						   const char *property);
+#endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.48.1.502.g6dc24dfdaf-goog

