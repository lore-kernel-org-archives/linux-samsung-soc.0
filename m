Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF0449EB7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jun 2026 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780690754; cv=none; b=PApatzLOBWh6Vq4l4bdP+5f7+Bx0FTKd0kpLCGvwVyHQOLF9YRapd5X3aQOpbcV9GEPnlI/fI5Q1+0MWEHpTSruTp0U0Y23h5Kjmy/U+ty6DvYXnBvGy9nrt7WA4R2iGO8iZF2O/GuYniiLwmFR3nGdPtX/1HNTiqjfgJ8jsw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780690754; c=relaxed/simple;
	bh=HRCZhVoWK0niODWt+XbH4EjpgqnXLW23jOkUBvgIqgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWSR36/5CShQMW/eObCa1UkPAJusqamJK3MaQBocbqiQ9qA4l9gYFRvHVkK31CTC57xv02S/Jh8fObe8Cl1ZbInKDozv4DRMOddnNf1YWW+hoZLb7CGoXRNyUXv2aZwGdNSaslhp7tPKeahuKurx1EwcXeo5FkLT//gM+IazN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sU5fyK5g; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sU5fyK5g"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso19162125e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jun 2026 13:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780690752; x=1781295552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POfwTOxPePIR+bzQ/YWTWSHHwFIOZT4YImIC9EJ68WE=;
        b=sU5fyK5gYcSzWubJr35fK1H0jTC4PhI3utTSRW1psYPWa4dMe5GduD5nwK1Vw6zvQZ
         uprW1ahtwIHLn0Dzlbrd14IA3QJzIEnjURC/nvxHizO+rCy8J4hqhk5JEMv/+JH4c9ri
         x9kNPVydvRsiT5nmO8YHbU4RYpwQ7h4HtVfBe+1esqI7J9cQ5cywUrxR/onbnisyJIvx
         hyQGSbLWDkLxKCXkFI0ogXt8gmOWnkuru87iV68P8/y9J8E/e6ojX4rcHSgpPHHW0yJT
         VCRDqtPboZcTLqe4BkIVCXCJNPxgTdUtoeLx1TwXLWH6C53YJZwNtVOOWO1oq3jsPxgv
         WV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780690752; x=1781295552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POfwTOxPePIR+bzQ/YWTWSHHwFIOZT4YImIC9EJ68WE=;
        b=ek0cLgCFmmVJcAQA9w3bzUEeFYTq05nLj/91+Yn5z23uewTEauZw2+Wl3EApjwdqv8
         P+rb6xOWBzyOpeWUfxqIX/rzOmLUh+utQiSjr1MH8U3mKakBawbetJ1Gt+qb/eruHMVi
         SaQ8Tzur3lLu1OTxbqQCrX46Yb3P8tS9w5wwNV+CzvxDYFu1PBZW3XVX52iMYVQmlbI7
         6WOp+TUWLZHbQYyeQEqePUzcjqikY+x9S2HePeKwL/78lJyiBHFyGSgbxf7s+xWFNYgb
         T4lSauhkECWKtxD635nwC3C4KLThdLWWXpFbDC3upAzTdtTk65d9DUMxbnGph6eAcq4A
         ISAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GAT7VbAw77XvGB4IU/QnzZnC+Qgzzl7Y0DOJoHkT2CsPFTUqe0BH/QkVZ18dNYunysoLzi2LagsFGHQqM3D5xMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwydX1QHn9WnD7nBko2JzUPu30mx8De0iWkGgVNw8aQf2K0O3wk
	QH+NbnXnF54SodkE988azreNYkIOdSDf1/W8RIrZn2Ab8ELpxfrZ8nY92BzP7JERoJ8=
X-Gm-Gg: Acq92OG/dR0K/ZvendVII6sDEAcHfZUd/b1hz8QosOYXiYNytQKOG1U5glV/ebnl/5D
	czmUCA9uaN8T+OehtUj3ZYP9c8AdRXflNtqdxyuGa9lAHFIFs3rMWgd/+MCeEC6B+vhW+v67ulO
	vcpSGt1lbqqMWIKUe1Th9rk0y0LFPXyVUP8SDKxMl3PmwOhnxyW6fMNYXsq5+NM1WzfK4Rf/lGd
	iFGtX7y+gInZ+UY5R51pbvb/Eis2T32/pABZDIV8GemZbN+qCqFiru6071m8y0mJegkNJIaQ4zE
	B1VmVHR6r9USZmgtr2FSXlyWJd19aMI1rbFzOjLc7vUs9byPF2ItT2sEbNDphUVg5cSbK+o8MlK
	jqkfpFcjAloH9eAv4mtmCpz+Y2CAXFaP1BrP+3SbJ+DfgSEqI4bXmxKUpDFh+Fm6p3MZ0xU1gJQ
	fZOW6hTdzo5/VyOX/XfToCGmfKNImZihZSelKczj9VJvNNUT9fnphc8jNV7b+K5jLXUqCzoUYO/
	tCWmpGM6XiD2GaJwEJIhiKD2XI=
X-Received: by 2002:a05:600c:8705:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-490c25898efmr107486035e9.5.1780690751755;
        Fri, 05 Jun 2026 13:19:11 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm190533895e9.14.2026.06.05.13.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:19:10 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 05 Jun 2026 21:18:52 +0100
Subject: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), and
register_reboot_notifier(). If any of these registrations fail during
probe() routine, the driver returns 0, leaving the driver partially
configured.

Furthermore, if anything after setup_cpuhp_and_cpuidle() fails in probe()
routine, for instance devm_mfd_add_devices(), the probe() lacks an error
path and leaves notifiers and cpu hotplug states registered.

Introduce variables for the cpu hotplug state IDs in exynos_pmu_context
struct, that should be initialised to CPUHP_INVALID by default. Check all
return codes in setup_cpuhp_and_cpuidle(), and add an error path to remove
registered states on failure. Finally, add destroy_cpuhp_and_cpuidle()
helper to safely tear down notifiers and cpu hotplug states.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 57 ++++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 9636287f6794..846313a28e9a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -38,6 +38,8 @@ struct exynos_pmu_context {
 	unsigned long *in_cpuhp;
 	bool sys_insuspend;
 	bool sys_inreboot;
+	int cpuhp_prepare_state;
+	int cpuhp_online_state;
 };
 
 void __iomem *pmu_base_addr;
@@ -404,6 +406,17 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 	.notifier_call = exynos_cpupm_reboot_notifier,
 };
 
+static void destroy_cpuhp_and_cpuidle(void)
+{
+	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
+
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
+}
+
 static int setup_cpuhp_and_cpuidle(struct device *dev)
 {
 	struct device_node *intr_gen_node;
@@ -465,16 +478,42 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		gs101_cpuhp_pmu_online(cpu);
 
 	/* register CPU hotplug callbacks */
-	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
-			  gs101_cpuhp_pmu_online, NULL);
+	pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
+	pmu_context->cpuhp_online_state = CPUHP_INVALID;
 
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
-			  NULL, gs101_cpuhp_pmu_offline);
+	ret = cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare",
+				gs101_cpuhp_pmu_online, NULL);
+	if (ret < 0)
+		return ret;
+
+	pmu_context->cpuhp_prepare_state = ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
+				NULL, gs101_cpuhp_pmu_offline);
+	if (ret < 0)
+		goto clean_cpuhp_states;
+
+	pmu_context->cpuhp_online_state = ret;
 
 	/* register CPU PM notifiers for cpuidle */
-	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
-	register_reboot_notifier(&exynos_cpupm_reboot_nb);
-	return 0;
+	ret = cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	if (ret)
+		goto clean_cpuhp_states;
+
+	ret = register_reboot_notifier(&exynos_cpupm_reboot_nb);
+	if (!ret)
+		/* Success */
+		return ret;
+
+	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+
+clean_cpuhp_states:
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
+
+	return ret;
 }
 
 static int exynos_pmu_probe(struct platform_device *pdev)
@@ -548,8 +587,10 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pmu_devs,
 				   ARRAY_SIZE(exynos_pmu_devs), NULL, 0, NULL);
-	if (ret)
+	if (ret) {
+		destroy_cpuhp_and_cpuidle();
 		return ret;
+	}
 
 	if (devm_of_platform_populate(dev))
 		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");

-- 
2.51.0

