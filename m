Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B48382389
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019125; cv=none; b=Ngm9ehNFt+yfd3uu2b/HfOUx7KelubJYNxNdDiA6eXOUITWY0wDktBHDRzEkhBlIo8dfIf6fMNXytnKKlyekF1fRO4chgS0AXkg5jILIxXTS1PCk4beVuqoJynsAsokyZBVJonP7u+G/0ChXoS0ihPscosz8K40HDRY3LqGAmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019125; c=relaxed/simple;
	bh=7reYL9u9yu0o0oYpxGh8+j55r/WVXNpV8HdXdXWVoNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivXYFnw3gjDVCAcksp1REeQkWG2bINiTkwlejTSpxvYgVVgW1UiX4sqJTC6XLw5NgLznCW8mvXwaKjHE0X2Yf8V5wpGpaFP5o9ylU+FMWrS+/pWcbiDI0j92xhKyUdkjYg2TQQ3pecqFleGtRq/tcCrJpYCtYoNBXvoGn8h2GMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lCSAbSw7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCSAbSw7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so280228f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019122; x=1775623922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTNQgtcGgWusaEhxSP7vJ5UQwxZZkpM6k5bEc+uCqNI=;
        b=lCSAbSw7P2uI4f17yyQLI9xabnxyWkeF1PPxLarU7Wz50M6gNeB+sTlRGdkYCazi4u
         nPIlG7qVeAFVZ2n5ooEPEYN9PDWChiEfjdN7CMZnpIyS7skGuiOdqxcA3W7DJOS+VCCE
         JehDlOPHZXY3JmBNGx1pqhqbONTKUe9C54qMHqeeIhPz3RwqTzGqS+i7aNCiF6DUH6fl
         B3KLEJzhLJHPdVUGg5sUFQGUWws2F5J1cOtE31LXoUvkYKG6jdBo/ebUxrWwdaSx/wvV
         /qbP5SQNOWopxFmcGXqgRSnDe2OUKYDLpQX25PmUBFKQCj9Vsm4fBKOJiqJ6hDWWkoQ+
         Sh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019122; x=1775623922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTNQgtcGgWusaEhxSP7vJ5UQwxZZkpM6k5bEc+uCqNI=;
        b=Qg4rJOakAve8FE3Xo8n59Vb/wy3fvBhV74cTUzZsujDcliDElGjmp2hmdMwDxCf13T
         o8TesJciDK9c1torVTOXcRRsW78vPYQO/ropQuEWoZ56vozlmp+HL9c2ElaZLN02AORw
         oOd4QwcKpaC79Uq9Dc9p3zZmwWI5PWU6VEQd3Y8oSNnAPLLhAe9MvErue/s3NtxlO38P
         GQ7Gtx7DV5dlQ7KsrxktVljxDvOYkAX/kMgezgKnPyenHo6Fv990Dc+0QQoA5fXnxY7o
         Qut2wMz4oNSCO1b3uzE8/kXB05GPScDd12O6+C5tEv7t4ZrlW77wOl2hkyU4EW/2t0Sv
         c6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCW2dyZz/rFiUOMTBVmwoGiTBICzhOCSbx3Wq/LJhoneDRjBDwji3gNM2fxqiXBrMlQoJ2WWJMHuXnwuJMNg3CvGrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEF+C6L6IoJKQA5yK0IiM+mR7RNQRI7EMfndTUNqFiVy2FAua
	TTyHdhGaI2lqsA5gPyTeybMPeKlwbz4Asq+JjF/Nn2AkeWSFi/2T/v/GXWQamT+/ejA=
X-Gm-Gg: ATEYQzyWnk52A1ju//ZH8VPgi/fVBu93XM07RgXmjTymJMTPWx6wvOOfex1orcvyU0U
	hK1+WqhS5/UcxQMJCy8o1G6rgGcfyNiT7d0Kpvt5ZIAUq4F4icRmmxgKK59KdPlGdeju0NOCC24
	vq/TwEOu131Im1gVXu1kJOmA13J9x7ighbsTmHzM4DcQfEE2Hgj5wyqr6+ip7wVyDHKi1IvCZUN
	nrWxh/yv+NW4SkL4XrOHMTAfQVs9e18vMLgd9G1OcbgJGNuRhWwOOtVCV+cvcnFUg5dtLk4+RXU
	NOss12Ce8YlP1IZlEbg/zbhGSvmM0hgkXLUyDWixUTu5osgmV+MqIThd82QhxjB3pcVArvLd0a2
	MYtU35QWiWDcCKYWfW73brzKAHEeMlZ2msKHlkv+Q9qL9OhvunOBCw5N5pw5iFoRDRYvtuq8VGs
	h+V5EjvV0RLIbbRUNLr/pYZe4RXyP0t1ItSnJa3dpbwLTjGRIr53uD3p37TSPwvMnJUZJ9zWB2T
	uACcysncrmPLq/s
X-Received: by 2002:a05:6000:2383:b0:43b:5462:1807 with SMTP id ffacd0b85a97d-43d155d0020mr3170506f8f.11.1775019122073;
        Tue, 31 Mar 2026 21:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:52:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:58 +0100
Subject: [PATCH v2 5/7] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add cpuhotplug support for Exynos850 platforms. This SoC requires
its own specific set of writes/updates to PMU and PMU interrupts
generation block in order to put a CPU or a group of CPUs into
a different sleep states or prepare these entities for a CPU_OFF
or wake-up out of idle state or after CPU online.
Without these writes/updates the CPU(s) wake-up or online fails.
While at this, also add description of Exynos850 PMU registers.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/Makefile                |  2 +-
 drivers/soc/samsung/exynos-pmu.c            |  1 +
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 drivers/soc/samsung/exynos850-pmu.c         | 78 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 5 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 636a762608c9..7f544e3c1fcc 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -7,7 +7,7 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
 
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
-exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
+exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o exynos850-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
 					exynos5250-pmu.o exynos5420-pmu.o
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 4e5fcc01e5e0..daa870ba88f5 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -133,6 +133,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos7-pmu",
 	}, {
 		.compatible = "samsung,exynos850-pmu",
+		.data = &exynos850_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 186299a049a8..4202d3cd94c9 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -102,6 +102,7 @@ extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
 extern const struct exynos_pmu_data gs101_pmu_data;
+extern const struct exynos_pmu_data exynos850_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/exynos850-pmu.c
new file mode 100644
index 000000000000..b3841547577a
--- /dev/null
+++ b/drivers/soc/samsung/exynos850-pmu.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Exynos850 PMU support
+ */
+
+#include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/regmap.h>
+
+#include "exynos-pmu.h"
+
+static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
+	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
+		     CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	mask = (BIT(cpu + 8));
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
+		     reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
+			   1 << 3, 1 << 3);
+	return 0;
+}
+
+static int exynos850_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
+	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
+		     CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
+		     reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
+			   1 << 3, 0 << 3);
+	return 0;
+}
+
+const struct exynos_pmu_data exynos850_pmu_data = {
+	.pmu_cpuhp = true,
+	.cpu_pmu_offline = exynos850_cpu_pmu_offline,
+	.cpu_pmu_online = exynos850_cpu_pmu_online,
+};
+
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 9c4d3da41dbf..93c4d724c8ea 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1015,6 +1015,11 @@
 #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
 #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* Exynos850 PMU Alive */
+#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
+#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + ((cl * 0x400) + ((cpu) * 0x80)))
+#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
+
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)

-- 
2.51.0

