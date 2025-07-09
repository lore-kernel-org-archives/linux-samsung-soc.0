Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688CA265292
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752057696; cv=none; b=NZ8JfZTdx0URmW6uZ3b340gARel/k9I25E1cc78jeGbN4CEr06uCEESf1mRvGwYa4Btdh/XM4Ee2e/zyyYSHabV/kKswcDLTCsmyU0yvw/PnVrEc5/rqw4GPUbmWb7nfgR37xtncvS8a0zsWkJ2H05/wr9y7SAZMLZnK7pLbPgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752057696; c=relaxed/simple;
	bh=lVKm1mcojqsWYJOqNu0+bY6lhqj+xwLxDBp5o+MqfhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SQgtSgAaCyAUlJ6YRTY4OMtVuuJTw2FnKm1/7RmKDIxIXtpjgKz9I42723HA1jqcU7fYeygjEt7dNRMepX7zjKgYqqfX3CNw8nmBS1JljOiazE972b1em9HNpSug/FL/aBRprXzeHb/S11Y366osz17tS+pcTesadqymRFTvMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z/eAGQaM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/eAGQaM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453749af004so27068655e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752057692; x=1752662492; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x5vGgL7UJ9lDEENBSkq4Uqo2ngIaWRypbqhKJz55VCM=;
        b=Z/eAGQaMBBV27x9PRqdncKpIHkb2LLXXFNPmgtQSgJ1m/EQC3sr32DAHz3YIbr6/qm
         qLTqhdCIeRR05QojJXDyNTjjXgVuiloTAxxH0g/v1jJKExDas+Acd2xNRAOvGqeVxOJA
         niZgzVAJrMp1OFXU+BlglBsUcsprRRubruzHdVh64c1o9exC0m5s4iqPnmXYVX61VGSy
         3mAV0Y27uLBaRICKxyNjA6pfWqhSjxqMC8ta31kqwbmMptbDkGxyw+WE7n4AJ7CIK9p7
         F2dIPyW7kKwW92AXTNmoX5aaCZ9evhy5rZcHk6ssAWzgnDwtdtkm88q/nEj0ycDTWw6K
         DJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752057692; x=1752662492;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5vGgL7UJ9lDEENBSkq4Uqo2ngIaWRypbqhKJz55VCM=;
        b=P5OTldbkDvSWslp+FPeG168/PwYgIKz6zImELuh3ARfu5y8YnuiZN+9GwK2P1CS825
         GyIyBGa6tnSZyqlAfHREDmUBfEOWDPoD4o2JsAcyVhV0YRsFXjevMVAi3pon0+X3kiil
         iIZ482YVyUCtOQQSzpPi4MnfGvMdMBSJ0uhtVnZnUtKEFHK3/DcRn6tGzDTUwvKIcOlD
         zHTseK72CLbNgdPls2+Y1bCsf2v4IwY12RlS2No9/tke2gE8q/6JJ7t3QLTBmxeVwjDf
         rNhpWmxQ2xE5Gd5zkxkHDs3yKGOVMLak8tbe1/a/BDLmFuDG5aF++Tg/yvTK2csarjPD
         w1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV4JCEkA0TzuR6KcDe+yFbX57RdptNzIaDTxZ+VV/fp9MkpftJOIOWMJN8eeAcdAmV2AvI5e7ed6r2xaI2+JSflVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjG4FamR7dWz3SX3qtawruvAUcrRdj4Zfg5VavHKLIoYddg2wC
	Q5Yd+VjnfkIbzj/r1buZOa79/pH+F1KPYBCo/mSQYGWD/D+BkUkYxcTUN0nb9wWo6Pw=
X-Gm-Gg: ASbGncuOxQVdxJK8Pz63VfRbJaeoAbBjG0wIZchFcnaQ+N6+kGafpZ4vg+rSB7E+mVN
	/+eIqeWyZsVZDBJmk+7QMpu43TCQBkMMotUIhUXT2CZ9haGAjLuwmJHU3/y+EVPdo6FD3Bo2g1h
	g4FFLYF4q9Ia/cOqot3FJweRel3bhI6VDWiTGa0nYPmmDH/SxI8CFsy3OpFo1kyv8fbrrpHY/BY
	MMiyFjsRuwGjUv6JnVlDsxT40Y5R5wMqFQD904mSK4rQdBX5mIEHiPyn1gNAMDb2ws8SjDiQc/D
	5h18Oj41MFFv8q2y319ZCkSQBfSCyCg1SE8tPrigSeKGIHwM0866NozSTEbwyNir5D6X/nGgMFd
	IQMXBv18d9XEjlf24GLjj+f3OzA==
X-Google-Smtp-Source: AGHT+IFpySXDs8+OigKiPsB+h0UNN6fuYzxAt6bbmCdW8gRt9kJ3u+gVLWivqVNBL9MDAjRSxUwvuQ==
X-Received: by 2002:a05:6000:2210:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3b5e44e5fe6mr1502996f8f.16.1752057691608;
        Wed, 09 Jul 2025 03:41:31 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225afd4sm15164373f8f.83.2025.07.09.03.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:41:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 09 Jul 2025 11:41:27 +0100
Subject: [PATCH v4] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-gs101-cpuidle-v4-1-56e21dd24963@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFZHbmgC/3XN0Q6CIBTG8VdxXEeDI4J21Xu0LhgclM2pg2I15
 7uH3lS2Lr+z/f5nJhGDx0hOxUwCJh/9OOQhDgUxnR5apN7mTYBBxSoQtI2ccWqmu7c9UqOdaaS
 1tWgsyWYK6Pxj612ueXc+3sbw3PKJr9d/pcQpoxq1UlrVArQ8937QYTyOoSVrKsGbS873HDIXT
 tecoxFM2B9efnBQe17S/B8YExVYh5J98WVZXlxbE8spAQAA
X-Change-ID: 20250524-gs101-cpuidle-cafc96dd849d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13412;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=lVKm1mcojqsWYJOqNu0+bY6lhqj+xwLxDBp5o+MqfhU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBobkdZ4pd6QQExCCTYSZOviLR8YMaS7ZnD+cxuT
 K/U8OGF/JGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaG5HWQAKCRDO6LjWAjRy
 uiobEACIKre4OP6YI2RIWp7LqicFBKEDBBB96U+V40fzqJceKynn0ilTAuV3Q+OLc8XUnQaiHh6
 rpqrqFpPbQ5GhHiYf2/t2m4uDrrGfwuM3ozDKHrl3BirJHEwIxmAMaG6S3FEd7J5uBpxXzpCVcY
 bbww+Hx+Zj3ynhpsQoclW4dbNZdttR39cGIfc5JyCAqMr+ooeBrb5pi8VW7YlZUxpNOjcDP87Mr
 8wo2MVRbVRdA69YB2rBkzisvHaWllq/OZ4AjdCJIxlL75LtccCnu23ihhXV4Ly8nUVPhVPjtICX
 zw9Yp/+YqkzzSSJPJ7IvhKA06GUK2itwsNddm5WHdLEzsfktcKXyGFqRjq/bRgBKhju49Z8hHjP
 2dibr3dMQ7ACb5s8n5gZvhtTRXeL6Q9d0Z9OhzR38vQHLppBgUt3mf0ySlpA7C4slm93MkVi6bF
 XCMjnUqpUalOdFZPaE5Dx3TFrthwOjM2/LERd3WWDF6DzYDkyruBSAQs0suzUmouDOjtEVcBxkA
 9wZ51bxjWkbMPAkcNylT+zCET811rUefg2LRfhptbWaLGLEiojxVGEVBPqVyJGQPqq20luoVpfw
 sGVQzUq/s/EVujAB9Ant0dHChJpFXifrBhrhbP5MfrsMHu+is9iIMcpBkEyaz10qteW+VvJV6nB
 rFTJSbVD10VRP9g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Register cpu pm notifiers for gs101 which call the
gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
C2 hint. This hint is required to actually enter the C2 idle state.

A couple of corner cases are handled, namely when the system is rebooting
or suspending we ignore the request. Additionally the request is ignored if
the CPU is in CPU hot plug. Some common code is refactored so that it can
be called from both the CPU hot plug callbacks and CPU PM notifier taking
into account that CPU PM notifiers are called with IRQs disabled whereas
CPU hotplug callbacks are not.

Additionally due to CPU PM notifiers using raw_spinlock the locking is
updated to use raw_spinlock variants, this includes updating the pmu_regs
regmap to use .use_raw_spinlock = true and additionally creating and
registering a custom  pmu-intr-gen regmap instead of using the regmap
provided by syscon.

Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
property to the CPU nodes. This informs the time framework to switch to a
broadcast timer as the local timer will be shutdown. Without that DT
property specified the system hangs in early boot with this patch applied.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Hi folks,

This patch adds support for CPU Idle on gs101. In particular it achieves
this by registerring a cpu pm notifier and programming a ACPM hint to enter
the c2 idle state. With the hint programmed the system now enters c2 idle
state.

Note: the `local-timer-stop` DT patch mentioned above is already queued.

We can measure the impact of these changes upstream using the fuel gauge
series from Thomas Antoine [2]. With the ACPM hint now programmed
/sys/class/power_supply/max77759-fg/current_avg is a postive number around
150000 microamps meaning we are charging the battery (assuming it isn't
already full).

Prior to programming the hint this would report a negative number around
-150000 microamps meaning the battery was discharing.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/
---
Changes in v4:
- Avoid lockdep [ BUG: Invalid wait context ] on boot (André)
  - Updated callbacks to use raw_spinlock variants
  - Ensure pmu_regs regmap uses a raw_spinlock
  - Create pmu-intr-gen regmap that uses a raw_spinlock
- Use pm_sleep_ptr to avoid #ifdef (André)
- Refactor CPU hotplug and cpuidle parts into dedicated function
- Remove unnecessary break; statement (André)
- Link to v3: https://lore.kernel.org/r/20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org

Changes in v3:
- Add more verbose comment regarding spinlock (Krzysztof)
- Remove per-cpu hotplug_ing bool to avoid highly discouraged remote writes
  (Krzysztof)
- Add extra comments for similarly named functions  (Krzysztof)
- Initialize lock before for_each_online_cpu() in probe() (Peter)
- Use spin_lock_irqsave in cpu hot plug callbacks (Peter/Krzysztof)
- Rebase on next-20250627
- Link to v2: https://lore.kernel.org/r/20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org

Changes in v2:
- rebase onto next-20250610
- Add #ifdef CONFIG_PM_SLEEP to avoid
  Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
- Link to v1: https://lore.kernel.org/r/20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org
---
 drivers/soc/samsung/exynos-pmu.c | 261 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 241 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..504202c5bc2c218363e8862f80ac5ffbc544e8b9 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/arm-smccc.h>
 #include <linux/cpuhotplug.h>
+#include <linux/cpu_pm.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -15,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
@@ -35,6 +37,14 @@ struct exynos_pmu_context {
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
 	struct regmap *pmuintrgen;
+	/*
+	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
+	 * programming. Also protects the hotplug_ing flag.
+	 */
+	raw_spinlock_t cpupm_lock;
+	bool *hotplug_ing;
+	atomic_t sys_suspended;
+	atomic_t sys_rebooting;
 };
 
 void __iomem *pmu_base_addr;
@@ -221,6 +231,15 @@ static const struct regmap_config regmap_smccfg = {
 	.reg_read = tensor_sec_reg_read,
 	.reg_write = tensor_sec_reg_write,
 	.reg_update_bits = tensor_sec_update_bits,
+	.use_raw_spinlock = true,
+};
+
+static const struct regmap_config regmap_pmu_intr = {
+	.name = "pmu_intr_gen",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct exynos_pmu_data gs101_pmu_data = {
@@ -336,7 +355,12 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 #define CPU_INFORM_CLEAR	0
 #define CPU_INFORM_C2		1
 
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+/*
+ * __gs101_cpu_pmu_ prefix functions are common code shared by CPU PM notifiers
+ * (CPUIdle) and CPU hotplug callbacks. Functions should be called with IRQs
+ * disabled and cpupm_lock held.
+ */
+static int __gs101_cpu_pmu_online(unsigned int cpu)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
@@ -358,10 +382,42 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+/* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
+static int gs101_cpu_pmu_online(void)
+{
+	int cpu;
+
+	raw_spin_lock(&pmu_context->cpupm_lock);
+	cpu = smp_processor_id();
+	__gs101_cpu_pmu_online(cpu);
+	raw_spin_unlock(&pmu_context->cpupm_lock);
+
+	return 0;
+}
+
+/* Called from CPU hot plug callback with IRQs enabled */
+static int gs101_cpuhp_pmu_online(unsigned int cpu)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
+
+	__gs101_cpu_pmu_online(cpu);
+	/*
+	 * Mark this CPU as having finished the hotplug.
+	 * This means this CPU can now enter C2 idle state.
+	 */
+	pmu_context->hotplug_ing[cpu] = false;
+	raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
+
+	return 0;
+}
+
+/* Common function shared by both CPU hot plug and CPUIdle */
+static int __gs101_cpu_pmu_offline(unsigned int cpu)
 {
-	u32 reg, mask;
 	unsigned int cpuhint = smp_processor_id();
+	u32 reg, mask;
 
 	/* set cpu inform hint */
 	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
@@ -379,6 +435,167 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
 	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
+
+	return 0;
+}
+
+/* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
+static int gs101_cpu_pmu_offline(void)
+{
+	int cpu;
+
+	raw_spin_lock(&pmu_context->cpupm_lock);
+	cpu = smp_processor_id();
+
+	if (pmu_context->hotplug_ing[cpu]) {
+		raw_spin_unlock(&pmu_context->cpupm_lock);
+		return NOTIFY_BAD;
+	}
+
+	__gs101_cpu_pmu_offline(cpu);
+	raw_spin_unlock(&pmu_context->cpupm_lock);
+
+	return NOTIFY_OK;
+}
+
+/* Called from CPU hot plug callback with IRQs enabled */
+static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
+	/*
+	 * Mark this CPU as entering hotplug. So as not to confuse
+	 * ACPM the CPU entering hotplug should not enter C2 idle state.
+	 */
+	pmu_context->hotplug_ing[cpu] = true;
+	__gs101_cpu_pmu_offline(cpu);
+
+	raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
+
+	return 0;
+}
+
+static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+					unsigned long action, void *v)
+{
+	switch (action) {
+	case CPU_PM_ENTER:
+		/*
+		 * Ignore CPU_PM_ENTER event in reboot or
+		 * suspend sequence.
+		 */
+
+		if (atomic_read(&pmu_context->sys_suspended) ||
+		    atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		return gs101_cpu_pmu_offline();
+
+	case CPU_PM_EXIT:
+
+		if (atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		return gs101_cpu_pmu_online();
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block gs101_cpu_pm_notifier = {
+	.notifier_call = gs101_cpu_pm_notify_callback,
+	/*
+	 * We want to be called first, as the ACPM hint and handshake is what
+	 * puts the CPU into C2.
+	 */
+	.priority = INT_MAX
+};
+
+static int exynos_cpupm_reboot_notifier(struct notifier_block *nb,
+					unsigned long event, void *v)
+{
+	switch (event) {
+	case SYS_POWER_OFF:
+	case SYS_RESTART:
+		atomic_set(&pmu_context->sys_rebooting, 1);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block exynos_cpupm_reboot_nb = {
+	.priority = INT_MAX,
+	.notifier_call = exynos_cpupm_reboot_notifier,
+};
+
+static int setup_cpuhp_and_cpuidle(struct device *dev)
+{
+	struct device_node *intr_gen_node;
+	struct resource intrgen_res;
+	void __iomem *virt_addr;
+	int ret, cpu;
+
+	intr_gen_node = of_parse_phandle(dev->of_node,
+					 "google,pmu-intr-gen-syscon", 0);
+	if (!intr_gen_node) {
+		/*
+		 * To maintain support for older DTs that didn't specify syscon
+		 * phandle just issue a warning rather than fail to probe.
+		 */
+		dev_warn(dev, "pmu-intr-gen syscon unavailable\n");
+		return 0;
+	}
+
+	/*
+	 * To avoid lockdep issues (CPU PM notifiers use raw spinlocks) create
+	 * a mmio regmap for pmu-intr-gen that uses raw spinlocks instead of
+	 * syscon provided regmap.
+	 */
+	ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
+	of_node_put(intr_gen_node);
+
+	virt_addr = devm_ioremap(dev, intrgen_res.start,
+				 resource_size(&intrgen_res));
+	if (!virt_addr)
+		return -ENOMEM;
+
+	pmu_context->pmuintrgen = devm_regmap_init_mmio(dev, virt_addr,
+							&regmap_pmu_intr);
+	if (IS_ERR(pmu_context->pmuintrgen)) {
+		dev_err(dev, "failed to initialize pmu-intr-gen regmap\n");
+		return PTR_ERR(pmu_context->pmuintrgen);
+	}
+
+	/* register custom mmio regmap with syscon */
+	ret = of_syscon_register_regmap(intr_gen_node,
+					pmu_context->pmuintrgen);
+	if (ret)
+		return ret;
+
+	pmu_context->hotplug_ing = devm_kmalloc_array(dev, num_possible_cpus(),
+						      sizeof(*pmu_context->hotplug_ing),
+						      GFP_KERNEL);
+
+	raw_spin_lock_init(&pmu_context->cpupm_lock);
+	atomic_set(&pmu_context->sys_rebooting, 0);
+	atomic_set(&pmu_context->sys_suspended, 0);
+
+	/* set PMU to power on */
+	for_each_online_cpu(cpu)
+		gs101_cpuhp_pmu_online(cpu);
+
+	/* register CPU hotplug callbacks */
+	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
+			  gs101_cpuhp_pmu_online, NULL);
+
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
+			  NULL, gs101_cpuhp_pmu_offline);
+
+	/* register CPU PM notifiers for cpuidle */
+	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	register_reboot_notifier(&exynos_cpupm_reboot_nb);
 	return 0;
 }
 
@@ -435,23 +652,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	pmu_context->dev = dev;
 
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
-		pmu_context->pmuintrgen = syscon_regmap_lookup_by_phandle(dev->of_node,
-							"google,pmu-intr-gen-syscon");
-		if (IS_ERR(pmu_context->pmuintrgen)) {
-			/*
-			 * To maintain support for older DTs that didn't specify syscon phandle
-			 * just issue a warning rather than fail to probe.
-			 */
-			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
-		} else {
-			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
-					  "soc/exynos-pmu:prepare",
-					  gs101_cpuhp_pmu_online, NULL);
-
-			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-					  "soc/exynos-pmu:online",
-					  NULL, gs101_cpuhp_pmu_offline);
-		}
+		ret = setup_cpuhp_and_cpuidle(dev);
+		if (ret)
+			return ret;
 	}
 
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
@@ -471,10 +674,28 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int exynos_cpupm_suspend_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 1);
+	return 0;
+}
+
+static int exynos_cpupm_resume_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 0);
+	return 0;
+}
+
+static const struct dev_pm_ops cpupm_pm_ops = {
+	.suspend_noirq = exynos_cpupm_suspend_noirq,
+	.resume_noirq = exynos_cpupm_resume_noirq,
+};
+
 static struct platform_driver exynos_pmu_driver = {
 	.driver  = {
 		.name   = "exynos-pmu",
 		.of_match_table = exynos_pmu_of_device_ids,
+		.pm = pm_sleep_ptr(&cpupm_pm_ops),
 	},
 	.probe = exynos_pmu_probe,
 };

---
base-commit: c44dd082b6696fc5bb3458ad28d1beb6153b8e6e
change-id: 20250524-gs101-cpuidle-cafc96dd849d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

