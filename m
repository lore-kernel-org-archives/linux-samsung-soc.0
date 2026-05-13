Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5C426D2E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675843; cv=none; b=mTgZAj+EAuxg0A71d26QKs5nywsBibadDbUiP754NQqL4jVwQ7AU/8P8j1l33xZIS51W1I2UOYV4nQqKQnCxFmsU/0Wcstfbmv3AXyajH3K5N9tLE4JskC1mXmbIWrQ3m0ku+LzHc3sRikxbYFKkN4lHJNef4sPo3ju9BPwGhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675843; c=relaxed/simple;
	bh=y4Kk8JvUeUySRRvF52mUKuNQOMh+XpHbnjbUxWdgK9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJ5bhVaphGoy0N6OlqBbPGNQIbwTNCFXgtvrOE/0EbD75882PePQCoRtaT1ERxZkCuF1opbB4/5dTVzCcSRMI/06idvmQ4c8fgS8igngzJaLXMKspcnlv6AIjogxmyu8PYCyJ/9o9KyqSz4VdF3YiaCjjPXB5wKraoQPYfZ7i1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ib7WSzPs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ib7WSzPs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d734223e4so4163382f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675840; x=1779280640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORf0xNsuYSx5Ar7WuCn/GYDzLydMHqr7jScLvDAqw9o=;
        b=ib7WSzPsZSh9y5vVu08T89D4NfOMKGp9G2YZTUcu2eyxB9kid6lb8jLPEY9CyNuBpY
         sAWoA7S8fJbLp4xTpflWN6+1mViU44c9VUQrMvfGhGnKtUwUcMu4Yq3KSG+pvui064Y6
         CMmccTBYyumoxXuD4q+YmZ/oK/pDlPlO6sGNsxZRr2RnZRJpkv2VE5nPrgt7Z9yQh6Ed
         S+zs8//o6bKb6RTkzhZoIpVL7Mg0ImEkmWg7UqisHER8zRKsbuzGy3OVVduE5SeQGdkU
         Tir+s1TVWGYpixHwk1awI+x4PzTN9YtfHc0U7PsXR6vS9qrYzxUignxydpO9wiBc9X/J
         adew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675840; x=1779280640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ORf0xNsuYSx5Ar7WuCn/GYDzLydMHqr7jScLvDAqw9o=;
        b=OU0MSR7R7re0YyfuwvzxXRBX/rnP5Yi9v5O1Empx4PQqqemmBAN+R0/IiG2Zde+aqU
         5e3b8mFVIzQfeb2LFrkx9GoPAKF05X+OwvJibsVUCRzI1UkjC7hYq6HcJ5kDdBgDla4+
         vpDpinqGM0yayIfgJmRRTXo5TEfK0cnx2jM6kqFT4biGtcQtsACnGfMvcX88/iXS5zMV
         8YQmQw7DmgOX5bWFdTVYUdlUCNA5BvuJhXTQ+gXyXf0U4hMsZwOKIQthy07twcxV4MiQ
         yu874O1DsTWxjd1vOwpiNQwWxnKgMxtSIVWVMr/f7zYEvR15tOKOB4lOS2YdY5nNo7Tp
         OYWw==
X-Forwarded-Encrypted: i=1; AFNElJ+hCx9WHZrFBcQzdoRqGAuPoxsX749wr7dbyIJCfk82FxjfzjudWdUNRqRnkbyTHRlA4CLKdep1G1QcV3bZamNfAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXLBQyBK3PqOxazOHMtDxAnfbCGzvzBOd6kxamBgqew4aNcVD
	YPdvFCCA25xsdSPkNJQLx3vRB1ryRO54hO87oQTWVXk0NULJX7dGxSCNC4uJNkj+GZU=
X-Gm-Gg: Acq92OGG+IfwQIrmTfkOBlUAvrtBxPRXUYvEExBPX91HLBjD8/WCTpVAtdYobI5k0hD
	0dxQbtFX3IE0tBrcBWI+m/LCA0Enj+dgQsgbbSI+8zlE1JyCbWRCPqFceoLxCcaBRxCsicBOK+z
	crLD7b/9KxmU/u6eTO6+kMPvNxVDsyZw4D7Uk1uEjrHrs519HheouR0Z6nrepKSphzR3S1Byqi6
	mjpEPIfK9uO9s9LB/fyHO6Pttda8AC/umAWyG2mPNRjLWRqcKqlfY8ewE4xyCo1+xYYo++4SPsq
	2MBmVAIHI8V/MmPXNhSF4oadf7iRjxTHQaOGey/a/TbhoSqIuCI3Qji2BL+P+n+P5dPf7eYm/Hs
	Nil5TXIXIEZMaSO9b+NTvGobaQPRHCF10xGACiiinSj0G45ee/RGywQHPTjwkxTW6FjZaYeJyHw
	mYyoLHEUBGqYHqusXpuiahKi0u5Ka9NZ3a110iAfd/DNq1BbwRixYQPIPR64KWgxSPyV/CLLFPt
	x9NeqhpfDljfNUg
X-Received: by 2002:a5d:5887:0:b0:455:51cf:9f92 with SMTP id ffacd0b85a97d-45c46e02119mr5634588f8f.18.1778675839768;
        Wed, 13 May 2026 05:37:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:19 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:15 +0100
Subject: [PATCH v4 3/6] soc: samsung: exynos-pmu: generalise gs101-specific
 cpu{idle,hotplug} for Exynos SoCs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-3-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The cpuhotplug and cpuidle support for GS101-based SoCs which
utilizes GS101 PMU interrupts generation block can be generalised
to be (re)used for other Exynos-based SoCs. Also, the GS101 PMU
interrupts generation block is not exclusive to Google GS101 SoCs
and should be made more Exynos-generic.

Specifically, apply the following changes:
- rename gs101-specific calls, structs, names to be exynos-prefixed;
- move exynos_pmu_context and CPU_INFORM_* defines into exynos-pmu.h;
- introduce cpu_pmu_{offline,online} callbacks in driver-specific
  exynos_pmu_data which can be used to hold PMU and PMU intr gen
  update routines for different platforms and update cpuidle and cpuhotplug
  support to use them;
- add checks for the presense of cpu_pmu_{offline,online} callbacks;
- move and rename gs101-specific cpu{offline,online} PMU updates
  routines into gs101-pmu.c file, also removing underscore prefix;
- update gs101_pmu_data to use newly introduced callbacks;
- rename PMU interrupts generation GS101_INTR_* regs to EXYNOS_INTR_*.

This allows other platforms to add cpuhotplug and cpuidle support in
a similar manner, using their own platform-specific PMU and
PMU intr gen update routines.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 118 ++++++----------------------
 drivers/soc/samsung/exynos-pmu.h            |  31 ++++++++
 drivers/soc/samsung/gs101-pmu.c             |  57 ++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  10 +--
 4 files changed, 115 insertions(+), 101 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179..660416c0db43 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -24,22 +24,6 @@
 
 #include "exynos-pmu.h"
 
-struct exynos_pmu_context {
-	struct device *dev;
-	const struct exynos_pmu_data *pmu_data;
-	struct regmap *pmureg;
-	struct regmap *pmuintrgen;
-	/*
-	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
-	 * programming. Also protects in_cpuhp, sys_insuspend & sys_inreboot
-	 * flags.
-	 */
-	raw_spinlock_t cpupm_lock;
-	unsigned long *in_cpuhp;
-	bool sys_insuspend;
-	bool sys_inreboot;
-};
-
 void __iomem *pmu_base_addr;
 static struct exynos_pmu_context *pmu_context;
 /* forward declaration */
@@ -219,44 +203,8 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
-/*
- * CPU_INFORM register "hint" values are required to be programmed in addition to
- * the standard PSCI calls to have functional CPU hotplug and CPU idle states.
- * This is required to workaround limitations in the el3mon/ACPM firmware.
- */
-#define CPU_INFORM_CLEAR	0
-#define CPU_INFORM_C2		1
-
-/*
- * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
- * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
- * disabled and cpupm_lock held.
- */
-static int __gs101_cpu_pmu_online(unsigned int cpu)
-	__must_hold(&pmu_context->cpupm_lock)
-{
-	unsigned int cpuhint = smp_processor_id();
-	u32 reg, mask;
-
-	/* clear cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
-		     CPU_INFORM_CLEAR);
-
-	mask = BIT(cpu);
-
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
-			   mask, (0 << cpu));
-
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_UPEND, &reg);
-
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
-		     reg & mask);
-
-	return 0;
-}
-
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_online(void)
+static int exynos_cpu_pmu_online(void)
 {
 	int cpu;
 
@@ -268,20 +216,20 @@ static int gs101_cpu_pmu_online(void)
 	}
 
 	cpu = smp_processor_id();
-	__gs101_cpu_pmu_online(cpu);
+	pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
 	raw_spin_unlock(&pmu_context->cpupm_lock);
 
 	return NOTIFY_OK;
 }
 
 /* Called from CPU hot plug callback with IRQs enabled */
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+static int exynos_cpuhp_pmu_online(unsigned int cpu)
 {
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
 
-	__gs101_cpu_pmu_online(cpu);
+	pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
 	/*
 	 * Mark this CPU as having finished the hotplug.
 	 * This means this CPU can now enter C2 idle state.
@@ -292,35 +240,8 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-/* Common function shared by both CPU hot plug and CPUIdle */
-static int __gs101_cpu_pmu_offline(unsigned int cpu)
-	__must_hold(&pmu_context->cpupm_lock)
-{
-	unsigned int cpuhint = smp_processor_id();
-	u32 reg, mask;
-
-	/* set cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
-		     CPU_INFORM_C2);
-
-	mask = BIT(cpu);
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
-			   mask, BIT(cpu));
-
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
-		     reg & mask);
-
-	mask = (BIT(cpu + 8));
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
-		     reg & mask);
-
-	return 0;
-}
-
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_offline(void)
+static int exynos_cpu_pmu_offline(void)
 {
 	int cpu;
 
@@ -338,14 +259,14 @@ static int gs101_cpu_pmu_offline(void)
 		return NOTIFY_OK;
 	}
 
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->pmu_data->cpu_pmu_offline(pmu_context, cpu);
 	raw_spin_unlock(&pmu_context->cpupm_lock);
 
 	return NOTIFY_OK;
 }
 
 /* Called from CPU hot plug callback with IRQs enabled */
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+static int exynos_cpuhp_pmu_offline(unsigned int cpu)
 {
 	unsigned long flags;
 
@@ -355,29 +276,29 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	 * ACPM the CPU entering hotplug should not enter C2 idle state.
 	 */
 	set_bit(cpu, pmu_context->in_cpuhp);
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->pmu_data->cpu_pmu_offline(pmu_context, cpu);
 
 	raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
 
 	return 0;
 }
 
-static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+static int exynos_cpu_pm_notify_callback(struct notifier_block *self,
 					unsigned long action, void *v)
 {
 	switch (action) {
 	case CPU_PM_ENTER:
-		return gs101_cpu_pmu_offline();
+		return exynos_cpu_pmu_offline();
 
 	case CPU_PM_EXIT:
-		return gs101_cpu_pmu_online();
+		return exynos_cpu_pmu_online();
 	}
 
 	return NOTIFY_OK;
 }
 
-static struct notifier_block gs101_cpu_pm_notifier = {
-	.notifier_call = gs101_cpu_pm_notify_callback,
+static struct notifier_block exynos_cpu_pm_notifier = {
+	.notifier_call = exynos_cpu_pm_notify_callback,
 	/*
 	 * We want to be called first, as the ACPM hint and handshake is what
 	 * puts the CPU into C2.
@@ -425,6 +346,11 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		return 0;
 	}
 
+	if (!pmu_context->pmu_data->cpu_pmu_offline || !pmu_context->pmu_data->cpu_pmu_online) {
+		dev_err(dev, "PMU write/read sequence is not present for cpuhotplug and cpuidle\n");
+		return -ENODEV;
+	}
+
 	/*
 	 * To avoid lockdep issues (CPU PM notifiers use raw spinlocks) create
 	 * a mmio regmap for pmu-intr-gen that uses raw spinlocks instead of
@@ -458,17 +384,17 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 
 	/* set PMU to power on */
 	for_each_online_cpu(cpu)
-		gs101_cpuhp_pmu_online(cpu);
+		exynos_cpuhp_pmu_online(cpu);
 
 	/* register CPU hotplug callbacks */
 	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
-			  gs101_cpuhp_pmu_online, NULL);
+			  exynos_cpuhp_pmu_online, NULL);
 
 	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
-			  NULL, gs101_cpuhp_pmu_offline);
+			  NULL, exynos_cpuhp_pmu_offline);
 
 	/* register CPU PM notifiers for cpuidle */
-	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	cpu_pm_register_notifier(&exynos_cpu_pm_notifier);
 	register_reboot_notifier(&exynos_cpupm_reboot_nb);
 	return 0;
 }
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index fbe381e2a2e1..186299a049a8 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -13,6 +13,14 @@
 
 #define PMU_TABLE_END	(-1U)
 
+/*
+ * CPU_INFORM register "hint" values are required to be programmed in addition to
+ * the standard PSCI calls to have functional CPU hotplug and CPU idle states.
+ * This is required to workaround limitations in the el3mon/ACPM firmware.
+ */
+#define CPU_INFORM_CLEAR	0
+#define CPU_INFORM_C2		1
+
 struct regmap_access_table;
 
 struct exynos_pmu_conf {
@@ -20,6 +28,22 @@ struct exynos_pmu_conf {
 	u8 val[NUM_SYS_POWERDOWN];
 };
 
+struct exynos_pmu_context {
+	struct device *dev;
+	const struct exynos_pmu_data *pmu_data;
+	struct regmap *pmureg;
+	struct regmap *pmuintrgen;
+	/*
+	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
+	 * programming. Also protects in_cpuhp, sys_insuspend & sys_inreboot
+	 * flags.
+	 */
+	raw_spinlock_t cpupm_lock;
+	unsigned long *in_cpuhp;
+	bool sys_insuspend;
+	bool sys_inreboot;
+};
+
 /**
  * struct exynos_pmu_data - of_device_id (match) data
  *
@@ -44,6 +68,10 @@ struct exynos_pmu_conf {
  *            used (i.e. when @pmu_secure is @true).
  * @wr_table: A table of writable register ranges in case a custom regmap is
  *            used (i.e. when @pmu_secure is @true).
+ * @cpu_pmu_offline: Optional callback to be called before entering CPU offline
+ *                   or idle state. Only valid when pmu_cpuhp set to true.
+ * @cpu_pmu_online: Optional callback to be called after CPU onlined or after
+ *                  exiting idle state. Only valid when pmu_cpuhp set to true.
  */
 struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
@@ -57,6 +85,9 @@ struct exynos_pmu_data {
 
 	const struct regmap_access_table *rd_table;
 	const struct regmap_access_table *wr_table;
+
+	int (*cpu_pmu_offline)(struct exynos_pmu_context *pmu_context, unsigned int cpu);
+	int (*cpu_pmu_online)(struct exynos_pmu_context *pmu_context, unsigned int cpu);
 };
 
 extern void __iomem *pmu_base_addr;
diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-pmu.c
index 17dadc1b9c6e..5f2a59924144 100644
--- a/drivers/soc/samsung/gs101-pmu.c
+++ b/drivers/soc/samsung/gs101-pmu.c
@@ -322,11 +322,68 @@ static const struct regmap_access_table gs101_pmu_wr_table = {
 	.n_no_ranges = ARRAY_SIZE(gs101_pmu_ro_registers),
 };
 
+/*
+ * gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
+ * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
+ * disabled and cpupm_lock held.
+ */
+static int gs101_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
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
+	return 0;
+}
+
+/* Common function shared by both CPU hot plug and CPUIdle */
+static int gs101_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
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
+	return 0;
+}
+
 const struct exynos_pmu_data gs101_pmu_data = {
 	.pmu_secure = true,
 	.pmu_cpuhp = true,
 	.rd_table = &gs101_pmu_rd_table,
 	.wr_table = &gs101_pmu_wr_table,
+	.cpu_pmu_offline = gs101_cpu_pmu_offline,
+	.cpu_pmu_online = gs101_cpu_pmu_online,
 };
 
 /*
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..9c4d3da41dbf 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1009,11 +1009,11 @@
 #define GS101_PHY_CTRL_UFS                      0x3ec8
 
 /* PMU INTR GEN */
-#define GS101_GRP1_INTR_BID_UPEND				(0x0108)
-#define GS101_GRP1_INTR_BID_CLEAR				(0x010c)
-#define GS101_GRP2_INTR_BID_ENABLE				(0x0200)
-#define GS101_GRP2_INTR_BID_UPEND				(0x0208)
-#define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
+#define EXYNOS_GRP1_INTR_BID_UPEND				(0x0108)
+#define EXYNOS_GRP1_INTR_BID_CLEAR				(0x010c)
+#define EXYNOS_GRP2_INTR_BID_ENABLE				(0x0200)
+#define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
+#define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)

-- 
2.51.0

