Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D7C24167D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384098; cv=none; b=UuhvIUtcZQ2WmHyzVNC2VasIXjTQcan9ZZGig8nErDD1WLV5YCwLlHQ1VAU5KRwydfzoACRzwMUoEKg2LlbyYmkbnOGC/NVu8Q1dFLQZNQ8+i4li9rCmtsFmkLLHmzq93mPGTffs7jNIeMQtp3mP7EDJ+h47rD/ldac+Z/PgoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384098; c=relaxed/simple;
	bh=yJbsmqHNsqYyrsA8KdtCD6cvsa5ry8OHqgcCrFKEErI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gz/lc+Jz6/rU0o0rAytr9Np4oXc1no15y/E/quB8GRfBeYQMk48HwmMD/qwnSvm6jIoud+jDgZMJOMhYGUiCjvpnGRZmS0J0rtYkKrlPuwzbRT8MRklTVezFk10CFJV5/YPXy79zUzTts+nE7LJ3gGxjgvcSpk9U72vBQoraN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kz2uMZgE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kz2uMZgE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f5fc33602so2178810f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 00:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740384094; x=1740988894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANBTnMfI9AQjQqjIoJpw4o9wa0/J78oX/h2BbyetABQ=;
        b=Kz2uMZgEMadeTS47FT1Zf1cNRjERKdtp4B3fx62Uz18EYt6RHhpEab7alConNa0dz1
         k8P74GFLoAJky0lR9yaYhyL6nZqQ+pCr5uFHEDb8l6aGzoKXYR3kVi5Pi4h0CODOpBjn
         SX8VpSWepR9UdPwDu9jsOXgHr8pnKcRvARRpu7uZMeXpBn8iNENZboFsiTsun9dMU4xj
         2BCLchcuCLcKPyIzji2wkj+xc6FYXlRBOyMekpr966e5httGXKuWBgvZv9bNpWW/VLHo
         bhc6MQSbfgMkD+lkTNJt9KFngblrDEfeHtxmjALLjpBICNCnDYEh4hREsk6lIraE/3qt
         efyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740384094; x=1740988894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANBTnMfI9AQjQqjIoJpw4o9wa0/J78oX/h2BbyetABQ=;
        b=YWqF+r0vucRcSTk29iUqwKJnykDq+LtVWYY6vTlwkiGKGO2gPCBWTUVHBKmVfaKHVy
         cikIJcnHM6G2otj/191f+x1XmPkfpfpqmB4OfuuH3W+cielDHNQj5hzsIP9ZAfry8cxS
         6Jrz8Gsi2hfoqlaWFdtUHJDFmyk1h8RMVt3pY/zUyFl804ejJfPvHVnWlM76P80qM9Be
         ETSHXByEuwCpBz0tFOn7BRpJjhjB65+bIoAe5gdearuBwdxTd6kAro6WR/SiBIzKPqpH
         DTsM7F6fd/Y1PAwZtU9laXsRuUaGr3UvII+j3v/+dqxddFP0SZfsejvtA2rCBX6B2wNJ
         SANQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzjc7DE5aj0ktN9oqXV+ioAl0gT4BBbdl0+Pg+KJwSQAcJQaKir2+0nhHghS0//aOqsrMwdcd0CEjlfupdeHrYHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0LGW6+elRlGCjNygjkAreTEbd/ieD+zfoUkPhxK/z2+RGXZU
	mrLYUedv2e5gvLGLngXA8Noo2LMY4SPFLZRsm+Jlh8o4S2r9J5M5Yth3/P+8Q/kHWnOpVa+LdL2
	A9EE=
X-Gm-Gg: ASbGncssaY+ol7xVbzvHm8kdGbX8rtCOkcx3n+Xw3AA9EjPwe+Wl/YATfxFSpeVeUGU
	NMboOiz4+8DjV8+1Wpp8uw/cKYA5nI7PVFBTkWT5wU5/iDbYBr8QxOlVxOvjZWKyvbVOUP0XuMS
	lJJBCW3QtJRMf5rqhDizt7b3PsC9obtqytF2eiQ6aQUa3nvx2JMQC9jBsMzIDJ8B8qskc6g9+Xl
	l2FsREyk8tBaXZLFvieCqUF/du+DCJc4gWW3KudculeqJbGdl61UhbEGl/7XMumqKB8assYqn3c
	63dKyRe5nHd5KwU6zFREgJvmnHlW4GIzNxfN67/uJfAmKhRzyORRLcMuzSv2VuOs5ZY3M7Osgi5
	vz9CF0w==
X-Google-Smtp-Source: AGHT+IEqfqMAMX2FuVdCvP6EGCIXoyx24NwpIDqRPz+vP4XEI0A0Wy6Bj5qbITURwMDVrZtU+s5Seg==
X-Received: by 2002:a5d:6d8e:0:b0:38d:e420:3942 with SMTP id ffacd0b85a97d-38f61499154mr12080345f8f.3.1740384093973;
        Mon, 24 Feb 2025 00:01:33 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0367533sm97690395e9.27.2025.02.24.00.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:01:33 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 24 Feb 2025 08:01:24 +0000
Subject: [PATCH 3/3] firmware: samsung: add ACPM debugfs support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-acpm-debugfs-v1-3-2418a3ea1b17@linaro.org>
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
In-Reply-To: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740384089; l=16318;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=yJbsmqHNsqYyrsA8KdtCD6cvsa5ry8OHqgcCrFKEErI=;
 b=4WepINivv1JjzEyjhrwc6g4Yvi0pDVfys7W1afXQ2GW7ziUplgb4Z4xyvzjR4PA/cdg/5qrC0
 IeDT/72ZeonC/J/pHMioXXMC5bkqMwILOJ0MzA4O0AD/R/tawbzifYu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The ACPM firmware saves debug information to SRAM. Add debugfs entries
in order to expose the ACPM logs.

acpm_framework/logb_gprio_level controls the ACPM print verbosity to
the SRAM log buffer. It encodes a 64 bit value, 4 bits for each of the
16 Plugin IDs, with verbosity levels from 0xf (log error) to
0x0 (log debug).

echo 0xffffffffffffff1f > /sys/kernel/debug/acpm_framework/logb_gprio_level
Will allow only LOG_ERR prints for all Plugin IDs but Plugin ID 1,
which will issue prints for any log levels greater or equal to 1.
On the ACPM firmware side, logb_gprio_level has a default value of zero,
all logs enabled for all Plugin IDs.

acpm_framework/log_level has a maximum value of 2 and controls which
SRAM log buffers are printed.

Finally, acpm_framework/acpm_debug_cmd provides a way to issue
ACPM DEBUG commands to the firmware.

Add ACPM debugfs support with the above capabilities.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/Makefile              |   1 +
 drivers/firmware/samsung/exynos-acpm-debugfs.c | 359 +++++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.c         |  15 ++
 drivers/firmware/samsung/exynos-acpm.h         |  37 +++
 4 files changed, 412 insertions(+)

diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
index 7b4c9f6f34f5..ca6b71872ac3 100644
--- a/drivers/firmware/samsung/Makefile
+++ b/drivers/firmware/samsung/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
+acpm-protocol-$(CONFIG_DEBUG_FS)	+= exynos-acpm-debugfs.o
 obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
diff --git a/drivers/firmware/samsung/exynos-acpm-debugfs.c b/drivers/firmware/samsung/exynos-acpm-debugfs.c
new file mode 100644
index 000000000000..d839321d8901
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-debugfs.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/ktime.h>
+#include <linux/math64.h>
+#include <linux/workqueue.h>
+
+#include "exynos-acpm.h"
+
+#define ACPM_DEBUG_CMD				BIT(14)
+
+#define ACPM_PRINT_CONFIG			GENMASK(15, 14)
+#define ACPM_PRINT_CMD				BIT(13)
+#define ACPM_PRINT_SET_LOGB_GPRIO_LEVEL		1
+#define ACPM_PRINT_GET_LOGB_GPRIO_LEVEL		3
+
+#define ACPM_LOG_LEVEL_MAX			2
+#define ACPM_LOG_POLL_PERIOD_US			500
+
+/* Tick runs at 49.152 MHz, the period below is in picoseconds. */
+#define ACPM_APM_SYSTICK_PERIOD_PS		20345
+
+#define ACPM_DEBUGFS_ROOT "acpm_framework"
+
+enum acpm_debug_commands {
+	ACPM_DEBUG_DISABLE_WATCHDOG,
+	ACPM_DEBUG_ENABLE_WATCHDOG,
+	ACPM_DEBUG_SOFT_LOCKUP,
+	ACPM_DEBUG_HARD_LOCKUP,
+	ACPM_DBUG_EXCEPTION,
+	ACPM_DEBUG_NOTIFY_SHUTDOWN,
+	ACPM_DEBUG_RAMDUMP_ON,
+	ACPM_DEBUG_MAX,
+};
+
+struct acpm_log_buf {
+	struct acpm_queue q;
+	unsigned int qlen;
+	unsigned int mlen;
+	unsigned int rear_index;
+};
+
+struct acpm_log_info {
+	struct workqueue_struct *wq;
+	struct acpm_info *acpm;
+	struct delayed_work work;
+	struct acpm_log_buf normal;
+	struct acpm_log_buf preempt;
+	unsigned int level;
+	unsigned int poll_period;
+};
+
+union acpm_log_entry {
+	u32 raw[4];
+	struct {
+		u32 systicks0 : 24;
+		u32 dummy : 2;
+		u32 is_err : 1;
+		u32 is_raw : 1;
+		u32 plugin_id : 4;
+		u32 systicks24;
+		u32 msg : 24;
+		u32 systicks56 : 8;
+		u32 data;
+	} __packed;
+};
+
+static struct dentry *rootdir;
+
+static DEFINE_MUTEX(acpm_log_level_mutex);
+
+static void acpm_log_print_entry(struct acpm_info *acpm,
+				 const union acpm_log_entry *log_entry)
+{
+	u64 systicks, time, msg;
+
+	if (log_entry->is_err)
+		return;
+
+	if (log_entry->is_raw) {
+		dev_info(acpm->dev, "[ACPM_FW raw] : id:%u, %x, %x, %x\n",
+			 log_entry->plugin_id, log_entry->raw[1],
+			 log_entry->raw[2], log_entry->raw[3]);
+	} else {
+		systicks = ((u64)(log_entry->systicks56) << 56) +
+			   ((u64)(log_entry->systicks24) << 24) +
+			   log_entry->systicks0;
+
+		/* report time in ns */
+		time = mul_u64_u32_div(systicks, ACPM_APM_SYSTICK_PERIOD_PS,
+				       1000);
+
+		msg = readl(acpm->sram_base + log_entry->msg);
+
+		dev_info(acpm->dev, "[ACPM_FW] : %llu id:%u, %s, %x\n", time,
+			 log_entry->plugin_id, (char *)&msg, log_entry->data);
+	}
+}
+
+static void acpm_log_print_entries(struct acpm_info *acpm,
+				   struct acpm_log_buf *lbuf)
+{
+	union acpm_log_entry log_entry = {0};
+	u32 front, rear;
+
+	front = readl(lbuf->q.front);
+	rear = lbuf->rear_index;
+
+	while (rear != front) {
+		__ioread32_copy(&log_entry, lbuf->q.base + lbuf->mlen * rear,
+				sizeof(log_entry) / 4);
+
+		acpm_log_print_entry(acpm, &log_entry);
+
+		if (lbuf->qlen == rear + 1)
+			rear = 0;
+		else
+			rear++;
+
+		lbuf->rear_index = rear;
+		front = readl(lbuf->q.front);
+	}
+}
+
+static void acpm_log_print(struct acpm_info *acpm)
+{
+	struct acpm_log_info *acpm_log = acpm->log;
+
+	guard(mutex)(&acpm_log_level_mutex);
+
+	if (acpm_log->level == 0)
+		return;
+
+	if (acpm_log->level == ACPM_LOG_LEVEL_MAX)
+		acpm_log_print_entries(acpm, &acpm_log->preempt);
+
+	acpm_log_print_entries(acpm, &acpm_log->normal);
+}
+
+static void acpm_work_fn(struct work_struct *work)
+{
+	struct acpm_log_info *acpm_log =
+		container_of(work, struct acpm_log_info, work.work);
+	struct acpm_info *acpm = acpm_log->acpm;
+
+	acpm_log_print(acpm);
+
+	queue_delayed_work(acpm_log->wq, &acpm_log->work,
+			   msecs_to_jiffies(acpm_log->poll_period));
+}
+
+static int acpm_log_level_get(void *data, u64 *val)
+{
+	struct acpm_info *acpm = data;
+
+	*val = acpm->log->level;
+
+	return 0;
+}
+
+static int acpm_log_level_set(void *data, u64 val)
+{
+	struct acpm_info *acpm = data;
+	struct acpm_log_info *acpm_log = acpm->log;
+
+	if (val > ACPM_LOG_LEVEL_MAX) {
+		dev_err(acpm->dev, "Log level %llu out of range [0:%u]!\n",
+			val, ACPM_LOG_LEVEL_MAX);
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &acpm_log_level_mutex)
+		acpm_log->level = val;
+
+	if (acpm_log->level == 0)
+		cancel_delayed_work_sync(&acpm_log->work);
+	else
+		queue_delayed_work(acpm_log->wq, &acpm_log->work,
+				   msecs_to_jiffies(acpm_log->poll_period));
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(acpm_log_level_fops, acpm_log_level_get,
+			 acpm_log_level_set, "0%llu\n");
+
+/**
+ * acpm_logb_gprio_level_get() - get ACPM Log Buffer Group Priority logging
+ * level.
+ * @data:	pointer to the driver data.
+ * @val:	pointer where the ACPM Log Buffer Group Priority logging level
+ *		will be saved.
+ *
+ * The 64 bit hex value encodes the plugin ID log level request on 4 bits,
+ * supporting a maximum of 16 plugin IDs. Plugin ID 0 is described by
+ * GENMASK(3, 0), followed by the other plugin IDs in ascending order, up to
+ * plugin ID 15 which is described by GENMASK(63, 60).
+ * Value 0xf is log error level, and 0x0 is log debug level.
+ */
+static int acpm_logb_gprio_level_get(void *data, u64 *val)
+{
+	struct acpm_info *acpm = data;
+	struct acpm_xfer xfer;
+	u32 cmd[4] = {0};
+	int ret;
+
+	cmd[0] = ACPM_PRINT_CMD |
+		 FIELD_PREP(ACPM_PRINT_CONFIG, ACPM_PRINT_GET_LOGB_GPRIO_LEVEL);
+
+	xfer.txd = cmd;
+	xfer.txlen = sizeof(cmd);
+	xfer.rxd = cmd;
+	xfer.rxlen = sizeof(cmd);
+	xfer.acpm_chan_id = acpm->mbox_dbg_chan;
+
+	ret = acpm_do_xfer(&acpm->handle, &xfer);
+	if (!ret)
+		*val = (((u64)xfer.rxd[2]) << 32) | xfer.rxd[1];
+
+	return ret;
+}
+
+/**
+ * acpm_logb_gprio_level_set() - set ACPM Log Buffer Group Priority logging
+ * level.
+ * @data:	pointer to the driver data.
+ * @val:	64 bit hex value to set.
+ * The 64 bit hex value encodes the plugin ID log level request on 4 bits,
+ * supporting a maximum of 16 plugin IDs. Plugin ID 0 is described by
+ * GENMASK(3, 0), followed by the other plugin IDs in ascending order, up to
+ * plugin ID 15 which is described by GENMASK(63, 60).
+ * Value 0xf is log error level, and 0x0 is log debug level.
+ */
+static int acpm_logb_gprio_level_set(void *data, u64 val)
+{
+	struct acpm_info *acpm = data;
+	struct acpm_xfer xfer = {0};
+	u32 cmd[4] = {0};
+
+	cmd[0] = ACPM_PRINT_CMD |
+		 FIELD_PREP(ACPM_PRINT_CONFIG, ACPM_PRINT_SET_LOGB_GPRIO_LEVEL);
+	cmd[1] = val;
+	cmd[2] = val >> 32;
+
+	xfer.txd = cmd;
+	xfer.txlen = sizeof(cmd);
+	xfer.acpm_chan_id = acpm->mbox_dbg_chan;
+
+	return acpm_do_xfer(&acpm->handle, &xfer);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(acpm_logb_gprio_level_fops, acpm_logb_gprio_level_get,
+			 acpm_logb_gprio_level_set, "0x%016llx\n");
+
+static int acpm_debug_cmd_set(void *data, u64 val)
+{
+	struct acpm_info *acpm = data;
+	struct acpm_xfer xfer = {0};
+	u32 cmd[4] = {0};
+
+	if (val >= ACPM_DEBUG_MAX) {
+		dev_err(acpm->dev, "sub-cmd:%llu out of range!\n", val);
+		return 0;
+	}
+
+	cmd[0] = val | ACPM_DEBUG_CMD;
+
+	xfer.txd = cmd;
+	xfer.txlen = sizeof(cmd);
+	xfer.acpm_chan_id = acpm->mbox_dbg_chan;
+
+	return acpm_do_xfer(&acpm->handle, &xfer);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(acpm_debug_cmd_fops, NULL, acpm_debug_cmd_set,
+			 "0x%016llx\n");
+
+static void acpm_debugfs_init(struct acpm_info *acpm)
+{
+	rootdir = debugfs_create_dir(ACPM_DEBUGFS_ROOT, NULL);
+
+	debugfs_create_file("log_level", 0644, rootdir, acpm,
+			    &acpm_log_level_fops);
+	debugfs_create_file("logb_gprio_level", 0644, rootdir, acpm,
+			    &acpm_logb_gprio_level_fops);
+	debugfs_create_file("acpm_debug_cmd", 0644, rootdir, acpm,
+			    &acpm_debug_cmd_fops);
+}
+
+/**
+ * acpm_debug_get_params() - get debug parameters of the normal and preempt
+ * queues.
+ * @acpm:	pointer to the driver data.
+ */
+static void acpm_debug_get_params(struct acpm_info *acpm)
+{
+	struct acpm_shmem __iomem *shmem = acpm->shmem;
+	void __iomem *base = acpm->sram_base;
+	struct acpm_log_info *acpm_log = acpm->log;
+	struct acpm_log_buf *lbuf;
+
+	lbuf = &acpm_log->normal;
+	lbuf->q.base = base + readl(&shmem->log_base);
+	lbuf->q.rear = base + readl(&shmem->log_rear);
+	lbuf->q.front = base + readl(&shmem->log_front);
+	lbuf->qlen = readl(&shmem->log_qlen);
+	lbuf->mlen = readl(&shmem->log_mlen);
+
+	lbuf = &acpm_log->preempt;
+	lbuf->q.base = base + readl(&shmem->preempt_log_base);
+	lbuf->q.rear = base + readl(&shmem->preempt_log_rear);
+	lbuf->q.front = base + readl(&shmem->preempt_log_front);
+	lbuf->qlen = readl(&shmem->preempt_log_qlen);
+	lbuf->mlen = acpm_log->normal.mlen;
+}
+
+/**
+ * acpm_debugfs_register() - register ACPM debug capabilities via debugfs.
+ * @acpm:	pointer to the driver data.
+ */
+int acpm_debugfs_register(struct acpm_info *acpm)
+{
+	struct acpm_log_info *acpm_log;
+
+	acpm_log = devm_kzalloc(acpm->dev, sizeof(*acpm_log), GFP_KERNEL);
+	if (!acpm_log)
+		return -ENOMEM;
+
+	acpm->log = acpm_log;
+	acpm_log->acpm = acpm;
+
+	acpm_log->wq = alloc_workqueue("exynos-acpm-log-wq", 0, 0);
+	if (!acpm_log->wq)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&acpm_log->work, acpm_work_fn);
+	acpm_log->poll_period = ACPM_LOG_POLL_PERIOD_US;
+
+	acpm_debug_get_params(acpm);
+
+	acpm_debugfs_init(acpm);
+
+	return 0;
+}
+
+void acpm_debugfs_remove(void)
+{
+	debugfs_remove_recursive(rootdir);
+}
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 8d83841f1d62..53f0d3db3400 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -36,6 +36,7 @@
 #define ACPM_TX_TIMEOUT_US		500000
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
+#define ACPM_GS101_MBOX_DBG_CHAN	4
 
 /**
  * struct acpm_chan_shmem - descriptor of a shared memory channel.
@@ -130,9 +131,11 @@ struct acpm_chan {
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
+ * @mbox_dbg_chan:	mailbox channel number used for ACPM debug.
  */
 struct acpm_match_data {
 	loff_t initdata_base;
+	unsigned int mbox_dbg_chan;
 };
 
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
@@ -577,12 +580,17 @@ static int acpm_probe(struct platform_device *pdev)
 				     "Failed to get match data.\n");
 
 	acpm->shmem = acpm->sram_base + match_data->initdata_base;
+	acpm->mbox_dbg_chan = match_data->mbox_dbg_chan;
 	acpm->dev = dev;
 
 	ret = acpm_channels_init(acpm);
 	if (ret)
 		return ret;
 
+	ret = acpm_debugfs_register(acpm);
+	if (ret)
+		return ret;
+
 	acpm_setup_ops(acpm);
 
 	platform_set_drvdata(pdev, acpm);
@@ -590,6 +598,11 @@ static int acpm_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void acpm_remove(struct platform_device *pdev)
+{
+	acpm_debugfs_remove();
+}
+
 /**
  * acpm_handle_put() - release the handle acquired by acpm_get_by_phandle.
  * @handle:	Handle acquired by acpm_get_by_phandle.
@@ -698,6 +711,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
+	.mbox_dbg_chan = ACPM_GS101_MBOX_DBG_CHAN,
 };
 
 static const struct of_device_id acpm_match[] = {
@@ -711,6 +725,7 @@ MODULE_DEVICE_TABLE(of, acpm_match);
 
 static struct platform_driver acpm_driver = {
 	.probe	= acpm_probe,
+	.remove = acpm_remove,
 	.driver	= {
 		.name = "exynos-acpm-protocol",
 		.of_match_table	= acpm_match,
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index c212fe28758a..d22ffada29a6 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -19,12 +19,36 @@
  * @chans:	offset to array of struct acpm_chan_shmem.
  * @reserved1:	unused fields.
  * @num_chans:	number of channels.
+ * @reserved2:	unused fields.
+ * @log_rear:	rear pointer of APM log queue.
+ * @log_front:	front pointer of APM log queue.
+ * @log_base:	base address of APM log queue.
+ * @log_mlen:	log message length.
+ * @log_qlen:	log queue length.
+ * @reserved3:	unused fields.
+ * @preempt_log_rear:	rear pointer of APM preempt log queue.
+ * @preempt_log_front:	front pointer of APM preempt log queue.
+ * @preempt_log_base:	base address of APM preempt log queue.
+ * @preempt_log_qlen:	preempt log queue length.
+ * @reserved4:	unused fields.
  */
 struct acpm_shmem {
 	u32 reserved[2];
 	u32 chans;
 	u32 reserved1[3];
 	u32 num_chans;
+	u32 reserved2[6];
+	u32 log_rear;
+	u32 log_front;
+	u32 log_base;
+	u32 log_mlen;
+	u32 log_qlen;
+	u32 reserved3[24];
+	u32 preempt_log_rear;
+	u32 preempt_log_front;
+	u32 preempt_log_base;
+	u32 preempt_log_qlen;
+	u32 reserved4[64];
 };
 
 /**
@@ -41,23 +65,36 @@ struct acpm_queue {
 
 struct device;
 struct acpm_chan;
+struct acpm_log_info;
 
 /**
  * struct acpm_info - driver's private data.
  * @shmem:	pointer to the SRAM configuration data.
  * @sram_base:	base address of SRAM.
+ * @log:	pointer to the ACPM logging info.
  * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
  * @dev:	pointer to the exynos-acpm device.
  * @handle:	instance of acpm_handle to send to clients.
+ * @mbox_dbg_chan: mailbox debug channel.
  * @num_chans:	number of channels available for this controller.
  */
 struct acpm_info {
 	struct acpm_shmem __iomem *shmem;
 	void __iomem *sram_base;
+	struct acpm_log_info *log;
 	struct acpm_chan *chans;
 	struct device *dev;
 	struct acpm_handle handle;
+	unsigned int mbox_dbg_chan;
 	u32 num_chans;
 };
 
+#ifdef CONFIG_DEBUG_FS
+int acpm_debugfs_register(struct acpm_info *acpm);
+void acpm_debugfs_remove(void);
+#else
+static inline int acpm_debugfs_register(struct acpm_info *acpm) {}
+static inline void acpm_debugfs_remove(void) {}
+#endif
+
 #endif /* __EXYNOS_ACPM_H__ */

-- 
2.48.1.601.g30ceb7b040-goog

