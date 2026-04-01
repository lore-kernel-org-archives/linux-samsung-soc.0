Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11CF381AFD
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019124; cv=none; b=QvgW4K7ko2G6hD9manL+bbtJV+K6ryIlo3GU5IwJuVMeE4jaGG2QadFRI1baLtfb5hs62sExyEcmMLe/U5f3UYUlKHj+FjxHahNDrcb6VSDJAKijeBNQIc6lCYtZil5yvPvNn4IOkbyXIk+1Ox2KqwaN+GDnB7SgE/os0/2I1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019124; c=relaxed/simple;
	bh=vjlzkAiwq7OPPtyBkwN8fqq6TPvR9dhypDqaTmQGqn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTvUwzA29mX9fs3h83Ct2VCWcQm7GBzsGt67xV0GT0Cm+TWvFSV6zpPOv1Oj1nH0vGY1xulrIGGMt0xOznhNuCRDlUum2Lzv0G5pG8BHip/7sF+VU6zH4SNPDdlGRrlkAzE3hnOb5ianQScXL5e5G1eCYHbi0jwrk2evqVDLZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZGptDyck; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGptDyck"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so1849144f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019121; x=1775623921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQwB3TB66cQkUnfzSWykNAwP1awzvRIVXiR2OPjNYg0=;
        b=ZGptDyckkp0a3R55H6FxRimosA7YouYcBuOnNH6Oesk2/GeuWOAINwIZ7ZQV6glhCr
         OMhNhEvM/g0TrMaFzbxDA0oI+aRohjUr7BlWAxcLvktF8iFrPJoV93GyXFV6k3X29HQP
         gEzHkjYYpplrt2c4VOskj3COtHcQe3euiYehf54exUru0SnZPTBsbY6UglVElyTfwYqN
         T/YZ3mSEVnYIHn8wujV/GnJaGypXErEij+Ez+GGypS1XALkzUqF5Kng0kZp/ksOzdXfk
         hGgIL3DTelP4EfSz5yGQbPRWh/fnkIMYgWbwBUedEt7JrRjM15ZuoqC0EkJHV16gBmlO
         g32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019121; x=1775623921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQwB3TB66cQkUnfzSWykNAwP1awzvRIVXiR2OPjNYg0=;
        b=nV2TS3PYdHnVA/X1FwU4aOBFTgHwg4KofJlaAx6kV4QsiWnDtsYmWy6g5SUCSOoOaq
         DfT7GmUUHUjg5LSrpel1y1KSdMOEyI7ieyoT/gpbqL7CuMtDVclldsTrL721NHRMJPuU
         8tGRSQG2csQ07zpR58NmP4hg9bs9kbstK8wprZTsquAbjl37c4d1HgkdV/rCfQgOKopr
         /qHKdv4v8oPkluwlQwvsuKF6WrjtIHYbF51jDEL5K5G4Dh27AtSg8DCcQBFEVdD1OsVg
         h/DhjnHGEjWIPASy8us+tSdIPs1K7cTOv0mNg4Qg3Z/zNTcAlywaHuZ9pBzxr9BSxb/j
         /2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXZ0drIXN+N8hTCNIERCXVUsuBhKVMovlPJI3ZdFywmjcT7y7CbUKYj8VDOvkRCVLptzV3ICGWJd3vaprBqUfPtbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzba5g3XWb64OFMsl/rPT9bH3tQW/acl9bcybIGscLmrS9JmC
	bqKbbnni44yi+Wf1VDSr7sBJp6tKYDml89QeODnoSTGv2V4yqVQxfX56y710dMYS2qM=
X-Gm-Gg: ATEYQzwNlI8+vnFIXzehezoW9qSHi8gF2eW2AreL37Tg2h2m4qQueMeYkgkP7xvlUNW
	PsakgDZadbjHKhGHBiVVBC2nqDunyrO/bc9sSzUWxSJEu88/I0ryTHEXEIOBekc2FZiPMKdauN4
	0rlsHJRDq9gHv9h9ELuhnhkvM2fBqQLVo8kOm63+Fu+KatgTVWGoOd2RFs43dso9Sb5TJLpln7C
	KMMQzmTWiYJWXKjsftK7BWSbCX8HJYtnQYOydNBWu5wxy+2k0tDZpvLZ3d4XjzkAgK6W9LQKeGf
	DBFF4FofS7eEQfu1zcCSSPcqdo6wK4IiZyJ3cPTK8Ye3f2ZpGY1i18cnZE5njIXWqhGFmUnxdv/
	83UrokHi+zTq6/vzWqMZDAeiaVBOBx8MrlX8dWBfMZGT29RUQhkbaFBmUJHEsMVqDrW+Dm90o/n
	mQ8nz37yaXhvrfRGm5a4uMC/WF4jEvo+nL3VLRywlsV7z8TeICndIzzMawOA/6GIWvbtFv3zCN9
	FllQB49lh710q539ngSe0CBWQk=
X-Received: by 2002:a05:6000:4313:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-43d150c50d6mr3889581f8f.25.1775019120926;
        Tue, 31 Mar 2026 21:52:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:52:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:57 +0100
Subject: [PATCH v2 4/7] soc: samsung: exynos-pmu: generalise gs101-specific
 cpu{idle,hotplug} for Exynos SoCs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-4-c5a760a3e259@linaro.org>
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
- query the "samsung,pmu-intr-gen-syscon" phandle to reflect updates in
  the DT bindings;
- add checks for the presense of cpu_pmu_{offline,online} callbacks;
- move and rename gs101-specific cpu{offline,online} PMU updates
  routines into gs101-pmu.c file, also removing underscore prefix;
- update gs101_pmu_data to use newly introduced callbacks;
- rename PMU interrupts generation GS101_INTR_* regs to EXYNOS_INTR_*.

This allows other platforms to add cpuhotplug and cpuidle support in
a similar manner, using their own platform-specific PMU and
PMU intr gen update routines.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 126 +++++++---------------------
 drivers/soc/samsung/exynos-pmu.h            |  31 +++++++
 drivers/soc/samsung/gs101-pmu.c             |  57 +++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  10 +--
 4 files changed, 121 insertions(+), 103 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179..4e5fcc01e5e0 100644
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
@@ -414,8 +335,12 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
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
@@ -425,6 +350,11 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
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
@@ -458,17 +388,17 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 
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

