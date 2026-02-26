Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B8423A83
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120844; cv=none; b=oVHOYVqVTFDDqSb5X3p5NDLripeQkBXqrceKVCvwUKL4OCOR5qLA9m9u8Ht7Njv/UeP1jGmVxSN5VALA5fInLBD3LA7wWiIAYhWD7i91DFehFldudiTjGNoBAZejRu+c7tA+Y02vgRGfjTpqXeYuipd4fYtTD0jPLjRZuyo+Mjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120844; c=relaxed/simple;
	bh=RpbBElZZsEX4rUPGdU1ozxhBW4Aftc1Lf3tkxYIsxUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYwOfwjjodv7DnLZ32HZfUIl+SKvvtixLQzVIJyecqvpsQMxIPIWoNhTZRNoDNkFDUk6ZoOxYmfalKOF7QT671/dBVCDgjQxzEKbi+UtG6EM3yeU4dKV4Xp5uNihw6flQnqbmLWAJ7KIZsepB+ljD2t0N12THtvKF5j5C46X4gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCbgX6Gb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCbgX6Gb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso8567445e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120837; x=1772725637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0+3KrEkChy5VF+tN1hCu5mTVEJFxb8wKZ0wQMmmIls=;
        b=CCbgX6GblwxKvRsaBga/W66XqI3Ma47nHPo2PkLLFS3sK4Va82GQWeYP7Z5dWWjeer
         4+Zh6otzb0OnRZqPQ8Q+DzA0VZ5xPuLBl5yMFFk53yd2JU7tyi2oh5w52DGg+1pte7Q+
         X9qizr4YTvKDnJtf/uu4qqPtpPLblQ5BEp6wuLlg3jYrv5Pamr9TruJY+V3E79LHXWNV
         xicvpefWjS+tDySS7+h2EI+jYS/JTtZ8O0BGMKr8/82lSXC7IKS2KYi59SfM91vFBXPP
         lkwDj5m05idQbg16WYU5JJ9heigWehaGtyIum3OwhPL4uqF+eNhByuJYy942FpJZ2MPH
         x0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120837; x=1772725637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0+3KrEkChy5VF+tN1hCu5mTVEJFxb8wKZ0wQMmmIls=;
        b=UnLWvtq+Jt3WX2l52P6pTsdRXcwfNs6XG81YwDo5KldyQDRpvTXkC/hP/onPyREP3V
         yKwimPJSWDsS51FtUQyit8mQKrdb0VLydVX+WEglMTxQ9tTXRZnXQ7AJK2yrYmXmvuAw
         Ii7PS4Rxma7VKR95sD2CpWVOwfHBDSZ2CC0JUhzUP5VPxXUwbp9rUEwH3rAiePDoRMYo
         a55LnMynZJw1uduIqPgSnPtxTZv2R3Jfjy57dY06EBFz4Ho2lT2odtekcDrJb/+Tco//
         4zgNzh0oGoi4spEGzgEmNDfUAuAZFmZpvz8QnYcxkhlAwdOlUowGLH0nihq2Hz8YJ6j8
         xp3w==
X-Forwarded-Encrypted: i=1; AJvYcCWLuj6UD8TWMTYTkPxiWgndSH/wnt3MphV2LC0N6wDrtKzT0gw8m3yfTwfp7p56qV3X3eL6A/q4u5SnbzeV6RNt6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGyJQtZ8A7ZwSG6KD/xmD9XsV5O7ueNKIGq3BD3EJlt/WVD9m
	BGaR37iydi8Rqgano5rGW3PD72NG8/+Io9BnIf5iEJCXoUZBbfopphoQQK+XPp7exe4=
X-Gm-Gg: ATEYQzxzpWmOefCMGh+quj7Rf1sH2VYqoA2MSMy56TzKJQgm6RXObB3muEWwUGL+be6
	IL+Nx4K7cCudP3d48O50pf3QcjKD/SC/RoGfbHjOPoVtWY97XAX1FFureEhQo7Uz8i9M9ZMYD8S
	UsFUR7Hhkmis5iVsYsCwfwbAShWSgnkQ26stjPHJb9jOs6GHw/E8I7y2yfSTOd5LSeSQTLc8hs+
	HqxGjaIIaZDSBWReCuFuEoYHqQKmLeJlZ7uZocqxfvqHdn2izhfjWeRJ3JHCd3cgMvAVwSI/p+y
	FOj1r78UcBPWMLRH0AvhO/X3wjem6k54G2Wq6GGsZ2eb1w6Z+qXCH2/XHw3wJsBnXVjy4qNIb/H
	w3loZcwcV9iDq3RE4w04QdgQ/jgfTnJjD3Dq5W29podeZ7fKRBVFA9aGKtXWtya8gvnaf1Zrx1T
	OAK+gqhudJ4Qo1WU4+hK+5lJD3f4HJ5rNFtjT8jHIxdbePCShJ/hGp4jROzI6fyY8b2INSZ0XRO
	N+okasOSC5kzAg=
X-Received: by 2002:a05:600c:6995:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-483c3dc7997mr47608645e9.14.1772120837234;
        Thu, 26 Feb 2026 07:47:17 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:16 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:13 +0000
Subject: [PATCH RFC 7/8] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Some Exynos-based SoCs require specific set of writes/updates to PMU
and PMU intr gen blocks in order to put a CPU or a group of CPUs into
a different sleep states or prepare these entities for a CPU_OFF.
The same is valid for a reverse procedures like wake-ups or CPU(s)
online. Without these writes/updates the CPU(s) wake-up or online
fails.
Add support for Exynos850-based SoCs for PMU and PMU intr gen write/update
sequences.
While at this, also add description of Exynos850 PMU registers.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 86 +++++++++++++++++++++++++++--
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 2 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 0967fa56708a..7b9b8e22d91b 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -118,6 +118,10 @@ static const struct regmap_config regmap_pmu_intr = {
 	.use_raw_spinlock = true,
 };
 
+const struct exynos_pmu_data exynos850_pmu_data = {
+	.pmu_cpuhp = true,
+};
+
 /*
  * PMU platform driver and devicetree bindings.
  */
@@ -151,6 +155,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos7-pmu",
 	}, {
 		.compatible = "samsung,exynos850-pmu",
+		.data = &exynos850_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
@@ -229,6 +234,65 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 #define CPU_INFORM_CLEAR	0
 #define CPU_INFORM_C2		1
 
+static int __exynos850_cpu_pmu_online(unsigned int cpu)
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
+static int __exynos850_cpu_pmu_offline(unsigned int cpu)
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
 /*
  * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
  * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
@@ -416,8 +480,12 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	void __iomem *virt_addr;
 	int ret, cpu;
 
-	intr_gen_node = of_parse_phandle(dev->of_node,
-					 "google,pmu-intr-gen-syscon", 0);
+	intr_gen_node = of_parse_phandle(dev->of_node, "samsung,pmu-intr-gen-syscon", 0);
+
+	/* Fall back to the google pmu intr gen property for older DTBs */
+	if (!intr_gen_node)
+		intr_gen_node = of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
+
 	if (!intr_gen_node) {
 		/*
 		 * To maintain support for older DTs that didn't specify syscon
@@ -427,9 +495,19 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		return 0;
 	}
 
-	pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
-	pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
+	if (of_machine_is_compatible("google,gs101")) {
+		pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
+		pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
+	}
+
+	if (of_machine_is_compatible("samsung,exynos850")) {
+		pmu_context->cpu_pmu_online = __exynos850_cpu_pmu_online;
+		pmu_context->cpu_pmu_offline = __exynos850_cpu_pmu_offline;
 
+	} else {
+		dev_err(dev, "pmu-intr-gen is present but machine is not supported\n");
+		return -ENODEV;
+	}
 	/*
 	 * To avoid lockdep issues (CPU PM notifiers use raw spinlocks) create
 	 * a mmio regmap for pmu-intr-gen that uses raw spinlocks instead of
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

