Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1F2FC019
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769380; cv=none; b=Z5WwdQUGzvRz0VHqUwS88fvzcne5k9HapH9u5eMaGIJNWQfkZ1emdRs7x8OYDiBH0OIKA3BHvVbmdwXzp/o/L+KdmHwKvrE4dHQWYYl6HQk712Vz8xLZweBOSwJMUt74vsyHQXoBUN/5bkC29i6CcLVTkUHXh2QBY6B0lGtMlBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769380; c=relaxed/simple;
	bh=D/alBt/IO0rXB4lbViRL+PF3NluC/vCh5+UjJNMc89c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JvLbX1ZSMF1/UFZvdyYNbsoKnbVm462UgdHqWSY/BUSg/2NTazM2D6+73MuzLlHrDl/5xy6tY3GDiN8oHZBGC+6LW3aQd9MuiqH5gYNYlZcqO8GSH26Qg0xCYLhDjkQReVxmX0W0pnuUaYDfJrwPLJitzYjXTorQgDWge5bNXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GWy/28m3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GWy/28m3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-455b00283a5so7705415e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752769377; x=1753374177; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=10QORs6KuK3KoVhoNTRYpOhsvpEP9POMNGa7ng7GyN4=;
        b=GWy/28m3zqQNF+Zdb13Of+SqIapJy/EaOqyJaHNrTZazGcXZsD9C8GEWYZoefiWENW
         W4GdxyjiOH36A+dKVj2EnpmtfRK0UPDW916c6/stldnZ6eUlxoJgfyb2tM7R4PouD9k1
         Wgo09y/RESUJzitzv1oc9rZuxJCd/vluXqOteEw4KUUeHQzmlKSO6N07QPXgC9HjVZc6
         d53QeoWTlmj2bzr52fe5LQWYXnFH1Y2TTiVcfDK7SQPzfcBqS5E9zzHbPPtwzlfXiQaC
         8kQsbPOZEba92zQxQq5w51K83OWqV9YXV3X9DBZU6+v7hWb9bF0YTjQ5hInVi2QJ1+18
         OuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769377; x=1753374177;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10QORs6KuK3KoVhoNTRYpOhsvpEP9POMNGa7ng7GyN4=;
        b=HOaZw3Btz1Yxgc67klXqXj8w5GMBU1yn+P1qQOfzDBb0gfLTKj0UUM53l3vDnduImm
         cAUh0AiGv3BrFyNvbqCthEIZ6vwMpuXWF6AyQkrL2NdogSq0vj6rBmNXfLJUN6xis806
         Fl9bRTCkEqJyI5zXC75XjEGnnLFxiLtAKmedJnfOulaBFVTlRoI6YeZzaRdEOuDyQWT9
         YmrWiMdAOCakzQ5wB8dfncix64t+TPJQF47Ng42GIICmn6NFGRoVwpePG7oBiWl1Yrop
         f4EAdeWh5/Ueh1wDbY5+Fv6uxh12hZY6PmQhbLalV9IeOgDeRQ0EEAzIuAOuQU+Tmtzk
         mmbg==
X-Forwarded-Encrypted: i=1; AJvYcCXFBk8W5KDnto16BxttiTxlmCb8wd9H+CT8umdf/LkpUNLMJUK8HCMhertrObT1oHmNm3IgkP491quTf/gFioNZ5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8hYYXgtDILmDNB3iJmpufQ1BU0zcRbRaaTwOLwyX+5jmYqy+I
	yeZIO+kEP1FPDK7cbPDKUCQ4hpNil6Q/4NxGX0R/btz2Sh4/8294SPrZh9CCxShWRPU=
X-Gm-Gg: ASbGncvTdjdSD+IhnlHCI66eP2AqvRD5a8A7lhqnsA/O43xrAFe3lWjDvkOjgmHF+TX
	Wwdf72QETNqOfp63LPSZYOOC1SqkXTVXXpokEIzij9e3BMi7bpqbnL6PnTAnLKnMPX/M95owBxC
	h5xp6bN2ExCzUogI4sibfRf4Ho8hIr1susFVVMy/5Jf9+5iMKz8IXihIUfN5TuF2H6xHpCpAEZ6
	G/CYhD7JEHe27Iz4BxS9SNV3YSJgUJcsAsFFkaCjOirhTfZWcabLGi210xOLlZp+2BWXLzTSnzF
	WnUQlAXB9aZcuUH+h1kB9cx09Hfe255n9hRtqaZ836bf7d698d0iddI+XaY0C4jUlZJ4qvYvU/N
	VEP7TzGXqp9KVQ6d4GsjDdoBzVXdNc4MjLaR2KZDDkL+jo0yPW80N0A==
X-Google-Smtp-Source: AGHT+IE++zTw7j6btUVkqUEYspAqPSCyXgCDgYCI8SNJwqI7G1Fq6QlWWZg6HM2OXb9NaKUehGX6vg==
X-Received: by 2002:a05:600c:620e:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-4562e2aa7bbmr68434475e9.33.1752769376585;
        Thu, 17 Jul 2025 09:22:56 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e80731bsm55078025e9.15.2025.07.17.09.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:22:55 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 17 Jul 2025 17:22:36 +0100
Subject: [PATCH v7] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250717-gs101-cpuidle-v7-1-33d51770114b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEsjeWgC/33PwW7DIAwG4FepOI/JGANJT3uPaQcGJkWqkgq2a
 FOVdx/ppV2i7fhb+n7bV1G5ZK7ieLiKwnOueRpbcE8HEU5+HFjm2LJAQAMGSQ5VgZLh8pnjmWX
 wKfQ2xo76KJq5FE7569b3+tbyKdePqXzf6me1Tv9qmpUE6dk7511H6O3LOY++TM9TGcRaNeOdW
 6W2HBun5DulOBBQ3HH9wNFtuZZtPwKQwZjYwo7TnTvot5waN5ZRxYjUW73j5l9uGn/XFDUqwM7
 uj7cPfP+7XbeD5mBMCpj6X3xZlh9IyFDN5gEAAA==
X-Change-ID: 20250524-gs101-cpuidle-cafc96dd849d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, sudeep.holla@arm.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15370;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=D/alBt/IO0rXB4lbViRL+PF3NluC/vCh5+UjJNMc89c=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoeSNevp2Fd+5CIDHpUymfxKHigKhGd6hKVqRGL
 esvln6QdI+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaHkjXgAKCRDO6LjWAjRy
 umJ/D/9x3WOsdHblLVE+GAdOaT8T6h4/DDFr9n4GBhg9X+DjjpbjV9pLs0Okd5UuBdDNOsq7kVb
 2qE5aEsib8QktmC9aflhmui7Cp+wZ/uTqRI7fwzgJwfHsE1dyc3x8bb7kNyDKMxv/c8SieeFMRY
 kelw8Kq97IwdyQ+kzVuEcnxJVmMvizPtUEoV83MrGz3yUKEKmoHj1FhiWk/7kZizBzEnoEtV7oD
 MXxr65iqfejyhD67uuO45q28gAgWmpjTI7KZtDroEWB34ivJoHCBcGPUzbYcHHWaCdxv1x9KgxC
 h8GFkMguEC9BYFqnuwPB1B3wfo7CbeAIM6zz1ZMjWnqzSFhr+d1pX+rN99K6aEe3ozvjP8Hw21U
 IcOP9rsOA200I0D70GKBqiXnrQoDU0tbhfD1p4z0n1YfMTHu4x6TWqI3APi6Dq+Pnci201+j1RA
 7SIr9kOwSY7s8zMOQQmQ3pUuUZNB5XbYCSa2mbRsVveCFnlImQZ6H0Hl5BdHLMN7emwkZwN2zHF
 CAVkcP564gLeN1PZX7rdqnQf6XzrJxOTgTTdksbFOsG8WU6IWjULHaS9zvvWI4pLTFmso3v0Cs+
 DlhtbYIxCoOYTJJKcViirTwWCmZZw583MCJ4UHjf2ji/XkX5ypKty3/6s+uTV8/vSaHAed7c41w
 l5uqDmK+3UIFGVQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Register cpu pm notifiers for gs101 which call the
gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
C2 hint. This hint is required to actually enter the C2 idle state in
addition to the PSCI calls due to limitations in the el3mon/ACPM firmware.

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
this by registerring a cpu pm notifier and programming a ACPM hint. This is
required in addition to the PSCI calls to enter the c2 idle state due to
limitations in the el3mon/ACPM firmware.

Note: the `local-timer-stop` DT patch mentioned above is already queued.

We can measure the impact of these changes upstream using the fuel gauge
series from Thomas Antoine [2]. With the ACPM hint now programmed
/sys/class/power_supply/max77759-fg/current_avg is a postive number around
150000 microamps meaning we are charging the battery (assuming it isn't
already full).

Prior to programming the hint this would report a negative number around
-150000 microamps meaning the battery was discharing.

This has also been tested with kernel/configs/debug.config options enabled,
monitoring the cpuidle sysfs files, and a script to hotplug CPUs in a loop
to test the interactions between cpu idle and hotplug parts.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/
---
Changes in v7:
- Remove atomics and protect suspend/reboot flags with the existing raw spinlock (Krzysztof)
- Use a bitmap for in_cpuhp (Krzysztof)
- Align the naming of various flags (sys_inreboot, sys_insuspend, in_cpuhp) (Peter)
- Link to v6: https://lore.kernel.org/r/20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org

Changes in v6:
- Add more verbose comment on why the hint values are required for gs101
  CPU hotplug & CPU Idle states in addition to standard PSCI calls (Sudeep) 
- Link to v5: https://lore.kernel.org/r/20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org

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
 drivers/soc/samsung/exynos-pmu.c | 276 +++++++++++++++++++++++++++++++++++----
 1 file changed, 254 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..22c50ca2aa79bf1945255ee6cc7443d7309b2573 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -7,7 +7,9 @@
 
 #include <linux/array_size.h>
 #include <linux/arm-smccc.h>
+#include <linux/bitmap.h>
 #include <linux/cpuhotplug.h>
+#include <linux/cpu_pm.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -15,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
@@ -35,6 +38,15 @@ struct exynos_pmu_context {
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
 	struct regmap *pmuintrgen;
+	/*
+	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
+	 * programming. Also protects in_cpuhp, sys_insuspend & sys_inreboot
+	 * flags.
+	 */
+	raw_spinlock_t cpupm_lock;
+	unsigned long *in_cpuhp;
+	bool sys_insuspend;
+	bool sys_inreboot;
 };
 
 void __iomem *pmu_base_addr;
@@ -221,6 +233,15 @@ static const struct regmap_config regmap_smccfg = {
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
@@ -330,13 +351,19 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
 /*
- * CPU_INFORM register hint values which are used by
- * EL3 firmware (el3mon).
+ * CPU_INFORM register "hint" values are required to be programmed in addition to
+ * the standard PSCI calls to have functional CPU hotplug and CPU idle states.
+ * This is required to workaround limitations in the el3mon/ACPM firmware.
  */
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
@@ -358,10 +385,48 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+/* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
+static int gs101_cpu_pmu_online(void)
+{
+	int cpu;
+
+	raw_spin_lock(&pmu_context->cpupm_lock);
+
+	if (pmu_context->sys_inreboot) {
+		raw_spin_unlock(&pmu_context->cpupm_lock);
+		return NOTIFY_OK;
+	}
+
+	cpu = smp_processor_id();
+	__gs101_cpu_pmu_online(cpu);
+	raw_spin_unlock(&pmu_context->cpupm_lock);
+
+	return NOTIFY_OK;
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
+	clear_bit(cpu, pmu_context->in_cpuhp);
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
@@ -379,6 +444,165 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
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
+	if (test_bit(cpu, pmu_context->in_cpuhp)) {
+		raw_spin_unlock(&pmu_context->cpupm_lock);
+		return NOTIFY_BAD;
+	}
+
+	/* Ignore CPU_PM_ENTER event in reboot or suspend sequence. */
+	if (pmu_context->sys_insuspend || pmu_context->sys_inreboot) {
+		raw_spin_unlock(&pmu_context->cpupm_lock);
+		return NOTIFY_OK;
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
+	set_bit(cpu, pmu_context->in_cpuhp);
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
+		return gs101_cpu_pmu_offline();
+
+	case CPU_PM_EXIT:
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
+	unsigned long flags;
+
+	switch (event) {
+	case SYS_POWER_OFF:
+	case SYS_RESTART:
+		raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
+		pmu_context->sys_inreboot = true;
+		raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
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
+	pmu_context->in_cpuhp = devm_bitmap_zalloc(dev, num_possible_cpus(),
+						   GFP_KERNEL);
+	if (!pmu_context->in_cpuhp)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&pmu_context->cpupm_lock);
+	pmu_context->sys_inreboot = false;
+	pmu_context->sys_insuspend = false;
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
 
@@ -435,23 +659,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
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
@@ -471,10 +681,32 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int exynos_cpupm_suspend_noirq(struct device *dev)
+{
+	raw_spin_lock(&pmu_context->cpupm_lock);
+	pmu_context->sys_insuspend = true;
+	raw_spin_unlock(&pmu_context->cpupm_lock);
+	return 0;
+}
+
+static int exynos_cpupm_resume_noirq(struct device *dev)
+{
+	raw_spin_lock(&pmu_context->cpupm_lock);
+	pmu_context->sys_insuspend = false;
+	raw_spin_unlock(&pmu_context->cpupm_lock);
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
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250524-gs101-cpuidle-cafc96dd849d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

