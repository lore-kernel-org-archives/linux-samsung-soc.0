Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA6C2D77FA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241840; cv=none; b=TPyplmdcLu8rRey9wG3x3lgKBhGpwhOMurhF03VitwDuheTtWDj88jpeXWoRwpdqyUoL9I3OtMlCUxo+SMNn4b8Ou1TbzRz3u084b6rfohjdkS072VF1/wUu2e+I+i1E/5z5FiM80+hGTkCX457wzJTOchPL4v4kA7dL68HJVgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241840; c=relaxed/simple;
	bh=Ufr+H+FcGbQI63E4Y+tgXodeECRGt21K8sPEPvm0rMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iY8bCtz+n4S644eGTwDmb91eajBahyvaFgbRCKeZqc1OFtdgDomQmDNq+DHWzmAMZgujczldM5RGCxEUxDp6T0K16lyeBiEvx/mYjyvieiYwdsUn66jS1VVpgNUvMhMaSB3q0+qq8JOiGbgTctSU3kWxtjgStS2Mmps57ZThGWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8GJMho4; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8GJMho4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so329336366b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752241836; x=1752846636; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/R/69yzYVE0dUtdDkhV2j9Jp7LabnZc0RZDCx+r2t4=;
        b=B8GJMho4SltQU0RMlzdM4sDrY1tEqzG2jE9Odek1kQxAAP+sKD99gWZ1b3d7t6C4+u
         kAGPoXYxDSewqKwyBb+4QTPpP3dBn75AlAToAOoBuoOZkYxWD0d2QuJ8/0BEeZwLK9dR
         nG5o0onxOe2YCmJMX7Vjf6c4u62PWtsywqbOTd2fE+oWvoxevRG+NzPLeDX3weq1hezW
         mKXFzCnkehv4+oAiUB3bokJV0wiB7e0cK/QCiGDKWV3pMCvid/iqpK/AbP4Gt1D/aMWz
         /H5Fq2ja2EsymUZctGVJidfAWpTRIw7WZnh2T90HPM9dHR0Y1PvXT/1sV90NEWMAHieW
         XD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241836; x=1752846636;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/R/69yzYVE0dUtdDkhV2j9Jp7LabnZc0RZDCx+r2t4=;
        b=eWQOsGT5d643Nr+LUkfbzyPETfk141mxjOKKDmm1jIfQc8jfeTih/Ay6Mdg9Ea0A6b
         eMQR+S3yT9sMAyFog6TB20xGeaDuWKPIORzQ5CjG4eaf9hNiUfamnOZ+k2TYQKra2qF9
         IL9JmHxsuPgmyRa6fufArAHaam9jqOsLW2/LLeRXXkqv31OY0btPt4HSXtEGHewNuDsq
         rQpizmTxL3yu75fhW67Vj3AU//SRhzj/ovM/ae98up3hXaTiDId9feJhjY+U9Kfm78yx
         Alt4hGCmF+tHTbrFWeG5mdN0d+1Ia38Sf9dn3/bDTtA4LhN2jRDr6TTskA8OgAopftdT
         mpbg==
X-Forwarded-Encrypted: i=1; AJvYcCVrChLphlQYPkStikiEJ+1tcVIBd6UoK02Sq5CSQh633/ubFgpuPTdW0KVy3JyOnrDtvnwjdBxrXPPMDpsGqfNnMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cunYmdMyGQoUFrGDj44o6+/UuEjyY3b2lui+J695Drjgv4gi
	D/IRsx0JU36VwH3iGCF/ZIk95pcZrYu5YnnTJWCoKzF7qEeUmWTz3OsV+c2m+dtilUM=
X-Gm-Gg: ASbGncs56qzzDcZPV/lgtqFZJW1/O4yfWqhPZChPZaDc7sGtW2U0xSLg7VlEmX/QPiD
	rUYFcpHQrUefycTE31cwlJu1HQb3hcSiSS64Cl6b3cOqJBl7snVBfTpvC5U/EQ9deoySNVTC3Z3
	Von3GosvFB6tIscwRoaprSqERMqZmqU4rewGSdlTD6dioUZ+szsqcGb5KHxC3bZeXByABJw08yq
	Z2GAtpbyMRPHgbeNj3+o4t3foSvN1a1u8ikrcRTW1e6L3n5owCxtDJmR4aJ7lcaiMlYG3ciVFgV
	EyN7eIo5yxBpEVDitzz6JoOVX6AGycMQghz3JoUB6yaM2gc/p3gnR1FfC29p+05af93Auugbpd2
	hh65uS+4O7FHKpCNUyQJYpjl1XFlxkaGzyc3Rgbh0V6U+nTbOLfs=
X-Google-Smtp-Source: AGHT+IEbDG2H1h0l098mojmz71M0nR2QKvDVxzzKEyrbB8DSXMFF1kd20fI+YGoV0PLb1wEP7gaecQ==
X-Received: by 2002:a17:907:6d28:b0:ae3:5144:8e3f with SMTP id a640c23a62f3a-ae70131550amr265291166b.56.1752241835881;
        Fri, 11 Jul 2025 06:50:35 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([85.255.237.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee46cdsm307017566b.60.2025.07.11.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 06:50:35 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Jul 2025 14:50:26 +0100
Subject: [PATCH v6] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKEWcWgC/33OwU7EIBDG8VfZcBYzMwzQevI9jAeEaZdk025AG
 82m7y67l9U2evxIfv/hoqqULFU9HS6qyJJrnqc23MNBxWOYRtE5ta0IyIIl1mNFQB3PHzmdRMc
 wxN6l1HGfVDPnIkP+vPVeXts+5vo+l69bfsHr61+lBTXoIMH74Dum4J5PeQplfpzLqK6phe7cI
 W45Nc5D6BAlMnDacfODk99yo9t9AmBLaRAHO8537qHfcm7cOiFMibh3Zsftv9w2/mY4GUKgzv3
 +/Lqu3/KYA2CnAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14415;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Ufr+H+FcGbQI63E4Y+tgXodeECRGt21K8sPEPvm0rMk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBocRao7LvP3oBbwYSdfWqFdA7ebTu3I9t91IzZ2
 4sjdMaQANyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaHEWqAAKCRDO6LjWAjRy
 uiolD/wJUYg1a0TPgiWESbrlEwv6bSaUVBEMfxbW+mU9Jocl26YVIhxn4UdwdbDNSJLkXnGXo0J
 MuxECUmdRy6VNIkHKjmMKrAT6ZlRX9Z3L+YpkaL0dekcQ6p5Mw43Tl3ev16jxCR7A1Ho950TVTF
 v3xP4BNQK0n9xE5Ws5BlYGIWT++MoppHOkf1yT995aZIiCN3JduryObqeEa0/jE73qt8cduYiN/
 FbbdUZ2vh4CbMB3dSdg/YySXClgNmAfhsxeANP2+QeO8V3x+aoWlrjMaAGyvPSLus2jsU3oyUYj
 ONgeq8t5usVJlHmovvg8XjB697q84HOo3ZbUTrTAbT1dSJnkUKKN4cS0ZoBtrzxOuqZF5P7L44p
 SAu9FCITZetSbSRDoRgD8+IKPPaLfXQsJgzzub1PQEPQNhCfq+ZeQmkT4tNJqe1I6uiON0J86uI
 zAWjFDmOMyssUJf9XeQ/60IJq67b9V1R279Br04HeCajmZMfsZ0gQVOo/V4qgoN57456PYJrYUT
 hk9/sEoSjQImcZKA17C4Bk7uQ8aBfu9rZYFCXOXclx6LP6dAQhBG/xvCJO47FxO7XHGOnyCyE3Q
 8t+IYKtIdAgmJXeoUOo8csLhyAXP9o64sMMv00E7+p11eXKIOfHW0u7RXIQXkUMawCULvkPY/L6
 PDcVU2SmNDbOAww==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Register cpu pm notifiers for gs101 which call the
gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
C2 hint. This hint is required to actually enter the C2 idle state in
addition to the PSCI calls due to limitations in the firmare.

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

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/
---
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
 drivers/soc/samsung/exynos-pmu.c | 266 +++++++++++++++++++++++++++++++++++----
 1 file changed, 244 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..88ed3f1744ab0a5e4b890a27ff1948a86c04fe3b 100644
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
@@ -330,13 +349,19 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
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
@@ -358,10 +383,42 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
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
@@ -379,6 +436,167 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
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
 
@@ -435,23 +653,9 @@ static int exynos_pmu_probe(struct platform_device *pdev)
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
@@ -471,10 +675,28 @@ static int exynos_pmu_probe(struct platform_device *pdev)
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

