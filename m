Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D363911C3
	for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Sep 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675522; cv=none; b=HH9utHUSpZohzvN/SQFKiLoSmgQ/Ag6r0N4IfKoCUZLp2gC6571hd8VMHJGtf7KY2Aw0eJjG1qHI7Xbc72Wy+vPxo3qR35gNU7eOrlNnZ0DP48GXKdFEc1hoc34YPPbp0R61/8ej8a850N65rvJq6vy1t6/aNSR3L1nPofOttLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675522; c=relaxed/simple;
	bh=8n3mEnNKovFjnBAX/ZxC1AAlOybpUSBUOYFHeJFtLpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDZySkSQFAWnoaacxyyHrAhqDvhCV+H6pwj5rDJmIZpwYB8lOs3bIAxojyXR1nGwxRyzIflp1s2V0Q9vGwSThAyYr06Km76DFgImp9ur6TE6XLAmNAzKuBpDYqAVMxyP3eHql/HePrLcsiY+UWlSLDDg5P1mZ+tF47SzKMwkQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWlr/Bi2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWlr/Bi2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce98cb8165so24877715ad.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675519; x=1789280319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hstsV69fzA6quKQkqDKfuqXm3E+lvYW6BhdgjeUuEU8=;
        b=kWlr/Bi2ZqCF0ox9/TyI4qv4mzo2E2/MSY3AzRPht05+uwpDyvwCAOKEAuoOexFVnk
         xAhdJ6TLm2ED6K4nXAJ2sO0pfqBgej6a4mCtzqQiUCNDDKv2McD/K/1JGeTge6o/rBvA
         DSa1NERUCkXdLglAC/IanVpfRs9tfCi0atApPtYv6WySNThZYxretC81y6yT+azu9u9z
         9djXxkNyFE1QKA83fGQTVE09m84SYREfYvOR4c57JFjp6hYeQgDJ8Xjl+VSaS3e8mbZF
         /il3DibnC4VupHerHljhhZI+aRX90T0iyakgt2wt7HYD0gY9sE1xEfj4sBkiYvutMUkG
         R/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675519; x=1789280319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hstsV69fzA6quKQkqDKfuqXm3E+lvYW6BhdgjeUuEU8=;
        b=qJV0DKuKGYKapk+noGakK2cJ4R6aEES3iFcqQRgeyHPO9MFYhgUADwzYYKYh9CSMKT
         nR1x3EWlFQZOjbr/qTs6Z403AxrP6S8m4lftZAGC2RXVxmr927OxRLtUXJhf4QqLIcDT
         Hjc8f4Z7tqaM+LiI7wMZ0aWFBw3BnA44JnLRn0CJkZmTOdAnrWmdnefjLCyDQgoOIwVX
         dKxOT/4vlulM3E9gDsICo2/x7fIx8D3WW6qP+YHDqt8pN9ned/SCNupHdC+6Y2U1l2jk
         IjabbG+5ufvWXtqZ7CWg7VNt/cxXXJYcBmXLGcOzH/SB5I5ejLdr/8DKGyoqAyff6qR5
         MOIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwobQLtFPZXsKBtzRUIvJqda2eMN9a+PaCc5i7paChw3tdIHgMJttzmX3IpNKr4F7bYi27maoefsTzJcNIgPHj2xQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kopUZ+t6TUSYoK+rd8K+3nIxkYDimfcLVqq1hdjAb42quEy8zV
	9QiHGqibzI86L1hZC8XvwcSPhaoSGyfdk4wJmr2MqT/q5mOxctXRliUv
X-Gm-Gg: AYBFou0TPJO0PlDIzJnQnVVTMBSKZ/ul9TJofNclIdWH2EvOYexmrsh0qlY/AJcgke6
	hBp/arCBDXljM1i/BChxcc4k8JoCw4rQ0HqdeasWZI4nXnWPqKeiFn9F+IBmKceV9EGQ00JTPQP
	pmA4svVNfLZ6p3zGlT+EwidsLqXZELVxkuP+E0OgqN6wpA21RqLKOOBzeMv3yrloY8/fdo0gZVA
	4QQQSvEoQnyj4P84CU3kdWSfP3hBiEgZanUcuR28LmGZnZWTmnwxEzNh3y1TbBkWKp3gy/F/Hm2
	WIsHUOvz9b8wTjUzXxY80CApH1+Ay9VOKcbNRWoTyZ/ryXpOgjt33qemKWtp7LLQTKH3i77G0Lr
	8I/fub9LbCtvEmQl1NI/75sI7wKjv/9ahzBgk6f0nnEulfHC6hacMonugJUcdhVN/H6p5ZCY6VN
	u8e5cCPP+r1ZNxpQw3yL1s2aoD75LeWKNVBWR3+mXJlTWVC48Du5GohUHSdEU=
X-Received: by 2002:a17:903:1247:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2dafb136bd7mr193207445ad.19.1788675518720;
        Sat, 05 Sep 2026 23:18:38 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:38 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 2/5] thermal: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:51 +0530
Message-ID: <20260906061755.5103-3-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and dev_err(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/cpufreq_cooling.c        | 4 ++--
 drivers/thermal/devfreq_cooling.c        | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
 drivers/thermal/thermal_mmio.c           | 3 +--
 drivers/thermal/uniphier_thermal.c       | 3 +--
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 768859a7aed0..856d619370db 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 
 		cdev = __cpufreq_cooling_register(np, policy, em);
 		if (IS_ERR(cdev)) {
-			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %pe\n",
+			       policy->cpu, cdev);
 			cdev = NULL;
 		}
 	}
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 0330a8112832..9ada52cbf7dd 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 		opp = dev_pm_opp_find_freq_exact(dev, freq, false);
 
 	if (IS_ERR(opp)) {
-		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %ld\n",
-				    freq, PTR_ERR(opp));
+		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %pe\n",
+				    freq, opp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index af72db6299cd..4554a6fa55d1 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 				continue;
 			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
+			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %pe\n",
+				adc_tm->channels[i].channel, tzd);
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
diff --git a/drivers/thermal/thermal_mmio.c b/drivers/thermal/thermal_mmio.c
index 6845756ad5e7..b34e70991d3d 100644
--- a/drivers/thermal/thermal_mmio.c
+++ b/drivers/thermal/thermal_mmio.c
@@ -71,8 +71,7 @@ static int thermal_mmio_probe(struct platform_device *pdev)
 						     &thermal_mmio_ops);
 	if (IS_ERR(thermal_zone)) {
 		dev_err(&pdev->dev,
-			"failed to register sensor (%ld)\n",
-			PTR_ERR(thermal_zone));
+			"failed to register sensor (%pe)\n", thermal_zone);
 		return PTR_ERR(thermal_zone);
 	}
 
diff --git a/drivers/thermal/uniphier_thermal.c b/drivers/thermal/uniphier_thermal.c
index 1a04294effea..e451674d9709 100644
--- a/drivers/thermal/uniphier_thermal.c
+++ b/drivers/thermal/uniphier_thermal.c
@@ -286,8 +286,7 @@ static int uniphier_tm_probe(struct platform_device *pdev)
 	regmap = syscon_node_to_regmap(parent);
 	of_node_put(parent);
 	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to get regmap (error %ld)\n",
-			PTR_ERR(regmap));
+		dev_err(dev, "failed to get regmap (error %pe)\n", regmap);
 		return PTR_ERR(regmap);
 	}
 	tdev->regmap = regmap;
-- 
2.43.0

