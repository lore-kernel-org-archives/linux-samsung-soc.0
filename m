Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04444103C
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067572; cv=none; b=Rw+DSMyNVF7AGyE6+n86bDqSlk7FDOrdoX0a/OA7DkabVmpbU2RvnhKHo+FQgJwHJn0ONIlLyiEkB6rAdsO9Njj3ftA479LB1WUfUN6TtsI0sA9WWbaa1GybQmeXdOesv0IP8PL+NnWt3CmbxQ54fLEDPEoiiOwl5yXyUm6WEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067572; c=relaxed/simple;
	bh=QM9RYjOEFgDZVWzh43f8lIp1ObP7OwsYnx52jyglobE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ylp7MeGk82+MNmgEo0c74W5FTx7ID36ExJ6K2ao4sH0Z08AzXGY+iDMwS+PmPQ0EDw/MPsHusfo4rEbEKbbZZTpQAoEsRGC8VdRXLvvvw7Cs+IyZx58OWwzpgXabBoR2B0n9NV9614V5W/66oOMXySmpTQmsjzlnumTCDXq3HnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gbIa1Cj1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gbIa1Cj1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d73422431so5946881f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067569; x=1778672369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HYyI02VI5DS9H0X7Gd0os9Aeh6ziMH+nrP+zg8t06g=;
        b=gbIa1Cj1A+4QEQrOsu2hkMSO+wvOqo3CG2WT2LQMr+/FPNj+hrU4pSMBljYrNOWPz0
         MerAKWDs7aRaYJZBE9p+VBp2wtIEtBv3QLbUIs3h/uUyJ3WvuewqQP7Tci7dft7jkKkA
         syG7A8BCo7wYrpAMhuwdb4dFD8R+EmiwAiSH/DJzHyPEzmk29M8QurPvvP9YTr0nNpB0
         69/a/MC/vMf55bF1pNyWDPNcANS82Nl0VkgHSucwOCNVFDmXh0G9KRdRG6F4VEHVz+UM
         xJzowi8ZR6FcV+AJFCezWm3IQuBRgVhXnG9hcnpEabaWny0zxtc4PnmdyNaH0+c/1xqJ
         HeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067569; x=1778672369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HYyI02VI5DS9H0X7Gd0os9Aeh6ziMH+nrP+zg8t06g=;
        b=tFYXGGp/Wyp94Jao04+toHZfMIY4Ij3TUTru2zzrblaW2P8usNSYzzSpqSI1J/DbhX
         wmtWfeoRT/p/zdYV7O6ntSHdStG4aBv1wcbKu2XDxNFKUNtF9qzwU4aIQ858WsIz/BHU
         8SdhQ8MQ/IsacYwnyPn4dIxn5kcFkOfQ53Fl3j3ti02bBTKo+LA/BZfoKPUl7iszAXAQ
         RKazdT47Y8vPK+j1R9TCEFRgjFEQ8mQFcbqG2Oa1JTj4QT7sWWLcrsHct3+BdjR1LQ9h
         jbPARO0ngGET2XaVxuElj63ctYzXqQ7BZDCarv1zZikbu0AXlFrQzani4h9Hf60T0vTO
         PSbw==
X-Forwarded-Encrypted: i=1; AFNElJ9Bs5kp7DsvxZq/0v3OUD8/4gSn9Segjn5i/Pp3GNXauawP27RvqaM8Gsu4mgV/vWWABYcX8mBJSASVm6is/xINHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFffkDa1JRIfdbCEm4yeZ8pv5wOxjbxCX9tFJ9UYdMRTLH36id
	OFEQ31Hj6CL5aCrMDhMgS7pYW9AM4JjJdstFnO1SvejBjgkf/QgY7H+vlhHy+ieidh4=
X-Gm-Gg: AeBDietCEkHyxBRwDsN+HLmcauQGrVxyg7/YrnkQW8xlBZ92Epy1QKsiW5J+z/XVQFw
	7Q2PWw82SJy21Qh96lbSgUJHD0v/YWAkDzZ8cIQ5+4vprtCAbCvX0X1ZLKIo2LO1BJf0c3rjZFL
	LfbK5E29BZZ5XUdetTGV+Rj9JWlTzES9fCFSnRF+3hUQ293wmKdZOUFTOcRbSiGnJdjAkHWd6Nc
	UDh7Pzz1ZhkSGDTVK8MjXFdYr2lJ/EekToU5DWXQtHYiPNVla3uZm0j1vnTEh6xGJu/UbuhxNxJ
	LXoYXufVOcWyM5C5NuteQEstbaNZXInX2vDD2citLLWSzs59WADxO+VL0Zy2tHq2faVVJv1BGwL
	3GWeN87PR8Y1grMHAJ2QfWicquI2sENGs9jkM3ySVS5fxiq2/quiFeBFUd6P9eoWs4qMJdflt9L
	Ru3mY/OO5TRIDTzg6v63AfzeHSedXAhoPR+5fxLlYPVCdpbsrovEeD0FkzIHJ2G9NooD7gxtZuM
	XRqNnawV1ZGn0Vs1A==
X-Received: by 2002:a05:6000:144b:b0:43d:714:34e5 with SMTP id ffacd0b85a97d-4515ce1bd58mr5254777f8f.24.1778067565282;
        Wed, 06 May 2026 04:39:25 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:07 +0000
Subject: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=10615;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QM9RYjOEFgDZVWzh43f8lIp1ObP7OwsYnx52jyglobE=;
 b=vfc9c2R8gfdwg8hpbY5ROTsxrJQaJ1cWOIgnhw13SWynhDZVUghnHV50nJ59ymbnauzbv32RH
 gA7rzLLSFEDDkVIUxTvDiE/9+aIGwREiskC7Rpbqvx5TWw7oqHGGfAT
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
2.54.0.545.g6539524ca2-goog

