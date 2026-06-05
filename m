Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6423254B2
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jun 2026 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780690751; cv=none; b=AdY/+eMwE7i3uZkNXdnjUBlPKIlVRR/5MAAa7xDQ8Dkxzq/qdsiMOiUPTZmG8bZoDHx0eT0PES/zkk1//Q3toKnmbMy979NqtXj4E0zQV4SQ6fH/yLg2l2BjeFKEDZ+3xsWanfu2SBQl1AWmbRUqpF915HCYQmaHHG1QLtfkTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780690751; c=relaxed/simple;
	bh=i/hR1lgYvHPPw5OPf+wLO0gns47TKhXDAvO92AjK7uI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuNmqdl9maSG4TZdILRYN1CVHFIkVl1rW9o2gJRrRVMN2CqcqCmphw3/dfCOvRaOWDfQGI3sSe0zH6xk1EkeVJkPO6jxUXVPrxanhQoTwZzHKCsFRZrPIP2vTUnT/o6k8lDFrdbBGEnWtW4slTJ1PM3EQmbvdePmIVilN4YYK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TkXvAbFe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TkXvAbFe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490be03d47bso19334155e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jun 2026 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780690748; x=1781295548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0yxG0zXdk7r1+vfGjZGqqrFGTovMPDmklAlD/sL2QA=;
        b=TkXvAbFeHWMdhfNM4Z+6MVi+bcHQfYTeoFNgsekLaEWSBp4UN3tq3u6mp1CsSz/xNq
         nII5/FfIbO7lOr3kdq0dVVvic6DqrI9gnUphap4AEjZTxDpqqA63K5wClsBP4SQHl20V
         aEmOvfv2c6hpqTud5m7UpUgeduu+y2uMCMYPl/ZXOMzLGSPnEZ4zwH4Ca82V7+cT0Kts
         psvZ5XXmX9OZ9IwfzmAi8YOpi0pserHH3kBEqxbL2FP+XMg1rwr1p9SR7W0wUBSk0f0O
         gU5laXzD7+44+bH6aBC4ZrNtG3ujI1XHuwPofzxzkW0mJpa2JAXHjdmqMweVQTQTSIxe
         pcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780690748; x=1781295548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0yxG0zXdk7r1+vfGjZGqqrFGTovMPDmklAlD/sL2QA=;
        b=bfEZoutCWnX6YfOjEFhv2F3yfRQEvsQP1xKJr4ki2MCalpYPyON/G9/MLzy7iNPgUM
         iqItqUoxMzjtjPTUewRY4DsRlPD7BlZQYcW97poePBk6iHZwu8EWqlHXLovAQlrBVmT4
         w60nF5cF0Sl6cCniGPwwJRAbf+NSyPlYsJgQCIwkpwlBC94TMuFs97nfp4XLkL6WAGKL
         PoCAXJI42dJxFHrR/6l/7BvuZ1+2udXu8rrlTVBvAd2FE8/ZYi/3ImDSvkReFS19zvmZ
         xOGGp11QTIgSj1OCyxL3I/9LeuPGdsJ3dAWZg1Zyimd6vnbZEjETdS0+wfdumUAAah76
         XlfA==
X-Forwarded-Encrypted: i=1; AFNElJ/UuAoSEK2qoKn6GiKkP07Qqk80FSsfaTIF9yDEQ2K+GYPIeeia7MSwZp57l1qmr/GJw0d0uKfRkDRB9eMCqfjuTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvs+xLQpCjZxAd/9mL73XGsYJChve+4IKCTjMf81yDu40nk4EY
	Yw2D82XTfM9+cOrrv3SDfFe0e9W09LkQUBhV3z55j3VIPrrsTjgm0xE5xqYGjKgcIfU=
X-Gm-Gg: Acq92OHQ5g83yMGIkD1TAXTavbOMUNybZd11L0TAesR9/Y8EJN6juPmIrQmfzoKsmcD
	rRIIie7YEhqPIZ9kO/58XfiDPlntrLpRWI0Csxk6r3BxnPEX/Gxot5QzVijBbUppfifu4wOKTpv
	8VCxLvxJ0LD6PtNgRzQ1bOej9Qq1RFwTf7icJ6wtXR7tvcPnhJgcaDaTskBqWqGFLiMA1Hf559b
	DN0f3TBbRvYLxU+9ZWLPcvgBJFu6oHkfoge4XuizjB0etjQ9yMVUWHR6vphrbY8lA0Ae1kl1Tl2
	K8iVdHQN6gVyQVwMIjibZwhiGjo26TSd1dq4E+2hQrTnx2fa39HpKv1iVQTVmhthOabv/Tj2QI2
	40lMJmbHqPaLH+Vmo0WN7jNHm/EwV6KmJ/fq/ltyax4mnyegAaoUM+jPqNf88HE5O/B3HR1RvcL
	SY5SRQrAe44VjWnXIdThyjfqR+65hK5ifGzbBw8hMNlL44+hbK38TCOmVBDBBysAjMtr3bcN1tZ
	W1uOsTyP8FCs/8x25MVUOKzgUI=
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-490c25e1104mr89266485e9.19.1780690748518;
        Fri, 05 Jun 2026 13:19:08 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm190533895e9.14.2026.06.05.13.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:19:08 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 05 Jun 2026 21:18:50 +0100
Subject: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in hotplug
 callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
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

The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
__gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
determine the target register offset for the CPU inform hints. This may
be fine for cpuidle flow but broken for cpu hotplug where the target
cpu is passed as an argument and could be different from cpu where
that is executing (e.g. CPU 0 offlining CPU 1), meaning that
smp_processor_id() returns the id of local CPU but hotplug flow
deals with another CPU core undergoing the transition.

This causes the pmu driver to write power down and power on configuration
hints to the wrong hardware registers, messing up the power state of active
cores and failing to configure the target core. Fix this by removing the
cpuhint variable entirely and utilizing the target 'cpu' argument passed
to the callbacks by the hotplug core infrastructure.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug support for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179..6e635872247a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 static int __gs101_cpu_pmu_online(unsigned int cpu)
 	__must_hold(&pmu_context->cpupm_lock)
 {
-	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
 
 	/* clear cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
 		     CPU_INFORM_CLEAR);
 
 	mask = BIT(cpu);
@@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 static int __gs101_cpu_pmu_offline(unsigned int cpu)
 	__must_hold(&pmu_context->cpupm_lock)
 {
-	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
 
 	/* set cpu inform hint */
-	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
-		     CPU_INFORM_C2);
+	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
 
 	mask = BIT(cpu);
 	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,

-- 
2.51.0

