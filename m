Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE401DFD84
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2025 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071856; cv=none; b=lTU6Vla5vdNCS6BjqS22kii3vsdXfTb7Xst7SwoT7ThjzrWsB/1wDpM7qFzemJURTR6S9fM/+dPdbDVdW2AL9Jtzm0kNl5d8O+vBcevDXL6b3ZDk9QdbShiRqLPZhf0p0E2ln1kPGutDpasQUbofMCukX92BgZkcn1WkKahig1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071856; c=relaxed/simple;
	bh=7U9tlCoZc/rOj7EH40BDPDvRFAVAP6sWxjfHvLHGmLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qW1w0q7YsRtGyt2Hmrcawjqy2fYyABDPBAuv/RG9wa2gWg0ceoQaJYe2Ndi9a39yPR7Y+StC/+NeNeTqZ803aXJKlZF5f5zmmdsBzuw2uK4bHWaD3DktZ0rdi39c8+9jzeJ/8WRezXZxayS/x87GMhLaIyYQ754Jf/kdRGUfuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qx6xcIG+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qx6xcIG+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4c4e6a0ccso359124f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2025 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748071852; x=1748676652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpN965PXtFApJwEIkCDxa4SlX4t9L4NYatiQcXWo3sM=;
        b=Qx6xcIG+sPZUrqp+YfccHJRqxp0H31111HcAhdSelhcHmPhQQk05tZ+XNJKiufzBsV
         Ih1W5hOUN9ks3Ucxb0iM3lQhbFDfHTdUy26doEU+Sq5bMoOy/NllGwj2XEKQ7+u/aGqn
         jZV6aN9msvOGVl0/j+u/fS59uTYTH/livak64ESXYRgy1/Qu9s9qbIk+mNCn4NTseyi5
         KaGcKBi4HCEAz2xxBvNxsFpSO7IsHXqXKHsj/8S2QO8xEJzRvZVyLN10fSMGbwYKfAG7
         Zih75p+PCxqrb7hm2CAq/aWSe0cywyqfPq0mrhxbotshD9RfoJx3s+jVdXjCFxWNa7Ew
         Ptag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748071853; x=1748676653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpN965PXtFApJwEIkCDxa4SlX4t9L4NYatiQcXWo3sM=;
        b=DRV4BsKMHdoX/GkwmKn/13S7mxkcMYRkeGiG7BtMq+a5vEZ1NUUpw5SqGOTsksAmqN
         SVozUh7em25GkexFKPa/AwAOdunMfqJoIdkm4FuCp3FZJxQXdWEP82guQ5lc3BSd7Ij0
         SskN9MDgLL26xYakRjIM2bBcnCJehCPutcOuHAYwWxYLzT+rtplp2g7ZgmNzojFf+KRM
         Edt+9p1i2PRl06B13ZYzMwr4v1g713/ViZvuAETzDSd0cO+DbBy9f0DaZvKiQgo6IPT8
         /c64EVhzIrs/ZbPMcI0Jy7U5UasyKoBsq9CjSdXRRN1+cdd1J/BMMf3HUiybk6syuILs
         7/tg==
X-Forwarded-Encrypted: i=1; AJvYcCV3x1k0jnLlirVtBNawmy+t/C9JW6dNJsu0szQM7OlNG8XnOx6hJi/DlThY6qYOUqB0pCa0CD73T8FOYhyW1l5ITg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsqM3vhkoyNk9CgRDBpQeFcAZOZv+/7DE1NdnddbHhCa8PD8i
	NHKscMHDOILWBhQEtLwb7Ov11c1BlsjU2aNhgI893exYiGo32uCShWSEybQzNSwymL8=
X-Gm-Gg: ASbGncvzH2ZQlrQUQX1LO+COGdKDPo1CfLl0plt2MAjM/26/RiCxGwMLEVqj0g5KDI9
	sN5vhmkp5upmG0XoP+L2fKwVUQ5uNyDwQfpy91E1h0mOqbIDGZXQt6k+vHLzGxtX6IxNAMkBmue
	M/kTrcQ9Wqtj3bgpNwmUoohxPMzoxqsvpr34/hn++eHHW4SywXMUDS4xxG4M7s/CeziGzSYKRqw
	WUEAh2iFOilI7RqS4YzHkZpEO/rvoi+VqvUgPSELhuU03FaIyWbF3JK0F6RjYTdtDQf/tAtvjKS
	Yk/fF3uCZBRW/8ZQyxeEOiYWkteQrOOhn++ZzsKuqmg81jhQc7svIPM0Nyntjdax44OJlshLR76
	TN7A4+mU=
X-Google-Smtp-Source: AGHT+IF0wVjcuoZd4VTJ0sGnuwAU+9jQIdeBlKfJuU5uEJZ08QXI5uRMh7/aqwevs21KvTC+SndKRA==
X-Received: by 2002:a05:6000:2890:b0:391:23de:b19a with SMTP id ffacd0b85a97d-3a4cb464885mr1858085f8f.31.1748071852553;
        Sat, 24 May 2025 00:30:52 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3ca066eb7sm10924273f8f.2.2025.05.24.00.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 00:30:52 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 24 May 2025 08:30:30 +0100
Subject: [PATCH 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-gs101-cpuidle-v1-2-aea77a7842a6@linaro.org>
References: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
In-Reply-To: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6895;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7U9tlCoZc/rOj7EH40BDPDvRFAVAP6sWxjfHvLHGmLE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoMXWmtDVOeQQo+H2c8AvBH76fkztXnDVtGuqHJ
 H/MOqEBp7iJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaDF1pgAKCRDO6LjWAjRy
 uvt+D/0bEVtxwCaxiKJJL5LsmcMbQ09zGgPLJNXhqcCbb4XRLAVXkYKJnwc/7SC54L78zeTcBmS
 sVdtvXO2LLihhhB4gE/dZrdoL6DFKdfv+p7EWTWY39yAluPT8Ws9dyu60bmSnwtETaB5TvRORLr
 CVpi1KXEZFqcLRd76WdwhOC3TfZGZdKTlfSQoVISIYZY30N1svryxaDJ0jtyVJ9yq4bmGGg6yNb
 r6LsXie6JJH/SL2iCEDXGj6JoNT+cbicc5ezR22b+edZqR16pQufrH1sDH1jDTnmmboNUHnYDzC
 fSI3li6BxlMIgZ4Tge/XxCGIQ1OcK1G3+nV9hoxZM0AkQ65EQ/mY14m1e1zYl7rVHXTC4UAqIce
 ab9dpeA/rDq/7AXDV05Rt8Qrp60mvG//C+R7tp+MyEv/cofB6mydmzHb2H/PdlZwhk7a2I1fMY0
 kf15KNkn87hfj9rZZmqXMAdMORi5G44moutqZKAJ4ZR9vuXN4to1tTl2QoccSM7w0eMK3lnMH8U
 4lvxY++hVNk6J9uWZd5nmql7NqnfqaXKRXU72FRvSsoOS0tN6Uvlc2PuAkXpNx83FbV8obI6J+V
 Bgqtlt24gLXBORP35mOAIFPwUyshxgEdlzr8g5+QrqtFVNSjwWEONlnxDPG1lwRG7N2h9W2Z2ub
 fXQSh7iXFNUrK4Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Register cpu pm notifiers for gs101 which call the
gs101_cpu_pmu_online/offline callbacks which in turn
program the ACPM hint. This is required to actually
enter the idle state.

A couple of corner cases are handled, namely when the
system is rebooting or suspending we ignore the request.
Additionally the request is ignored if the CPU is in
CPU hot plug.

Note: this patch has a runtime dependency on adding
'local-timer-stop' dt property to the CPU nodes. This
informs the time framework to switch to a broadcast timer
as the local timer will be shutdown. Without that DT
property specified the system hangs in early boot with
this patch applied.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 135 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 131 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..314f543d46b82dc3e991a5928fea50b81d4f92b7 100644
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
@@ -35,6 +37,10 @@ struct exynos_pmu_context {
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
 	struct regmap *pmuintrgen;
+	spinlock_t cpupm_lock;	/* serialization lock */
+	bool __percpu *hotplug_ing;
+	atomic_t sys_suspended;
+	atomic_t sys_rebooting;
 };
 
 void __iomem *pmu_base_addr;
@@ -336,7 +342,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 #define CPU_INFORM_CLEAR	0
 #define CPU_INFORM_C2		1
 
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+static int gs101_cpu_pmu_online(unsigned int cpu)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
@@ -358,10 +364,26 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+static int gs101_cpuhp_pmu_online(unsigned int cpu)
+{
+	gs101_cpu_pmu_online(cpu);
+
+	/*
+	 * Mark this CPU as having finished the hotplug.
+	 * This means this CPU can now enter C2 idle state.
+	 */
+	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = false;
+
+	return 0;
+}
+
+static int gs101_cpu_pmu_offline(unsigned int cpu)
 {
 	u32 reg, mask;
-	unsigned int cpuhint = smp_processor_id();
+	unsigned int cpuhint;
+
+	spin_lock(&pmu_context->cpupm_lock);
+	cpuhint	= smp_processor_id();
 
 	/* set cpu inform hint */
 	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
@@ -379,16 +401,89 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
 	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
+
+	spin_unlock(&pmu_context->cpupm_lock);
+	return 0;
+}
+
+static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+{
+	/*
+	 * Mark this CPU as entering hotplug. So as not to confuse
+	 * ACPM the CPU entering hotplug should not enter C2 idle state.
+	 */
+	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = true;
+
+	gs101_cpu_pmu_offline(cpu);
+
 	return 0;
 }
 
+static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+					unsigned long action, void *v)
+{
+	int cpu = smp_processor_id();
+
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
+		if (*per_cpu_ptr(pmu_context->hotplug_ing, cpu))
+			return NOTIFY_BAD;
+
+		gs101_cpu_pmu_offline(cpu);
+
+		break;
+	case CPU_PM_EXIT:
+
+		if (atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		gs101_cpu_pmu_online(cpu);
+
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block gs101_cpu_pm_notifier = {
+	.notifier_call = gs101_cpu_pm_notify_callback,
+	.priority = INT_MAX	/* we want to be called first */
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
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap_config pmu_regmcfg;
 	struct regmap *regmap;
 	struct resource *res;
-	int ret;
+	int ret, cpu;
 
 	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmu_base_addr))
@@ -444,6 +539,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			 */
 			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
 		} else {
+			pmu_context->hotplug_ing = alloc_percpu(bool);
+
+			/* set PMU to power on */
+			for_each_online_cpu(cpu)
+				gs101_cpuhp_pmu_online(cpu);
+
 			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
 					  "soc/exynos-pmu:prepare",
 					  gs101_cpuhp_pmu_online, NULL);
@@ -451,6 +552,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 					  "soc/exynos-pmu:online",
 					  NULL, gs101_cpuhp_pmu_offline);
+
+			cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+			spin_lock_init(&pmu_context->cpupm_lock);
+			atomic_set(&pmu_context->sys_rebooting, 0);
+			atomic_set(&pmu_context->sys_suspended, 0);
+			register_reboot_notifier(&exynos_cpupm_reboot_nb);
 		}
 	}
 
@@ -471,10 +578,30 @@ static int exynos_pmu_probe(struct platform_device *pdev)
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
+#ifdef CONFIG_PM_SLEEP
+		.pm = &cpupm_pm_ops,
+#endif
 	},
 	.probe = exynos_pmu_probe,
 };

-- 
2.49.0.1151.ga128411c76-goog

