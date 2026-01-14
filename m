Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688232E1F02
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400243; cv=none; b=YfU6TF336a8rp9T8FUq2Rg6w4Jm5j+jqeFxGb12yJJcfs0BoTyM2/LdAyxeisoT/qyGUfcYW+MHma+CHYlolNwMrDQyiG9Ivw+CL8VpTRp87whaujM1g8Vq9Sn3QPNPiAtqxvlq/efaI4IMAFKWBgWVs+wHCUItdyKEAAOfxoL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400243; c=relaxed/simple;
	bh=scZVLwTECj4CGzumXSOMKU8Ox6ZHln+/s1mUJJlsDnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZX0N9QQsnfDNdH69oSOK/HDSqiiSl+8M1r3xCde/in4cwhqmX3x2Ljv6vRAHgsB+gqVOjl72lmCx3tM0qOuJFvUEZK6+Ix0yOQDeeAPDcfict4dq+CTJqGMRryDtXHi5uOvQas7dyKqY2aEOJ/aMmoLFT2QdsHdKQjstq00ato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vyXj9OQx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vyXj9OQx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563e28a3so5981275e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400236; x=1769005036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUpc7tPcYauEJYqevhj0yziHsT/ZtjU3a5lZkEZyS1w=;
        b=vyXj9OQxuGNd3gMpdt5ywRHr+7FxdNcTSon0/pXhS6rznhF0WD27kBFhJc6tpExwXv
         pTZ3wwDSG0nesHCwIyuRPcWcuVL/IJylg+eUwQOghk2qjpMXkWquPqP23anm9L4UHrx9
         GXt4W9fZkJ+KW0cHAmOlupXM+0j1gmbHxCBrrfnCGnLs270ot1ryP9SG1J3yXWFCeOig
         iVFleKwWWdIzc1dBCF/1EsNMrpYELNJcDrEjVBQvhk0kNbCGf3jPNUPx9SM8TilwDKlo
         HGso+57f+OXA+gxj3TtAaleOpdnECKG6KtfgVi/sLYkGbzJ05A+4DSobCQ7mfgvtCjIr
         UzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400236; x=1769005036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUpc7tPcYauEJYqevhj0yziHsT/ZtjU3a5lZkEZyS1w=;
        b=beereH5ZxV9FqcTNyFvxCav9cgc60p9jQdje77QhFgGLzzxzwTt6cLpivWkiuSCxvz
         rBKC+4hgZy9j8BWwFOp+Qq6wIzpSC/nyGCAYrjZgL9LmZbqFyha3mro9QJUw7F0dV4BQ
         JBHnIMhUyVzlVqEiYea5gwJcLXu8qsqPnmg8elW167EY2/rUpnmoA+3GOMhxmBLqO1Rm
         IlfkfJt+HE+7HXJAqIp5FyJyeU3kJVwX/ugajrvv/7gYwM8mOHfepcIx9lhowGejssoR
         vN7z5Ea+Lpgm91nvq+j53JVZF8CKGcsOHcNhCzQgsvqQ35oALa5UmP3iFOh8vibK19TU
         LCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZorWu7IfrmYbdf0djzWSqLEzwx5s3cLmYidyY6TJbye/PhHl4Vy0IqqEjw1otrJ5X0W5H8WrZPfGHy525Avl4/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YykIxOKWojlovKHisZcTjLvBQiyzVcwA737pBI7do67DeKAmVlI
	PbAvy2CvOlw1hEsmB4XIlvV1WsAQ9IW97uy7Nfl0v4Hx0jtulEfuqzve5quNG22Lg6Y=
X-Gm-Gg: AY/fxX76et7Xb4m/JS50GZMgmzsKH26ZsQb55OFojTfhs73rdfU5xzSZhbxuRk8OOiH
	aGMYmSoE0wqZYZozB0m9aBn5mXuY3hsHJu+SMMHKPOsa8Qr/pEq1QUCtmbouagWBvSegmfX3gix
	SsmVWyyYS0j4hF8DgqPL8mxTd0QwupKMpdnHuo7jQeS8sRs3tF2DyshonqpwAPjFmrXYkao1Vkz
	x05chQSCuVlDisnYEMOd29/aULAdG74jdJVHX2PAtczK6pe6gDmYz/u42X1SRFSyLhuaPel1DD8
	1+ik7IRxGE0nkXH4ZAoIfLVyGAK5I1sCDF01UL/9n/XDYhdmmGeMg3RioFBnuDA6rce9iRnr5N4
	EjNLfqWGQvThPvFnrPqkeWPvWEgO68Ma9t9blz7fVTXCqs3/urEldaJuxbI8QIAYaQVWhtkZDps
	I86OcoK+37UTi8nWn0BwJvbY4EpiNfWYUL812aq8gkXqdRutYrrfG1v9ladrwwjP24gRJa6Q==
X-Received: by 2002:a05:600c:747:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-47ed7c284f3mr55537135e9.12.1768400235738;
        Wed, 14 Jan 2026 06:17:15 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:14 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:32 +0000
Subject: [PATCH 4/8] firmware: samsung: acpm: Add TMU protocol support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-4-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=11917;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=scZVLwTECj4CGzumXSOMKU8Ox6ZHln+/s1mUJJlsDnc=;
 b=5mBrS0mafIwBfkzAx7jh6ZJxc7p3Byf+AqDcw5Ue/nSlE+ZkDs76evSOIhSrOHLU1kRnnU0Oc
 B2lX0e++yktClE8dn7EwV6KxxKpjWxAEcl8FGBqCsiOlyY9Yx+lm++m
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Thermal Management Unit (TMU) on Google GS101 SoC is primarily
managed by the Alive Clock and Power Manager (ACPM) firmware.

Add the protocol helpers required to communicate with the ACPM for
thermal operations, including initialization, threshold configuration,
temperature reading, and system suspend/resume handshakes.

This architecture requires a split responsibility between the kernel
and firmware. While the kernel can read the interrupt pending status
directly via a syscon interface (for low-latency sensor identification),
it shall not write to the status registers directly. Instead, the kernel
must issue an ACPM IPC request (`ACPM_TMU_IRQ_CLEAR`) to acknowledge
and clear the interrupt, ensuring the firmware's internal state machine
remains synchronized.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++++
 drivers/firmware/samsung/exynos-acpm.c             |  12 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  24 +++
 5 files changed, 282 insertions(+)

diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
index 80d4f89b33a9558b68c9083da675c70ec3d05f19..5a6f72bececfd98ba5af37d1d65fed48a3d8f912 100644
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
index 0000000000000000000000000000000000000000..7ec4b48074eb8b4e569b39d4bb5963d887aa9521
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/ktime.h>
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
+#define ACPM_TMU_HYSTERESIS	0x16
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
+} __packed;
+
+static void acpm_tmu_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
+			      unsigned int acpm_chan_id)
+{
+	xfer->acpm_chan_id = acpm_chan_id;
+	xfer->txd = cmd;
+	xfer->txlen = cmdlen;
+	xfer->rxd = cmd;
+	xfer->rxlen = cmdlen;
+}
+
+int acpm_tmu_init(const struct acpm_handle *handle, unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_INIT;
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_read_temp(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, u8 tz, int *temp)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_READ_TEMP;
+	msg.tx.tzid = tz;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	*temp = msg.rx.temp;
+
+	return 0;
+}
+
+int acpm_tmu_set_threshold(const struct acpm_handle *handle,
+			   unsigned int acpm_chan_id, u8 tz,
+			   const u8 temperature[8], size_t tlen)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int i;
+
+	if (tlen > ACPM_TMU_TX_DATA_LEN)
+		return -EINVAL;
+
+	msg.tx.type = ACPM_TMU_THRESHOLD;
+	msg.tx.tzid = tz;
+
+	for (i = 0; i < tlen; i++)
+		msg.tx.data[i] = temperature[i];
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_set_hysteresis(const struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, u8 tz,
+			    const u8 hysteresis[8], size_t hlen)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int i;
+
+	if (hlen > ACPM_TMU_TX_DATA_LEN)
+		return -EINVAL;
+
+	msg.tx.type = ACPM_TMU_HYSTERESIS;
+	msg.tx.tzid = tz;
+
+	for (i = 0; i < hlen; i++)
+		msg.tx.data[i] = hysteresis[i];
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_set_interrupt_enable(const struct acpm_handle *handle,
+				  unsigned int acpm_chan_id, u8 tz, u8 inten)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_INTEN;
+	msg.tx.tzid = tz;
+	msg.tx.data[0] = inten;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_tz_control(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 tz, bool enable)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_CONTROL;
+	msg.tx.tzid = tz;
+	msg.tx.data[0] = enable ? 1 : 0;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_clear_tz_irq(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 tz)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_IRQ_CLEAR;
+	msg.tx.tzid = tz;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_suspend(const struct acpm_handle *handle,
+		     unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_SUSPEND;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_resume(const struct acpm_handle *handle, unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_RESUME;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.h b/drivers/firmware/samsung/exynos-acpm-tmu.h
new file mode 100644
index 0000000000000000000000000000000000000000..f1a1ac21736d52bea0ad2a7cb3b280201fa74ffe
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-tmu.h
@@ -0,0 +1,33 @@
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
+int acpm_tmu_init(const struct acpm_handle *handle, unsigned int acpm_chan_id);
+int acpm_tmu_read_temp(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, u8 tz, int *temp);
+int acpm_tmu_set_threshold(const struct acpm_handle *handle,
+			   unsigned int acpm_chan_id, u8 tz,
+			   const u8 temperature[8], size_t tlen);
+int acpm_tmu_set_hysteresis(const struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, u8 tz,
+			    const u8 hysteresis[8], size_t hlen);
+int acpm_tmu_set_interrupt_enable(const struct acpm_handle *handle,
+				  unsigned int acpm_chan_id, u8 tz, u8 inten);
+int acpm_tmu_tz_control(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 tz, bool enable);
+int acpm_tmu_clear_tz_irq(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 tz);
+int acpm_tmu_suspend(const struct acpm_handle *handle,
+		     unsigned int acpm_chan_id);
+int acpm_tmu_resume(const struct acpm_handle *handle,
+		    unsigned int acpm_chan_id);
+#endif /* __EXYNOS_ACPM_TMU_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 0cb269c7046015d4c5fe5731ba0d61d48dcaeee1..cc045370f4b0dc6ccea99e3c2d6f86a43b2e9671 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -31,6 +31,7 @@
 #include "exynos-acpm.h"
 #include "exynos-acpm-dvfs.h"
 #include "exynos-acpm-pmic.h"
+#include "exynos-acpm-tmu.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
@@ -595,6 +596,7 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 {
 	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
 	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+	struct acpm_tmu_ops *tmu_ops = &acpm->handle.ops.tmu;
 
 	dvfs_ops->set_rate = acpm_dvfs_set_rate;
 	dvfs_ops->get_rate = acpm_dvfs_get_rate;
@@ -604,6 +606,16 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 	pmic_ops->write_reg = acpm_pmic_write_reg;
 	pmic_ops->bulk_write = acpm_pmic_bulk_write;
 	pmic_ops->update_reg = acpm_pmic_update_reg;
+
+	tmu_ops->init = acpm_tmu_init;
+	tmu_ops->read_temp = acpm_tmu_read_temp;
+	tmu_ops->set_threshold = acpm_tmu_set_threshold;
+	tmu_ops->set_hysteresis = acpm_tmu_set_hysteresis;
+	tmu_ops->set_interrupt_enable = acpm_tmu_set_interrupt_enable;
+	tmu_ops->tz_control = acpm_tmu_tz_control;
+	tmu_ops->clear_tz_irq = acpm_tmu_clear_tz_irq;
+	tmu_ops->suspend = acpm_tmu_suspend;
+	tmu_ops->resume = acpm_tmu_resume;
 }
 
 static void acpm_clk_pdev_unregister(void *data)
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 2091da965a5ad238b5e16c567a72fe88fafe6095..43d41e11ad2eb985e27a918ce3f9e9ac15a194ee 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -40,9 +40,33 @@ struct acpm_pmic_ops {
 			  u8 value, u8 mask);
 };
 
+struct acpm_tmu_ops {
+	int (*init)(const struct acpm_handle *handle,
+		    unsigned int acpm_chan_id);
+	int (*read_temp)(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 tz, int *temp);
+	int (*set_threshold)(const struct acpm_handle *handle,
+			     unsigned int acpm_chan_id, u8 tz,
+			     const u8 temperature[8], size_t tlen);
+	int (*set_hysteresis)(const struct acpm_handle *handle,
+			      unsigned int acpm_chan_id, u8 tz,
+			      const u8 hysteresis[8], size_t hlen);
+	int (*set_interrupt_enable)(const struct acpm_handle *handle,
+				    unsigned int acpm_chan_id, u8 tz, u8 inten);
+	int (*tz_control)(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 tz, bool enable);
+	int (*clear_tz_irq)(const struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, u8 tz);
+	int (*suspend)(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id);
+	int (*resume)(const struct acpm_handle *handle,
+		      unsigned int acpm_chan_id);
+};
+
 struct acpm_ops {
 	struct acpm_dvfs_ops dvfs_ops;
 	struct acpm_pmic_ops pmic_ops;
+	struct acpm_tmu_ops tmu;
 };
 
 /**

-- 
2.52.0.457.g6b5491de43-goog

