Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F88E43E9FB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837559; cv=none; b=tK31F1jDwgKkJTS8KAxVnzuWm/SZVeKj0GmLawGeNPsYT5yCf3ekwSLhd01eHyNm4cV0AeRZzyrFqx89t5mj/Soo0lF7wkUp65/BJvO+ylq5XbVMKLDuw+eoPUDAPjX+HbL0vuO6ac3yvRUSwrnbJvLkeMhsJUzX7k6L/d7FSQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837559; c=relaxed/simple;
	bh=Q0g8PJmvzDrb33+S0JvUG5YPdUMgcoeMcNew8qogA3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8fM4kFCptEZveFPAFbqu9jJVqxbr2Jkj/ZIxs5kdAbolvikrMyE1jf8vPLuBHgxR2kYdRBMhOkMrraiOkH0iA+2fuxD1IC9vKhcdhfgy9qlGkOfcFeDO3qQ9rMQY5EnbhFKSur/BN+PbEoYEP41NpgJJuOeLCc8cjrCifrpPKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/Vdv1pI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/Vdv1pI"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8f9841616so2110329e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837555; x=1779442355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iu0JFAaozh2EwNRNdO40kwIPCNHJ41fgSgDZT9kc6c=;
        b=N/Vdv1pI6S3seOO1vxNgeRCwIm9R5DJ0oygfH+jO1KFcHpkY+eKOrhfjlNvXqvjlNP
         XTf65ZmnN7dRXpCtB2oia1Ol3v+vGmvPykaKAR7YD48Nt5wTcp4QJt9YUL59x0PMg7r5
         2wQWe7YWVet6723SZloPPPuZANBJKInXTgJJuPwyhdFX85+8bGoglJGO1VHlr4S0Qp5Q
         PbUfP0NF7ZjnE3oWYA7TOOK41I1WTZmYQLcaxi92Yg31by/X8QA7TtZ8EMKk8JcZCQP3
         cbUu/BbrTIcF3h5C3ZE/1cKUl6GOXsNfQ4bsldpxNkacYhcpAhYrW5/r+LSmSzJezTHk
         rmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837555; x=1779442355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/iu0JFAaozh2EwNRNdO40kwIPCNHJ41fgSgDZT9kc6c=;
        b=G0PS0Tg3gjW1SAN4lnSK3sVkXZyv6+fGpNtVmzpLMd7VUfkbt+XCwRdOZRjz6rLaDt
         EgxDyeEIrdeOOePFYhj6WckIBHzAhtwt8yS3sDWc0WqbwhlG3QAIfZAxkBAq50um5asB
         b/kXgCZomhwBvybH9uccuDkXtFsJirYRY0JnlEce/VHztqtvcz/UNnhNVMqZOJt4taRn
         GJKkvSRZ4jb+Cc+djsAw+0m/eH/WxdH/tk8ULWvErOao/9mgnDL47la0uppKYECzBYEZ
         kO9MRtGtFA8glxv0gW5AkBhPOLDsmhEhl22ozAZ/AdGjRyK9moZb4D7yacv9x+xjFpX/
         NZmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sa1sxYMbOYiX2JHcNHPyri1MIC5LwUuMJA1/Dj2XSChfea4sIkf/D9xcX3p6RQMrEUUhGBhAwPDghVxpZCvduUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGSjiZQGP8VXrKBg3+APLVKVwu+Q1yksUR4YTJul88XmEv/8u
	k1I7pVq0Xgc5rg8WEguxhb86N04WL2kMEUSva8O43b2qyiCsEMV04jS3bWCdt5c9wA8=
X-Gm-Gg: Acq92OH1mx0oUxuNiz49tQU/YFGcwB9oKDAseJv3BPIqa9lv5f70UFf1pWPyhwTcL1w
	8zrdzVjOGYnsGpfnqfWo1YQTFERDKCASSUXo5JGRxQpjyq+AS/0RR/5VTu+7R98JQHcDDCOKcyK
	dCcxBWgX+Bxnid261pSTODIhPNYFgen8UPSfzyGdC1yeuWCaehQOuU/xDiy0BoL+oPGQwIqFOCS
	cv3OQ1UaJX+zSueD/JwRLYqZJlCIaZE3N4Aq31sSD4X0SQU1ErQ5wMnPQZBgv4HWffSgEtOG8Hb
	D2A3jOW8ZpIDmaO7R84jkcwnMRDIoFHmXwy1qRH2CYh6HCXPcl0tzJt218kpVZxowPgPzxrt/2D
	G0h//jJ3lHzuUjMMw0UuTyBSi4ft5CrmR0lmf7kDBX15w5awJIS07WD+yML/kAHzAgq6NgWMxWP
	D61gTGWcYZHTp6TGjlkWa7esR5KiVaILiiPKcfE7Zhzbg1zR4Ng9pgsGRS1Bnkae1pXJI2EfuQC
	AjnZ+ks
X-Received: by 2002:a05:6512:a92:b0:5a4:d21:de07 with SMTP id 2adb3069b0e04-5aa0e600e2cmr996522e87.1.1778837554430;
        Fri, 15 May 2026 02:32:34 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:34 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:29 +0000
Subject: [PATCH v2 5/6] firmware: samsung: acpm: Add TMU protocol support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-5-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=10670;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Q0g8PJmvzDrb33+S0JvUG5YPdUMgcoeMcNew8qogA3s=;
 b=081VThk7kSwAg7nN9JkU4Qxg4yVqW1EBrFO49XuM7hZ1pQVCFvdzY+00VaHy6GV5nohiUP9Tf
 8RbEcKY6/nDDlwHa4K2BdAxRST6sZHFCrANI7Mefp1FvMefW3fZlW46
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
through a hybrid model shared between the kernel and the Alive Clock
and Power Manager (ACPM) firmware.

Add the protocol helpers required to communicate with the ACPM for
thermal operations, including initialization, threshold configuration,
temperature reading, and system suspend/resume handshakes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
 drivers/firmware/samsung/exynos-acpm.c             |  12 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
 5 files changed, 298 insertions(+)

diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
index 80d4f89b33a9..5a6f72bececf 100644
--- a/drivers/firmware/samsung/Makefile
+++ b/drivers/firmware/samsung/Makefile
@@ -3,4 +3,5 @@
 acpm-protocol-objs			:= exynos-acpm.o
 acpm-protocol-objs			+= exynos-acpm-pmic.o
 acpm-protocol-objs			+= exynos-acpm-dvfs.o
+acpm-protocol-objs			+= exynos-acpm-tmu.o
 obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
new file mode 100644
index 000000000000..c68d60b4c0b3
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/ktime.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-tmu.h"
+
+/* IPC Request Types */
+#define ACPM_TMU_INIT		0x01
+#define ACPM_TMU_READ_TEMP	0x02
+#define ACPM_TMU_SUSPEND	0x04
+#define ACPM_TMU_RESUME		0x10
+#define ACPM_TMU_THRESHOLD	0x11
+#define ACPM_TMU_INTEN		0x12
+#define ACPM_TMU_CONTROL	0x13
+#define ACPM_TMU_IRQ_CLEAR	0x14
+
+#define ACPM_TMU_TX_DATA_LEN	8
+#define ACPM_TMU_RX_DATA_LEN	7
+
+struct acpm_tmu_tx {
+	u16 ctx;
+	u16 fw_use;
+	u8 type;
+	u8 rsvd0;
+	u8 tzid;
+	u8 rsvd1;
+	u8 data[ACPM_TMU_TX_DATA_LEN];
+} __packed;
+
+struct acpm_tmu_rx {
+	u16 ctx;
+	u16 fw_use;
+	u8 type;
+	s8 ret;
+	u8 tzid;
+	s8 temp;
+	u8 rsvd;
+	u8 data[ACPM_TMU_RX_DATA_LEN];
+} __packed;
+
+union acpm_tmu_msg {
+	u32 data[4];
+	struct acpm_tmu_tx tx;
+	struct acpm_tmu_rx rx;
+};
+
+static int acpm_tmu_to_linux_err(s8 fw_err)
+{
+	/*
+	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
+	 * capabilities. Treat zero and all positive values as success.
+	 */
+	if (fw_err >= 0)
+		return 0;
+
+	if (fw_err == -1)
+		return -EACCES;
+
+	return -EIO;
+}
+
+int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_INIT;
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_to_linux_err(msg.rx.ret);
+}
+
+int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
+		       u8 tz, int *temp)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_READ_TEMP;
+	msg.tx.tzid = tz;
+
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	ret = acpm_tmu_to_linux_err(msg.rx.ret);
+	if (ret)
+		return ret;
+
+	*temp = msg.rx.temp;
+
+	return 0;
+}
+
+int acpm_tmu_set_threshold(struct acpm_handle *handle,
+			   unsigned int acpm_chan_id, u8 tz,
+			   const u8 temperature[8], size_t tlen)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	if (tlen > ACPM_TMU_TX_DATA_LEN)
+		return -EINVAL;
+
+	msg.tx.type = ACPM_TMU_THRESHOLD;
+	msg.tx.tzid = tz;
+	memcpy(msg.tx.data, temperature, tlen);
+
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_to_linux_err(msg.rx.ret);
+}
+
+int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
+				  unsigned int acpm_chan_id, u8 tz, u8 inten)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_INTEN;
+	msg.tx.tzid = tz;
+	msg.tx.data[0] = inten;
+
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_to_linux_err(msg.rx.ret);
+}
+
+int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			u8 tz, bool enable)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_CONTROL;
+	msg.tx.tzid = tz;
+	msg.tx.data[0] = enable ? 1 : 0;
+
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_to_linux_err(msg.rx.ret);
+}
+
+int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			  u8 tz)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_IRQ_CLEAR;
+	msg.tx.tzid = tz;
+
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_to_linux_err(msg.rx.ret);
+}
+
+int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_SUSPEND;
+
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_to_linux_err(msg.rx.ret);
+}
+
+int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_RESUME;
+
+	acpm_set_xfer(&xfer, msg.data, ARRAY_SIZE(msg.data), acpm_chan_id,
+		      true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	return acpm_tmu_to_linux_err(msg.rx.ret);
+}
diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.h b/drivers/firmware/samsung/exynos-acpm-tmu.h
new file mode 100644
index 000000000000..8b89f29fda67
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-tmu.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_TMU_H__
+#define __EXYNOS_ACPM_TMU_H__
+
+#include <linux/types.h>
+
+struct acpm_handle;
+
+int acpm_tmu_init(struct acpm_handle *handle, unsigned int acpm_chan_id);
+int acpm_tmu_read_temp(struct acpm_handle *handle, unsigned int acpm_chan_id,
+		       u8 tz, int *temp);
+int acpm_tmu_set_threshold(struct acpm_handle *handle,
+			   unsigned int acpm_chan_id, u8 tz,
+			   const u8 temperature[8], size_t tlen);
+int acpm_tmu_set_interrupt_enable(struct acpm_handle *handle,
+				  unsigned int acpm_chan_id, u8 tz, u8 inten);
+int acpm_tmu_tz_control(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			u8 tz, bool enable);
+int acpm_tmu_clear_tz_irq(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			  u8 tz);
+int acpm_tmu_suspend(struct acpm_handle *handle, unsigned int acpm_chan_id);
+int acpm_tmu_resume(struct acpm_handle *handle, unsigned int acpm_chan_id);
+#endif /* __EXYNOS_ACPM_TMU_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 1a0d98b55439..2cebc5456968 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -33,6 +33,7 @@
 #include "exynos-acpm.h"
 #include "exynos-acpm-dvfs.h"
 #include "exynos-acpm-pmic.h"
+#include "exynos-acpm-tmu.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
@@ -688,6 +689,17 @@ static const struct acpm_ops exynos_acpm_driver_ops = {
 		.bulk_write = acpm_pmic_bulk_write,
 		.update_reg = acpm_pmic_update_reg,
 	},
+
+	.tmu = {
+		.init = acpm_tmu_init,
+		.read_temp = acpm_tmu_read_temp,
+		.set_threshold = acpm_tmu_set_threshold,
+		.set_interrupt_enable = acpm_tmu_set_interrupt_enable,
+		.tz_control = acpm_tmu_tz_control,
+		.clear_tz_irq = acpm_tmu_clear_tz_irq,
+		.suspend = acpm_tmu_suspend,
+		.resume = acpm_tmu_resume,
+	},
 };
 
 static int acpm_probe(struct platform_device *pdev)
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index fbf1829b33db..08d9f5c95701 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -35,9 +35,27 @@ struct acpm_pmic_ops {
 			  u8 type, u8 reg, u8 chan, u8 value, u8 mask);
 };
 
+struct acpm_tmu_ops {
+	int (*init)(struct acpm_handle *handle, unsigned int acpm_chan_id);
+	int (*read_temp)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			 u8 tz, int *temp);
+	int (*set_threshold)(struct acpm_handle *handle,
+			     unsigned int acpm_chan_id, u8 tz,
+			     const u8 temperature[8], size_t tlen);
+	int (*set_interrupt_enable)(struct acpm_handle *handle,
+				    unsigned int acpm_chan_id, u8 tz, u8 inten);
+	int (*tz_control)(struct acpm_handle *handle, unsigned int acpm_chan_id,
+			  u8 tz, bool enable);
+	int (*clear_tz_irq)(struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, u8 tz);
+	int (*suspend)(struct acpm_handle *handle, unsigned int acpm_chan_id);
+	int (*resume)(struct acpm_handle *handle, unsigned int acpm_chan_id);
+};
+
 struct acpm_ops {
 	struct acpm_dvfs_ops dvfs;
 	struct acpm_pmic_ops pmic;
+	struct acpm_tmu_ops tmu;
 };
 
 /**

-- 
2.54.0.563.g4f69b47b94-goog

