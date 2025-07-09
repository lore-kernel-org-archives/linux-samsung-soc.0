Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9382DC34A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067596; cv=none; b=MjGrPzF9ASf6vQQYK0o4+JrdR5umhrmn2XPl0xdBkO9qunMbZp/zHffqVq9A+dYxA2mD+rY0xhIEN6XiDAH+JeptRZX/gabov0da0NCVn+kmUk+txVRVejsLiF7ARLbvvvkXvJCd27tgJNyUStgxmzgM4ZrECbivH7aWfLm3wsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067596; c=relaxed/simple;
	bh=1UTs7xWOfZ2+WlrT8IbX5kaWxQReXo1sw6OBk9v4gp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fM74Nlk0bXddZDc3GwaAQlOey9+yOdgBHCNo3IvmzmuVt5IFnAINRlPudv+wn7JEFcrG/NbPgUy/M4e2C5Ta0CZBA3rAcbJHdfvmHA/Gb83xyrvurDjeICDuUOpLD4vxIM4JiHcTp4SkwA6EfS0it3F5sZxb9pzRDGyDyafuON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UG7M35Pe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UG7M35Pe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453643020bdso43785985e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752067592; x=1752672392; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=itLsXs1qPNi/Vw8THLyQU8sHQFBa9iLBPXp34wVZ294=;
        b=UG7M35PeaXr7o0cvgTg0V2LDZla3pY+LU2Xf1LtYOrZiYVwcuqNmowr4KTnjE90wvh
         PDvvOhH2MYmN6K6qIKhWVTHXX6UxfSpKPbF267CDIsm7Pp+teQ26EI0WWJIMz6T8yKmU
         i3wBR6M+/6EGNSmrdQeyXGz0Qq6JbP0poTH3KHVa9pJmesL9omrL5Kfqmn62Gw9IjPUo
         lEW7LVbcb/zZgZV2YtxESzHDFSnAKZc8zUVkKAMnSmY/iVEFPgo0SSBLmrLuzoizpe0E
         vpen27CztAvW0kOq4S2OOUJITd7gp+i2pLgKrHse3ibNFS6ZKXXqB52gdMJulB4ku58h
         gk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752067592; x=1752672392;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itLsXs1qPNi/Vw8THLyQU8sHQFBa9iLBPXp34wVZ294=;
        b=tOBqPMr7XGeYM/vxxlGAzCFfxB3LeWlXCBVjaBtpyeU5k40VyvuTIp4oW+p6bbU1/L
         xXRvj+aC1W7JskXlIWOETIdfKjlUmAViPv6ZJzgx7LVeWhdCIhilwJq5R5QhDOgISMrq
         PNqLcDy6uepSNAFMFoydskithJbdxjHSJ/4xpLq9KVthnpaq3GvOhVHPV8OlW2koHtmW
         AJNH5AHon9mb6vGAVXfze8W+AksMgjOvoWg0IusUOYRurqjpHdS47uViO1P4xAy5dtoC
         3jj6lchIu0waYDvq3tuzZy9JK62/dPRN2xvhFdjbG7MyJsVD34zE0rOfRsdaTcBfm7cS
         kSLg==
X-Forwarded-Encrypted: i=1; AJvYcCVuPd5Z3onIiH2MyVUeuo5wwg6dY3cn8bE47mYs4bCqYrDzTs73+GBhtzeiVPNGHu6SGs0KBCPi48zbJFNyUWmgmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzywacNEz/FVdOYHVka4LXlf6OLW8FwdF0yoBtS/BzfPDvS05IL
	YaEukjEj9TwvN6XTB/ANwAt5dkkAm8LOsfWHuTyFlMeyEaJxs/bCNFd9175s5N/69KY=
X-Gm-Gg: ASbGncuhGIxsUd1iuye/EBwM0GzCO+DkCKbXFz7rLv2QlIt1ptLGV1y3tA7ihL2mAyL
	1Hnd02E8uEU/RsuR7fM6x0P7q8wFRBajG2Ngxh/oGZEB/mZCkbqInc4R4TkybPjxEs13om1Duje
	7BrXhO1xDQOOhWFWn9z/A6y3wmhslMFE2x2x806n3EQ9qkAtIjlqdxPn1H2xHHTF3dswgcfoHGj
	jP4pkVQn4ArpW4rJ+irWgZZGJwJ+toHhAxElYlQOU1+JVVhy04AOU1Xbh5YbMXw6wUPdA3Trmrz
	5Vv+RTdbu5YSY/7zFQLirHqLXBCYBUjlQnbwyJy8Qp/4hQA37KYDkueusNUCl7JFKQMz4SUPVkl
	odWtZUXlVCiW7CRw=
X-Google-Smtp-Source: AGHT+IEKRRthKL6yx8agdSnnUvnk/wmUm0ekN04jRaK528UmzcHA1adm22D1+ffkJxDZeefpBQeoCA==
X-Received: by 2002:a05:600c:1546:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-454d53a608dmr26383465e9.16.1752067592075;
        Wed, 09 Jul 2025 06:26:32 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d508e9d7sm23262705e9.36.2025.07.09.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 06:26:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 09 Jul 2025 14:26:27 +0100
Subject: [PATCH v5] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAJubmgC/3XNwWrDMAzG8VcpPs9DUmQ72WnvMXYwlpIaSlLsL
 WyUvPvcXrql7PgJfn9dTNWStZqXw8UUXXPNy9yGezqYdIzzpDZL24aAHDhiO1UEtOn8meWkNsU
 xDV6k50FMM+eiY/669d7e2z7m+rGU71t+xev1v9KKFmzUGEIMPVP0r6c8x7I8L2Uy19RKd+4R9
 5wa5zH2iJoYWB5494tT2PPOtv8EwI5kVA8PnO88wLDn3LjzSihCPPjuD9+27QfC4LXnaAEAAA=
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13742;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=1UTs7xWOfZ2+WlrT8IbX5kaWxQReXo1sw6OBk9v4gp0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBobm4FDl8UZo+6QQAmsLzxg3csEnC7DRJsJOSZI
 XCx2dOFrkSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaG5uBQAKCRDO6LjWAjRy
 usU1D/42okN1TS1jlUxjYx1FzOyelj1Xao+ApACrVc8vm1/hq/NAKuwwp29J6tMxDeKvoBBtlVu
 ZMy5IGQ0B39eW/HYMw1O72T48mMVnARD6zeCu2QSPxJgvWQESGOKHftgUV4uCBjDRZZUddM5Md+
 jJwzXZqOrXHw7MHj8dEKLomL1HqrHyg6ESO3Gq9PkQhHDJkaSPWGasrQkO8tLAVeZLstS04l+FB
 E0YUcJAF3sqVRuRgciStBcUQl3L4tltOkD+AZ5c0a67ry2QcNP2i8JvunEplLbyZnR3N8SSHM4P
 f0+CYemEVHsH5zEjQ+VOnJUbShQ4qoSVHBTSEtspVw3yEF0Vi1IRg3+fkTqclEbi9VhJObCgzPs
 35XUvphPM+1NGnyJ++oASDNZMySPvCNDw2e6jyBm4qrzZl0yts54WtRdCgg/pmCgmxm6f/vvOYp
 iJycL9JN5T8Eh8HI9Wz5gCUo2HY9rLct7e8hmJkiA4yG2zs89x+8ZUePNBRntPeUuwtXvsWGOuW
 xKfecI8EAruGUgFY57qji1bHHO1FUV27y6zb5T3/ersmiUVG5ZHg+ByrLJLa+dglITqrQ4buMZf
 F4xP0iQs0K1q/c7MNrLLzg1v5e66LS0tSOWC2lNjxnulEdPpZdl5csG0b/C7DJGsavufQktg0oo
 zAY+r75kOUwK2aA==
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

p.s. Sending a v5 as I missed Krzysztof comment about using
SET_LATE_SYSTEM_SLEEP_PM_OPS wrappers

[1] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/
---
Changes in v5:
- Rename hotplug_ing flag to in_hotplug to aid readability
- Use NOIRQ_SYSTEM_SLEEP_PM_OPS wrapper for dev_pm_ops (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250709-gs101-cpuidle-v4-1-56e21dd24963@linaro.org

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
index a77288f49d249f890060c595556708334383c910..912aa010d9365b45fc43884481137be5ad4cfbcd 100644
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
+	 * programming. Also protects the in_hotplug flag.
+	 */
+	raw_spinlock_t cpupm_lock;
+	bool *in_hotplug;
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
+	pmu_context->in_hotplug[cpu] = false;
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
+	if (pmu_context->in_hotplug[cpu]) {
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
+	pmu_context->in_hotplug[cpu] = true;
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
+	pmu_context->in_hotplug = devm_kmalloc_array(dev, num_possible_cpus(),
+						     sizeof(*pmu_context->in_hotplug),
+						     GFP_KERNEL);
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
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(exynos_cpupm_suspend_noirq,
+				  exynos_cpupm_resume_noirq)
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

