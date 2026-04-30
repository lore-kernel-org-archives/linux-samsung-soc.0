Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BAA2BE7BA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514224; cv=none; b=kozI65VQmnclSjwG8T8/OGdy8052Xumq9TzxL3r8X2R10conAwhnpimLkVtXjxjjn1V5fkwdZghHjNB/PxewN4URmop1AKLylEEI9ZtdCgX111GlZ68GvHYZjK9nnpSwyStT0nlBWOniFvS9wnbaj0bDlhhc9fySBDIsUG+nSog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514224; c=relaxed/simple;
	bh=jH+Uais91Yp/yfS2R1M5zj6Q63Qt9ZCT515I//ZzC/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBkrPu681qJwl8RjdTxbyYXivPsUxexTtDJdNG8XnRVRR23CThMP1XnJW577LeNswx7chHiRgL3huQQkH3PF6aTvh9Tua98oxdhugGUglK2AfjnyNQeavGSjOs9MM7m+3P5iSTF1DLXaekDT2SCSmqFzqLfibE+gkz1oygwv6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTJx6X0+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTJx6X0+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d77f60944so262967f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 18:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514221; x=1778119021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQcInBWC9kq/xkmPKKPsqQgAV8Q2221mBidac2LwPQo=;
        b=FTJx6X0+LUkKAyKBnF9MrZdNbtUBdehTqd713ursVcd4vHA8ivAkhHBZ6DH7TiVHNX
         z3mlc3r9BDfcLxovpCQV9mLPYTj38M2fLHaElwfw6qllt8R15QVspDYWUUMqsPun3/xz
         xWjdZBa7elKOS9h/dTAugbja6qBab4M81/zeb1SrXZyXAhkHBqlDHCv/e9H4qOl5CjNx
         hxzqP1buGE/J6fPo/0hJdB8dio/UyjDwgmwEGELOQto1c2QZUCfM2lcj3q29dL2eSdGq
         zN+KoY22tJamOZ59Nb1z4XRKoGOF9jHyHwcxxn/AakbHcn7cTFcStVMuXF5ijgrARDpv
         1Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514221; x=1778119021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQcInBWC9kq/xkmPKKPsqQgAV8Q2221mBidac2LwPQo=;
        b=fTCxUy4+YTW8jT2qZNEJPQp0r7gl00c+yOer/TpCTKezZmGMquVtjOLPh+yRJTi937
         y3cg1zw/EnUC/Zyo7wiMzLPp20cImeNzCGz9tQ4dKbV3Br/v/9WkAIEEuvS1g3Z4MnUm
         5OpuQd6DhMxIBnG613qgwsJhGCcsZa8plit21xb7xFyl/TPdbPiQB0FzgPL9Kj947hSw
         8+Glw8gAhJE0/Kf0aqwgBzr9dfQACBmKfhPp60UQUh79xAXYJ0f+rHchAwwlYnLoOe0i
         vNDYm3rcvuUXAyJ4SUGM2Bx6+Xh+lFmUclBBd9pc+CVUfZpC/612/To88VYpFoscuCJJ
         cflA==
X-Forwarded-Encrypted: i=1; AFNElJ8IS3QuFtFnc9g5pbvgOima+HnbSGm+Wuxo/fWaZhSeyCBHKeMPoymuuZMOyHQT7xGY1SrjKaFJ0uz1U42cyq1umg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynLQLMcS6W/aBWUSpkasZ8NkDyOJ1bjYPK8x+DeIn35PFyND6Q
	f9CN68aOoRObv+LK4rLI+iJwq+NeDuyzzj68xMjBQQej18GLlqHQsyb/z47pfMFjqfw=
X-Gm-Gg: AeBDietV4I2XrtSXM9PJogq1kP80sJ/ZX9SxCXpzcy/9CYpLjseg3fts2B20n8Tl2PU
	l9/vUIdZmxbQboB/g7WNG8md0sqGny5QYUY8AtXrNganT8RcD4mmnorgN8KFfa49TWk5jfy3SZk
	SGx/62WbsHVMU5Mz9D9sID0wh87rqffL/InLXnEPyam64aI2UcSkffy1h8hSrqxc5ryhoYsIWc6
	PIwG8iX5tvNg4MrdrsV0PooX8o3/2gQM27qLeK/+rNK6fM++DKV57lIkgapJeCSBKfGeIGpeEzK
	lN9yPbiC1nNN9NZNHVvIVgnbPIP/4dOMXP2sg/0up12JkD+pR1QNQ2lG7dtxa+IMl6U9M8B7him
	c7UDHDakgMqdH9avS1Ee+jtEslBnaUTJfB/AdoGcv9j8c2N5OR83uv79BAAKLFVlSw3twodBRgf
	uSj+P7H9ZXUWji1XdrjZoJ2t+TQRdZoKzj3PgBP+w7nq0bNrThu3izbrvQMnPq9Dlb/l7ORaArb
	CKlhIXz+YjtDjd+3AUHX79+jsErRCEz9zNYsA==
X-Received: by 2002:a05:6000:24c5:b0:43f:e452:f391 with SMTP id ffacd0b85a97d-4493cb42f83mr1242615f8f.6.1777514220538;
        Wed, 29 Apr 2026 18:57:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:54 +0100
Subject: [PATCH v3 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
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
 drivers/soc/samsung/exynos850-pmu.c         | 79 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 5 files changed, 87 insertions(+), 1 deletion(-)

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
index 660416c0db43..9dddf4759ab5 100644
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
index 000000000000..7a1ea45810bd
--- /dev/null
+++ b/drivers/soc/samsung/exynos850-pmu.c
@@ -0,0 +1,79 @@
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
+#include <asm/cputype.h>
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

