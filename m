Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190CE4D90C5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 17:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026780; cv=none; b=ZHRa1zHKH/xgP+BZe6jpfPL3DEiAgmeiiKS6f/25Zmmdhb5cxMb+SAvWYgwlcqxCf0qDeipe3HIhIQf6na/9Yr2a26yvuVT+UzBbji7lR9XNJ9xbz9BWv9GPbhZ2/RQSIfzgrmQwIQQ8yHDpxY/XGQEaiRxrDqAovkkzV2K4uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026780; c=relaxed/simple;
	bh=MpUwtHrcE2f2P9KEnasR5qf8DqgzWcovx76cdQfNQDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdoJa7XF2DN4/7NSm93miz8BwLg0m5ehQHBbEcmb/BepB3mFqSdzSTI2AyVJetjMAIem9TBABrdlnMWjl8b55KDm7odlrSkBlfgMgysF0CfYJV29jSXpLwJS8+R7UclmsgkXi0VGccfh1jbJ19NrEBY124Ng2EVYkIctunNXc/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTM4GFjt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTM4GFjt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so4062269f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026776; x=1781631576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGQrR+jXL+gF7NqNgSXEOVcz9vJ1tDVxV1V33ex2f1s=;
        b=bTM4GFjtOmKnXkZPZVNd6Ndf189ZhkXvDupV+hrFq93a4lNbzZP70wKs3nr6CsIEpK
         yhJ8NHKvzGZoaeFx4DqpVX13eAf2/jHpbHu5KYDTyphzpF0adzZD2eYsH+DS3wDA++E2
         +U/KABVViwGNQo0VKmn7eHAU23Rch763W6yT9ipo1Ew90t0LmNkvQG4uwtosd4lVNOPS
         mlMojSPDDGqH48ecKfthpKvsLm7zBnp0bv7VTWOiBjV408hFNlEf1OQuEnmTRFku3W6I
         YiXZg10mDmBKkgydV0CtmTknSxEPN1QGxsnIC8V+iJnCzCdKnRmBDyO8OHPEBf1veUhT
         JH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026776; x=1781631576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JGQrR+jXL+gF7NqNgSXEOVcz9vJ1tDVxV1V33ex2f1s=;
        b=b7alnbaRFwKILwfCXjbq6RiCX/WNZ7WfSihriur69pSP1mTdkR83ECo5Cbum7d9t4W
         TL0l3506pD6tlXifaTDfslio37OcL1Q3KpzVzVKpI3D4pKf9tlzmiBpO+nfpKmIr1TrD
         h61aZJA5l4rCpqSPh0ph8LVzHHDq0VYyA7FHv1bXVwpNk1BzfWIm/ybsgvqt8tn5Ma0R
         ABlt34DQkPC/2XCD+xLHw7YmuX+5DVIGiZ/LGTH2m6mqSzr1VNSl3D2VJCVDA+5NWphC
         ggj54p4b0CtpUg3DvD5WNvxfq8A6cedwwo9XMMgTRH48JblsG7+U3X0KQ+4Wv2KBNmk8
         /Ayw==
X-Gm-Message-State: AOJu0Yxz7nmT5futCz/uSa7kcD7v2HWaREhi/zIWZ19c9vODj5+uBF2K
	xH8J+IgrPw56KJDFxDt5YQpINxJOapC7XVbvYInv0nnmrL6bP3+E+OAB2l+AYosYgE1RzrOIUdm
	vNM4CuwQ=
X-Gm-Gg: Acq92OHLlAr06QgviLs7KgExYzfcjY6dPwViOY74eQmlRP2E4JlJ39sOwH7anlo8JUf
	nwfVgPJWnFLigGeaPeRohhkM5ITldtyfCnFOLA80W7kivSI3hj7Uqcj0gUifyZzOASLy4dQklKr
	5MHT+hO1pwHzQojnRTZT2+cFFEQRN3l5puC+NScgawWbjqR173AbWt0V1EFqd19S42o9zH4GgM7
	htQZIdrQs5SenMbON+RQtZpkb8Zz/9Ngwt/B5N/KLfYLqu+Gdk8u1B5jkX6HS9SLdNpYgw+qVnY
	2F6GnkSuwoq01k/4pqjf8XBniD7Mpxm/HnvIIii7dF/6cFV3HlMKfNRPj7P71wD2+ewbgWAqO+G
	IufhTcTGG3QWC23O0ZY+T7JvcM4Q41bF+RbzALWiZ8QnFwTvseqXQY7oESz0oH3Jvpn/AO1BSWe
	ltLB0UKUzn4DgNWaegPho0hWl+h97g1+oqnmVQ/sTQzQFhG4gMCpLyzajjRNRY45AQ/0MZO49Aq
	gmH2QW6CpmMs1YKrQnu/iIM6sM=
X-Received: by 2002:a05:600c:45d1:b0:490:51e2:bc86 with SMTP id 5b1f17b1804b1-490c260a60bmr325676125e9.23.1781026776423;
        Tue, 09 Jun 2026 10:39:36 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:35 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:26 +0100
Subject: [PATCH v5 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-4-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
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
index f170abe08ef1..cec0a7211c93 100644
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
@@ -488,6 +497,21 @@ static int exynos_pmu_probe(struct platform_device *pdev)
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

