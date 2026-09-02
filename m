Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CF3612DB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2026 04:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321957; cv=none; b=Wtr60H39Uj3dZyNjrMLExyBbdaFcQIlTOqH6HdLiGjeFLe1rCK9tUnhKTacCs8ODV+t+EPaVoKVgx9d0x5FoH4ElWOXIRkigjHrbnlzeDLIg4OsyVNTwUdpvM6o5zbQN/bIJaWRc8x2aqCkf/0OLJ0NqtkYNkrf+z8p/I+Nd1IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321957; c=relaxed/simple;
	bh=RGW62kuPKdpGZtlsWrT8q+dLZ60Gn74Urpdi1l5nyG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKq6Gk8Mh5vughRRnD118IvMwDv9EWvC7F4G27YwNUtKtm/eppjs6XioLhSaY/8B1JCxK+bFs2dNO9d9GyKqRQIlH9IsN/Fj/IPwNESVsD6aYZEh0SFC8sjuzZOnBdGIPO0gKmJLPUe/NQUFcSFFuS6axMEKEBOtlf1EIR54/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ro3Cw67f; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ro3Cw67f"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso4280455e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321951; x=1788926751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qMd2ZFBYSN7kxt9JqqMOCJYC6b6aEigB25kNAA0w7o=;
        b=Ro3Cw67fDyMs5tasVBlzpvz5ojIKVJfH/ggMZV7O+v4mijbkGBlWxbBGnTvmUhfczK
         kN8hRTOWeLJr+HovPkHQLY0IGgrzboPDfDvxWEX2l50mh4sKAjf+IjKCmATedrS4vb41
         EQEYAKwPQxlxWRT2wmCxGhaogS6qUtQUhw+Q/pMZZn2qSdn8wrac+GcwvU++yvr0HHfz
         WZC/dRcwIuZUw86x9v1HRB5RevquEEu4bP43c9xc8BWB9fhSykFvGx1D1a67x+9QEp2x
         ItbOefT8AUZXcAZelEtckcTlRABrClbrE85fUzz09pMhQ8fasyCVmpxF2J11MRrQvJnv
         eS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321951; x=1788926751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qMd2ZFBYSN7kxt9JqqMOCJYC6b6aEigB25kNAA0w7o=;
        b=Cc5otjHQFMTFlqEfSNaYjVyWg1G9RzUQrSWVerjZWSW0OBIBIGP4m9JguHSrKmqXKr
         54Nu0esPJPW21D+r02CHEzoa+uXrrudS6n3Ut4FXSyb3FXpHxN4AF69FHuaz1vkff2po
         Mh1WwN3wyafR17KBsW6kPjPLqZudQqi4z67y2ldihh1KOAsvatdPihcijf3Y7lKezbts
         Z6RDG3BgwshqyA04LX7b4ZxUE5OrcaWAu9SpwZ4jFQysv/Olef0QuYhf+AHls8K6qwA2
         MLkH1zhtpbg8Trloob20MmqxtXvUxnByR6/ET24irEo24uotIVC7pf+fKySaFqQ3GRF+
         x4Rw==
X-Gm-Message-State: AFuF++kHMaXXt1PwbXmpH4ohYGRsm0hlBslvNtjPqVnpGGSHeNXK0Y0G
	wDdLskY1Vu2tLDL2I0PKNIUV/UgQ+XYTifbbdUVAAHXMDxbbaWA/OKevsBekRXs2LO0=
X-Gm-Gg: AR+sD11G8KCiR9lvR9o4G54eJU9udXydHd0fmdnYF3gxEGZkBY7ZCj54WRGAgH9ZYYG
	HKLWz1SxX+RIUdhXiGRPsKi14dAcv4X9ov9pYmMLNinI1ZlAukA91nWdmc7fCSvnFiUdH2yRZOS
	gsWmmhNXxz4o61T6lFQj0Ba08BW/59aGfMpTQeJMaxxq60nm1x9U50nyOW3iNEUTgKwjJkjUiv3
	ztFwj5bHtKiyIojHmNhZ/A5XbHyojssCKiu9pVmd6tWOblwK4GzGhIgoKFAa/BSzjtp8sJeT9wF
	ejDGqWM0wyO7zQZpUG1k5eu6WecG6wM/xiAq8fVURvQDDBK4r3B/+OoeZjht/jNBASsLiUSsLAS
	RMnNNyvUNoQ3wyyVQyusQ9jjulget2Tf3Fcw3UgpAFc9Rx0oH/HXDYQZaFC3hmLC4sYU5W3Vh6L
	+hxF/9CjuHb7IRX55ReiBp6oTgfRvrtCS9YR1AMNo3l0IdpT6GAE6vxpK2dvJ8lzWk3oEzAyMNf
	V6IwVQ0iuotL26HHKHI+eUIFEQ/JUU7SS6WV/DgNx236slV2X8bF8dsOWSNbNs=
X-Received: by 2002:a05:600c:3b25:b0:49c:cfae:34d2 with SMTP id 5b1f17b1804b1-49ce55fb5f7mr29303145e9.4.1788321951546;
        Tue, 01 Sep 2026 21:05:51 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:50 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:41 +0100
Subject: [PATCH v6 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-4-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add cpuhotplug support for Exynos850 platforms. This SoC requires
its own specific set of writes/updates to PMU and PMU interrupts
generation block in order to put a CPU or a group of CPUs into
a different sleep states or prepare these entities for a CPU_OFF
or wake-up out of idle state or after CPU online.
Without these writes/updates the CPU(s) wake-up or online fails.

This also requires syscon regmap with raw spinlocks, so add
its initialisation to main exynos pmu probe() routine.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/Makefile                |  2 +-
 drivers/soc/samsung/exynos-pmu.c            | 24 ++++++++
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 drivers/soc/samsung/exynos850-pmu.c         | 95 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 5 files changed, 126 insertions(+), 1 deletion(-)

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
index 02076148c53d..19fd6ddd9498 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -92,6 +92,14 @@ static const struct regmap_config regmap_smccfg = {
 	.use_raw_spinlock = true,
 };
 
+static const struct regmap_config regmap_pmu = {
+	.name = "pmu_regs",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.use_raw_spinlock = true,
+};
+
 static const struct regmap_config regmap_pmu_intr = {
 	.name = "pmu_intr_gen",
 	.reg_bits = 32,
@@ -133,6 +141,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos7-pmu",
 	}, {
 		.compatible = "samsung,exynos850-pmu",
+		.data = &exynos850_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
@@ -482,6 +491,21 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 		ret = of_syscon_register_regmap(dev->of_node, regmap);
 		if (ret)
 			return ret;
+	/*
+	 * For SoCs that support cpuhotplug/cpuidle via PMU updates callbacks.
+	 * Such callbacks are executed under raw_spinlock so we need a custom
+	 * regmap too.
+	 */
+	} else if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
+		regmap = devm_regmap_init_mmio(dev, pmu_base_addr, &regmap_pmu);
+		if (IS_ERR(regmap))
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "hotplug regmap init failed\n");
+
+		ret = of_syscon_register_regmap(dev->of_node, regmap);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to register hotplug regmap with syscon\n");
 	} else {
 		/* let syscon create mmio regmap */
 		regmap = syscon_node_to_regmap(dev->of_node);
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 733e188fa2b1..4ecbf53cd4f7 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -104,6 +104,7 @@ extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
 extern const struct exynos_pmu_data gs101_pmu_data;
+extern const struct exynos_pmu_data exynos850_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/exynos850-pmu.c
new file mode 100644
index 000000000000..0503c54d6363
--- /dev/null
+++ b/drivers/soc/samsung/exynos850-pmu.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Exynos850 PMU support
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/bits.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+#include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/topology.h>
+#include <asm/cputype.h>
+
+#include "exynos-pmu.h"
+
+static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	int cluster_id, core_id;
+	u32 reg, mask;
+
+	cluster_id = topology_cluster_id(cpu);
+	if (cluster_id < 0) {
+		pr_err_ratelimited("invalid cluster ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	core_id = topology_core_id(cpu);
+	if (core_id < 0) {
+		pr_err_ratelimited("invalid core ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpu), CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR, reg & mask);
+
+	mask = (BIT(cpu + 8));
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR, reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(cluster_id, core_id), 1 << 3, 1 << 3);
+	return 0;
+}
+
+static int exynos850_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	int cluster_id, core_id;
+	u32 reg, mask;
+
+	cluster_id = topology_cluster_id(cpu);
+	if (cluster_id < 0) {
+		pr_err_ratelimited("invalid cluster ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	core_id = topology_core_id(cpu);
+	if (core_id < 0) {
+		pr_err_ratelimited("invalid core ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpu), CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR, reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(cluster_id, core_id), 1 << 3, 0 << 3);
+	return 0;
+}
+
+const struct exynos_pmu_data exynos850_pmu_data = {
+	.pmu_cpuhp = true,
+	.cpu_pmu_offline = exynos850_cpu_pmu_offline,
+	.cpu_pmu_online = exynos850_cpu_pmu_online,
+};
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 9c4d3da41dbf..c7a82635fc36 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1015,6 +1015,11 @@
 #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
 #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* Exynos850 PMU Alive */
+#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
+#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + (((cl) * 0x400) + ((cpu) * 0x80)))
+#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
+
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)

-- 
2.51.0

