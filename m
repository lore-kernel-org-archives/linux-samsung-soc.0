Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83A423A60
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120844; cv=none; b=DhXyvWeie/os3wkJV9/kwVVRTouUaoBlENK0M0ZxGgORch+oapYshIypTJHIspVRHk7exzEH9VnsZGditWkFD6XtpGKtWzpIJgdP4YL6DrBL49tImWGcILqSYHimhPJ+qoM4egPqwEQBJEUlGXzbxBQ0j770AQZe0YnUxRCAVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120844; c=relaxed/simple;
	bh=owcHZmdFB8zEmzqIjY21q/Dw0rwYCUtosZQrUBx8k0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xe5lqoMaQp1tQ9p42fgxSY3U+hn2SEBODR31M/VhNF0srePY5ey8vnO4WWwj7DJuFrWdmLJJq6l0HFxdTwNlRm5yiNZ+pceAjqzQzHaLU5WMOFoDUSfQldzN1UwKt1vYgIllhr3XB6H3Z2oalbMDrb+QkOGqCwEldSnVES5zV94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mOMu0akj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOMu0akj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483abed83b6so9047465e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120836; x=1772725636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbzUlYKMaWIfUalQuB+QlRwOyMJx/oa+ZaF52Snu/7g=;
        b=mOMu0akjTgfjUQYgxoVmzSJxdxtOk4VN7VTZ+e0iJkIsxXnNUcSlcBPmXObkjv5sLO
         mM3d02cuS//gr5HeFjiju/4CoUvDgoN9IHUyGJaqe/YkT7qQMzgp1bOJiZX5fNmhmd1j
         7Yk8IyC5x05uGwYgIKnL17UvN2T9OFmcO64RlwehgHE2Bkt6gwHE+uzgIQ4opuc14LtM
         Xv5ZnUipkdZa278OfYEu4vmnsqsehPe4xXen0dbY8nmENMoOAmlQ2M2IlQGYSByp7l7a
         MDLI/CsXKyohYLsSNCyO8ZTdZbjexBn/BEW6ndZ7gAp0cUX0IHE7zieXu3irUcCl1UCi
         ZwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120836; x=1772725636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbzUlYKMaWIfUalQuB+QlRwOyMJx/oa+ZaF52Snu/7g=;
        b=ecZPc8f/7McHJqkO1tRQuEIVQynY0PaKz3qDK/yOoDgB7GSSu0Ek07KIPzOYApzpY3
         Mls+sw8HODKyCu/kzLqx8ccs/Oq1PbGF4hPVfG4hKOuY1jJf74FYeAQ/gI5vYNK9g+8j
         j6UvbMdmF5lXQGydgLY4zptCNcZRDUTt/4Z2fBKb1ZRqOmXENBrNhGeF+ZRVtJKYmptP
         MwaJd3JBAYaQ4xJ4FyRobglle13XQhHnpgmYZ807W5ckc9VNtMZdwZ5owCpTDUTwydTC
         pNueyE4KzHP42EdgksLm9mKOzeiruHzgZOYRDAAaVlTCRKCLK/cd7JYu1OTu5/5UuXvV
         B/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWuFxrT7bK+ZdKX8uc4RhzJELxII8jj8u6wyHElypcab8WB16esnfC/DjMxHF+eOLxyOkKopbs3oHFgF95fo6nLog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlA3pGzxz99mu/vZ8qwoULM7uVCe3rrdb6o/Px2T0lrZh39RD
	K3AvnHG+jueyGlLd3yBVZt84XuWqEJdzujRguCvKHU4RJ3LDj7EcBz6R6T2V6/76kAE=
X-Gm-Gg: ATEYQzzLeJ8uLHTlgOOZ8CZtN10aE0m3Ncsh+rL5aIuMTE/kfHw2sUmBBl7+jBenflQ
	5I3Yrsz+J/L0EHkRVyl+P8xsYqtkEipvbFGiIrO1jLwy9uTgWl59iqbtp0wRO8iNv3UbgpvPnJ3
	Hci9iKmD+vTK7DZhTw7mVDG69QbnHimtgO+jCUN3HCA0hZDSquQigsMndmktgc8svkkcJx04l3R
	J46SxSp3SmUERmBgx1nn6KhRneeZMN2t2DamOOZ4GUGv44fkIP694RgaoE5byKN0rj0vyVK8P2F
	yZoulEUmiNqC+AxPCXU6nGjwsfupIi58sPbAq4XBrK4ltl80AR1nvLG7gujlI2hGd2bz3sBHa+d
	KPoiDqbPwu3MtHdbyxCXRe/3GnvIquCsHNXzW45uJpcfX/1be8Tgo/3O4vnAJZLJ9DGkRRFpOrd
	V5MaiBLlIvzVyMmbSUiB+SaIEVJbSehkUMvvrtoVRAhE+/0iLvmL3clKzaHcxkyC67ICIa284EM
	OqXx8NScdSxMqU=
X-Received: by 2002:a05:600c:3f14:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-483a95e2563mr324727115e9.22.1772120836160;
        Thu, 26 Feb 2026 07:47:16 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:15 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:12 +0000
Subject: [PATCH RFC 6/8] soc: samsung: exynos-pmu: generalise GS101 PMU
 intr gen for Exynos SoCs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-6-71d7c4063382@linaro.org>
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

The GS101 PMU interrupts generation block is not exclusive to Google
GS101 SoCs and is a standard Exynos IP block found in different older
SoCs like Exynos850 and others.
To prepare for the addition of Exynos850 PMU interrupts generation block
and cpu hotplug support we need to generalise (Exynosize or Exynosify)
names and calls related to CPU hotplug and CPU idle.
pmu_context struct has now calls to offline and online procedures which are
SoC specific (and maybe even firmware-specific for any given board),
and one of this set of {offline,online} calls becomes GS101-specific.
This allows adding calls for other boards later.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 92870e6ffc1c..0967fa56708a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -36,6 +36,8 @@ struct exynos_pmu_context {
 	 */
 	raw_spinlock_t cpupm_lock;
 	unsigned long *in_cpuhp;
+	int (*cpu_pmu_offline)(unsigned int cpu);
+	int (*cpu_pmu_online)(unsigned int cpu);
 	bool sys_insuspend;
 	bool sys_inreboot;
 };
@@ -256,7 +258,7 @@ static int __gs101_cpu_pmu_online(unsigned int cpu)
 }
 
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_online(void)
+static int exynos_cpu_pmu_online(void)
 {
 	int cpu;
 
@@ -268,20 +270,20 @@ static int gs101_cpu_pmu_online(void)
 	}
 
 	cpu = smp_processor_id();
-	__gs101_cpu_pmu_online(cpu);
+	pmu_context->cpu_pmu_online(cpu);
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
+	pmu_context->cpu_pmu_online(cpu);
 	/*
 	 * Mark this CPU as having finished the hotplug.
 	 * This means this CPU can now enter C2 idle state.
@@ -320,7 +322,7 @@ static int __gs101_cpu_pmu_offline(unsigned int cpu)
 }
 
 /* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
-static int gs101_cpu_pmu_offline(void)
+static int exynos_cpu_pmu_offline(void)
 {
 	int cpu;
 
@@ -338,14 +340,14 @@ static int gs101_cpu_pmu_offline(void)
 		return NOTIFY_OK;
 	}
 
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->cpu_pmu_offline(cpu);
 	raw_spin_unlock(&pmu_context->cpupm_lock);
 
 	return NOTIFY_OK;
 }
 
 /* Called from CPU hot plug callback with IRQs enabled */
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+static int exynos_cpuhp_pmu_offline(unsigned int cpu)
 {
 	unsigned long flags;
 
@@ -355,29 +357,29 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	 * ACPM the CPU entering hotplug should not enter C2 idle state.
 	 */
 	set_bit(cpu, pmu_context->in_cpuhp);
-	__gs101_cpu_pmu_offline(cpu);
+	pmu_context->cpu_pmu_offline(cpu);
 
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
@@ -425,6 +427,9 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		return 0;
 	}
 
+	pmu_context->cpu_pmu_online = __gs101_cpu_pmu_online;
+	pmu_context->cpu_pmu_offline = __gs101_cpu_pmu_offline;
+
 	/*
 	 * To avoid lockdep issues (CPU PM notifiers use raw spinlocks) create
 	 * a mmio regmap for pmu-intr-gen that uses raw spinlocks instead of
@@ -458,17 +463,17 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 
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

-- 
2.51.0

