Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F407263892
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jun 2025 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634480; cv=none; b=rKRy2MjYZcO91k9vcO97bX39qmAuJip4V6QNhvgZyijfoNBmkLFu2Do+ktXyxtZq+zC9tz+Ne1Vsq1dT81qIVF6izGrrmQ59zHynQfxDeId7M0HLHvDVEGiJgM9e25bLY6QSGNjLpbIRqOvb8mkYbwnRLosQrFRVtIoicEe1LM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634480; c=relaxed/simple;
	bh=qTs3IRLu5xA+mhLIgJ44rsQgmMvxnUCHZ/EW6gO8Vwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HaUwYVSliEQwWV118pqbf3TJvP+GJYfdqpiY35Ocvv34HhpNhM7VmeEounUOr8grm/PkRfL8SuUTVyZfvz8M8+C3SkRDZtSADnzngrukHkFzwHLrzDzdAZMCOqLEJAlNz3DtL5EhEcf1vufYf1sS3Sr401h4lZi/lRiewPGsO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTjfz7cE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTjfz7cE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453066fad06so27600785e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jun 2025 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749634476; x=1750239276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVeXPFuPVbQsXF19uNENjG1a5bYP5vKL7OyCc5YR918=;
        b=KTjfz7cER/eUSzfoKtqll9Na7qTxZjM5NjeUSZbSsv0tOf1w94/H6mHmE8WVqNeadl
         HOEGplYkeNuZ5SlkwnfDwPApUcKwRPV3W/Wm370E340BXcTxGmVCwB//A597LssuaMcz
         ZakoOD433nYqcrhKsDbvPFueWzN7MzyHPkHqZzPuOBrBERVov/g1cRvdhEwSunwx/gw6
         WliGtnh2oWlBl1ZSq29FmK4j/bZoKZ5AefHhz1qAzXkjLO7YwgMdtjqy9LjnPzl3npEs
         X6gaMTwBhcKjWHJALOD82eHZNZodjoTn4p3rAZlYQP34A+yqyCFIlhjVSsWwvFUxQcOX
         lPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634476; x=1750239276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVeXPFuPVbQsXF19uNENjG1a5bYP5vKL7OyCc5YR918=;
        b=JvGjULBu1KuWZOv1PS7hMSHvCnnRQHYPYbAbyQIGcWX1e4Dk+ISgouv4rkNBAOM/Gd
         2LHOC1NZbVb6S033+G4wC7EAlDaGApPf8RhsNIG3F67r0PXhtLvA3oTSICFgNPKHkRR3
         sbn9CAZLkyTenkpP3F77cKfIH9dPEovzSHieEvaDvsHK3sB48a5avv5TIPVQ5oqPW4Hd
         teXuR/wFDXtSNPIOdcb/ZYc0t0LV3VO0IFqXK5ZtoDUSm8BvCXefBs0jx+xCFfwtWuO1
         teKenPtsxauE/MFvbbp1fNv8R7vxwpDDfIHKgoaM/Bes9Oet7t8vZkia/AAqUqzFmaqc
         h1VA==
X-Forwarded-Encrypted: i=1; AJvYcCWZYIYUEJyD1BGHu4CFNo3Iv4hGA12IM8bqimbjGRPuQ1zNno7kEzLsB6q+6G20gKtjVYkAsrdxa66I5+pIEexlEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwghdNJXazfO6IKeZICN8XbVmNr6cf18IXQjFa0P+XTO2RRdeaC
	YhZ8Fet53ZmOIERDwOU4Ya4oNVYX6afaZFtYvs3aSc6acUcC+hT/z/McAywjfF1xXKo=
X-Gm-Gg: ASbGncsQuzA+hFhOqaRoM4OrC2rahgoLMcBPNLVyUTB/HyJZqt9hur0Or7crDlvWmJ8
	Uryl6bpsfkOFQvUALBmQPOUjZxmE25i+YpaEoqzAlAA4icN2TeBrseKE8cxWA7iilFVPipJsKJ9
	fqbShyJFadspcmJ2bUJbiZFS7PeWppImG5M7tBmQ6xG5x2R6Z0G4ffuk3bgu0tfyg35p0CrikBu
	mGsegNlT3ptTtKq+lx0Nm58U6PmR7BjwJjgHjzTu4tj8g/ns7ooheBFvjBF7T2A8+c/0YERvVNE
	tWrlkyyIpXz1OLYn/Dm9T74M4cvHAswesfBRQZiYYTMJS4IIM4+GBFHoLTZSoo48GNQZ1czQKhO
	O8EjQ1xKBLf/xlX8=
X-Google-Smtp-Source: AGHT+IFezP6rZ6NJam3qkYM1ont9V/Ju3WNFxU4NhSoAWiBk+tW7MeR71vKuui0yalRYjWiHv6SH+w==
X-Received: by 2002:a05:600c:8719:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-453248f9836mr22050755e9.18.1749634476351;
        Wed, 11 Jun 2025 02:34:36 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453251a2303sm15467005e9.31.2025.06.11.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:34:35 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Jun 2025 10:34:26 +0100
Subject: [PATCH v2 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gs101-cpuidle-v2-2-4fa811ec404d@linaro.org>
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
In-Reply-To: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7073;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=qTs3IRLu5xA+mhLIgJ44rsQgmMvxnUCHZ/EW6gO8Vwk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoSU2lxp0CXerInpZzjgxAxPDiAXS+cx5GGZ3wL
 66Mv1PObHKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaElNpQAKCRDO6LjWAjRy
 ugz7D/9ycWCS+1kysD81RwKEkYsnWRulQwV4baIqdf8qXrUZQnpecMUToyOmrIR/oJVJ0yzWByh
 gAmVsSxSHNJrzgTq+f9ebDMNTPtCx9xQMoBc+RVSUcNIhhMl3gohnBz1+1jpIERNxn/yreNT5Us
 frHSHyEUzMJl+njMaelO9Vlz6/Pcl3JTWOC651/TU22n5lHFkf3ljfx4oPnv6u6uKhobVHBdBmZ
 ITISASnTUdBdbAEQ+ZQOUBj0Nhdc595E/McvaeMoqWa4OkYxRT3ngMpiBJFkQUoH/e/XNln/ncB
 2l+yKdB2B3ss20rnc62oXlstrqkSM6aCJ/bzuyJeRoLfMHdH0jRPTk9h6xrpgZYgtdGQD1J0Vhv
 C1+CJxE5PY1tS0VwZCRjG92jYLcfAgdPwUeajIxA1w7oyOv72MaMGh5+8ye8mizG2RzGVsO6Ed0
 o3eS8zWc6GNsSMoedxDBHU4TtIsZ5AC40onJL2nPnKk3Ro8pQCxGRhWehSqUjkhh5e0Be+lRRxh
 aArz7RINoGwZu/y+MYbq0xlNY7dfXKBXja9N/ge15MBWkTsnSMqzzFQqX033Sgizr4i5hhP/63l
 bV1gZHhoVXUSKfKvwPG/mjBRR3KvmMfQCUkkFTUiiRg8rlx/kuPjuHuAD3omWXAa0AwsSEuGFTT
 IhL6HciJ6J7uRRA==
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
Changes in v2
 * Add ifdef CONFIG_PM_SLEEP to avoid
   Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
---
 drivers/soc/samsung/exynos-pmu.c | 137 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 133 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..7f72ecd60994f18bb639dd8e09e1c6ff6158066b 100644
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
 	return 0;
 }
 
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
+	return 0;
+}
+
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
 
@@ -471,10 +578,32 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
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
+#endif
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
2.50.0.rc1.591.g9c95f17f64-goog

