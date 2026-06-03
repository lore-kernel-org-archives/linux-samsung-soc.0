Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11735E1C6
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2026 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450239; cv=none; b=qlJLqJlv0j4r3m3B5pGsFE27rHr/gWsUgng9DiFv2xN1iPelbMFJT68YIyKBARh62Wn2hqJdulxXZgNnUPisVlYv9ABBD1RU93v8qcqNu2OjFkRPRlQ48kwnCPHkIJ5qLE14RzkRhCSutdJTMKHBQ8dAo71NO5763Clkq1niNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450239; c=relaxed/simple;
	bh=yC/gGh4fjQ/sj7lFfE+M0v7xx0GKo8ofyflPQ+Uh4/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C3JAr1/ALbQWRjFqcO+q98/jid7toCSA33fFdXZK9DB3knotqnCYN8zVYC3LRD16slHjBbP3NogDsWp4ZVDA9TQQH5XuEGHcylGXJMMd797t9MKde6jypoOIh2ThQypis2k9R00j+Vn0dH2DAJQcEWm7VGpSk4EuqO+G20y8Q/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpwSVdvh; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpwSVdvh"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccea53f35cso54753956d6.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2026 18:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780450237; x=1781055037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqcRE4ZV9h59aWUDKIwLPgkTSVEiGSZVcumouuNOvKo=;
        b=WpwSVdvhWTEUEO54EzQjpwWK4tTzR9i0x1kZvXYM/lLvV8rrdMm6NobROY75L1Z0mG
         CXu9BigTYxJlRF+F9VAKGGC22s5kBSJMZwDMj/F0UL6FgHxClJTVkSkS/C/rEksxGrhk
         bP+ptAJeb2W06f6J539twecKicWOpDi8k5kPZPym25qpo0Y0m/BCiTzNYChqgyKdv8ys
         6vcc6wahLWddsAP4hgkr+mlIm7bzKRBqPFYy46iEHo0CWXbjPMwu/caytuIb1HSsxGcL
         fVgaG+bXDxS7dATgNfqTA+faGo6kzU5TuK5RsqdGrdUdQkvz55JqOPbqsj/KCOS/KtgS
         ix0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780450237; x=1781055037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqcRE4ZV9h59aWUDKIwLPgkTSVEiGSZVcumouuNOvKo=;
        b=QTf2raETRErMmQYjE7h0YctCr5Spy8JDXEuQMGagJcVuUM6pfgRrYGXqZyHn8sESWs
         hwvK37pY8oju2phaAKRFABoYBQ06hK2RiV6I0Na819aXNqEIHzhoxsArbB+BHgRjdSC5
         A5jiBgxO3+SZQIjTsX+Y1xHCyCpFeLfMQnpUadA9mO8C/dAK0dx6wZi9RVsYwLpqGoHC
         0cxKaq1luKfQc90TWZpHqnb+HNe7Y9FyyDAflNZBU5pszHng0HdlN62U9tpG6vUlkJZr
         pdOccQVGpDc1ldUHAbsdrIYNYtkjiYUPWUZR/cv9zShsy+8KWg3FD7iz8ZMYSwJgoZGu
         grsg==
X-Forwarded-Encrypted: i=1; AFNElJ+HtElEYI2qvq0vvsBcEiQU1HFegURcxR/Pvm2XVlO4zAiQ7wdIPD4TnUv3bUbgVYlb1gCECF58DUsj0yMovIw+4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdte5z3KaTWNBVXMp4/Q3DvTulByrt+RJnRr8ON27LZcRht2D
	FgailTwkqbZrMLZD44RCzWd5pBT8cp14IJ9S4gWq+uvenI04USTkfnnz
X-Gm-Gg: Acq92OE4LUJrLG3zHC67lc57T+tZQemrxdNC32+ShP/Geo51nHt0XT76rPU2DC9QnaJ
	vl1uEN8dDtXKg4yrbO9rTRqBcPEgXRSu8MbTjlp69BvC1VoZ0hAwsARLJiu2haIny6tsfBzGeDJ
	2TEeL5JEzk5+9eJuDC32q+2esaRo7eTN89eBriGe1Za/9La7bSqJePx2PRbB4rMUS6vXO+6l8PU
	e03gfHmK1mhZn1MEOVAzV16g5xXN9c9n/T+rvewgtM9NMoHxyN2+NtJuPhw4TNN7Nhmo2a8Pm0F
	1+aTXIuzYM80Mwp+NShAl+ScjS8lp30QNm25KPfNBdYH+4DryAg/eYUAPGKpmAuFf7deI+tJ4wZ
	IKv3y63/bgmNmakaMyMPWkEDOwT2G2pRJtQ/rZtuWx/H7CXcp6Ewjj5gvIWChOPkdsYjuKrFYA6
	fHKTjxxs23eqI76AYlYUzhD5G4vTMwVzoBJA8qO90IlqVu1oujUhPdkZ/hXMCLiir/mzcf4bVKI
	Wcg1l5rTwcg/ZRZvpDyhX2ch2GT7aj+drPTBggXVIVTqg==
X-Received: by 2002:a05:6214:4992:b0:8ce:b2e9:a4bc with SMTP id 6a1803df08f44-8cecdc89589mr18651456d6.15.1780450237066;
        Tue, 02 Jun 2026 18:30:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda0904sm7724306d6.7.2026.06.02.18.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:30:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] thermal/drivers/exynos: fix clock ordering race and shared IRQ handling
Date: Tue,  2 Jun 2026 18:30:18 -0700
Message-ID: <20260603013018.239703-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two pre-existing issues in exynos_tmu_probe/remove:

1. Clock ordering race: The driver manually unprepares clocks in
   exynos_tmu_remove() and the probe error path, but the IRQ handler and
   thermal zone are devm-managed and remain active until after the manual
   cleanup.  If the shared IRQ fires or the thermal zone is polled in that
   window, clk_enable() is called on an unprepared clock, which is illegal.
   Replace devm_clk_get() + manual clk_prepare() with devm_clk_get_prepared(),
   and devm_clk_get() + manual clk_prepare_enable() with
   devm_clk_get_enabled(), so clock unprepare is tied to the devm lifetime
   and happens after the IRQ and thermal zone are released.  Remove the
   now-redundant manual cleanup from the error path and remove function.

2. Shared IRQ handling: The driver requests a shared IRQ (IRQF_SHARED) with
   NULL as the hardirq handler, causing the kernel to wake the threaded
   handler for every interrupt on the shared line.  The threaded handler
   unconditionally returned IRQ_HANDLED without verifying that the TMU
   actually generated the interrupt, which could cause other shared-IRQ
   devices to be starved.  Change tmu_clear_irqs to return the interrupt
   status register value, and return IRQ_NONE from the handler if no TMU
   interrupt was pending.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 81 +++++++++-------------------
 1 file changed, 24 insertions(+), 57 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..5dc22006d7f8 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -196,7 +196,7 @@ struct exynos_tmu_data {
 	void (*tmu_control)(struct platform_device *pdev, bool on);
 	int (*tmu_read)(struct exynos_tmu_data *data);
 	void (*tmu_set_emulation)(struct exynos_tmu_data *data, int temp);
-	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
+	u32 (*tmu_clear_irqs)(struct exynos_tmu_data *data);
 };
 
 /*
@@ -760,24 +760,28 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 {
 	struct exynos_tmu_data *data = id;
 
-	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
-
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
 
+	if (!data->tmu_clear_irqs(data)) {
+		clk_disable(data->clk);
+		mutex_unlock(&data->lock);
+		return IRQ_NONE;
+	}
+
 	/* TODO: take action based on particular interrupt */
-	data->tmu_clear_irqs(data);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
+	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
+
 	return IRQ_HANDLED;
 }
 
-static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
+static u32 exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 {
-	unsigned int val_irq;
-	u32 tmu_intstat, tmu_intclear;
+	u32 val_irq, tmu_intstat, tmu_intclear;
 
 	if (data->soc == SOC_ARCH_EXYNOS5260) {
 		tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
@@ -803,6 +807,8 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	 * support FALL IRQs at all).
 	 */
 	writel(val_irq, data->base + tmu_intclear);
+
+	return val_irq;
 }
 
 static const struct of_device_id exynos_tmu_match[] = {
@@ -1036,43 +1042,22 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_prepared(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
 
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
+	data->clk_sec = devm_clk_get_prepared(dev, "tmu_triminfo_apbif");
+	if (IS_ERR(data->clk_sec))
 		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
 			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
 					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
-	}
 
 	switch (data->soc) {
 	case SOC_ARCH_EXYNOS5433:
 	case SOC_ARCH_EXYNOS7:
-		data->sclk = devm_clk_get(dev, "tmu_sclk");
-		if (IS_ERR(data->sclk)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
-			goto err_clk;
-		} else {
-			ret = clk_prepare_enable(data->sclk);
-			if (ret) {
-				dev_err(dev, "Failed to enable sclk\n");
-				goto err_clk;
-			}
-		}
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
 		break;
 	default:
 		break;
@@ -1081,20 +1066,18 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
-	if (IS_ERR(data->tzd)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
-	}
+	if (IS_ERR(data->tzd))
+		return dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1104,32 +1087,16 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 					dev_name(dev), data);
 	if (ret) {
 		dev_err(dev, "Failed to request irq: %d\n", data->irq);
-		goto err_sclk;
+		return ret;
 	}
 
 	exynos_tmu_control(pdev, true);
 	return 0;
-
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk:
-	clk_unprepare(data->clk);
-err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
-	return ret;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.54.0

