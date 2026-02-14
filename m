Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4742FD673
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093195; cv=none; b=H2AR6yfTlghR0GYtb4V742qyguyN5w9jiCFQBSMM4i42+uXs6crSYEBq0IoptkWfcOjH/c26w7iyCyPrnB9wxaCVUZtoYG6tQR4LhBMAufl7r5NCsxqJa6AfFspvba9vd2KsFmSNrUosL/f0Cn72GE6/ADrfkwICCLUjnklyBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093195; c=relaxed/simple;
	bh=pErvtY3ihK17Sb6LHbdNsewtgB3895221qeOyAaYxy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVcEORiwVCET5UT4QvIQdajFPPEcfXfGxQupiXUa3MYzJi4zqmZ1/eZzgud7cM6LH98tqjyAcKOQxePQNtsDAhc+mecmV9xLOdO5bP3+do4QyZSGU7YCApTD3d7pcD6jyJoOlJ3wAljAV1x1u4Go9dVZq2eSe5nNmHU3Jv3yTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqFX+ODh; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqFX+ODh"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2ab232cc803so9070695ad.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093193; x=1771697993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=KqFX+ODh2sbu4S6ALbYF0n3BXe5Q7aTS7KbA0tI4vUMxSO163cd8gLFaYcdIbsdu/1
         Klxua+Fc3QK98dP9Qm7T48tpZhE734vXnnNFVdnTQ/d6XigMh7cNqd+ERV3mILf9D+gl
         g0ft1T5aCTwN0xyRFyU7IONAyd9Z47haiPq9FGI/q0BR8dLyNxlXmdXsXyUnr5w49+U4
         i4Yc4GgzrdSfEq9ybP2x0oQtY+C41yzLKq8AuH22j4AG5i2PR/owtlTPVkLgVAdj1A6X
         E4ky7Q+uXDRn8oJqkYsNJzKfO0OzKNpFlPWeGqSdR/DlYwihcJH29eTovw0zqCahIe7M
         CXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093193; x=1771697993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=Cm09wUcTNeo5/bsoQs1vqkBirFr/xdjwEi19wal31NKeH9K82C8As2UZygknD+i/YS
         FI+OXEWExGDPA8h5CrVGHKsm66zhXUVA2KBjRYT35oTqbJ8rXdZ4h7kSLQzawS+w09CT
         wAPNihc5xFSB2xw/fie4sg+OzHxmFWJilrCznoFlr0/XkR7SmPksM62zvUyUQBFaelrv
         oqs46ffo3qvuyaNgehAFvZwwBX+26Z4TdxE1VBfeo3dt7uJjSY0Krhb+THEsl92mOVdV
         /uOhtYZ3jlCAC2n0iivQdVr6Xu2rK1qX2nMSZ7ijLJGtMD+QUd1gFTnoogT31nSLQdBT
         amsg==
X-Forwarded-Encrypted: i=1; AJvYcCUJol92gI78urDP6Jcv+qqMzmvMyYXQp6yn0VTHUb4sQzIyStvmGFER7s2Ioot56dP544mzayRvRCri69KUH3twfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jiSwzXpTU5oO88w9zJVOI5giqhXB27BD70HLsKNP8AMYn6q/
	124bmA7i8VcTNJkEkEPyGzR3hEt3O3ykwuGaM4TDKvDiMH6IfE1c9Lys
X-Gm-Gg: AZuq6aKLAJgQzHMKOqmbjPV8V64rGWR6OShBE3pkZkHaCNnDUtU/mcQRubyvtfIOhzr
	hsDll2uIvGY+Og5zdocUCxUaTm6uIwucD2slv3ztiK25dk+guX53RxUKTsx0p64VxkmEWXkKg5w
	u+GzJfgG+9rDepWAWSSS2FnzeYA3Ud056mLGlZI7gVlgra3XrAiAjQNEpM3OQH9jvgkF5XOJFz5
	iJ8LTCMz4qfz8h1jZeQeTa2YEfPE2O6Bg7JrjwLpohOLh6hnwYJtOD5HaSCaLyQbz2iMU45ET3w
	I4wQTDjSGgqMPRr+IvojNwhcra+qBl8UIi+1i9Q+qEjyWypKcd7cngQORryBtu0b0Jlw5tZFd8n
	H9jsddKsApc0vXQUkeyxAV8NZD/vIT5aJgehAXQAp1LBSsW80Afg5C95LYUSpaEaHVxQKSwsXym
	OJXuUqyKWo9AQqvYmHU20=
X-Received: by 2002:a17:903:1ad0:b0:2aa:e3d1:1438 with SMTP id d9443c01a7336-2ad17431b9amr32756855ad.12.1771093193179;
        Sat, 14 Feb 2026 10:19:53 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:52 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 2/9] thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
Date: Sat, 14 Feb 2026 23:48:59 +0530
Message-ID: <20260214181930.238981-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_enabled() helper instead of calling devm_clk_get() and
then clk_prepare_enable(). It simplifies the error handling and makes
the code more compact.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: None
v6: New patch as per Daniel request.
---
 drivers/thermal/samsung/exynos_tmu.c | 77 ++++++++--------------------
 1 file changed, 20 insertions(+), 57 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 04517d52afbd..aa0726b33c84 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1036,65 +1036,41 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_enabled(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
-		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		return ret;
-	}
-
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS5420_TRIMINFO:
-		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-		if (IS_ERR(data->clk_sec)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					    "Failed to get clk_sec clock\n");
-			goto err_clk;
-		}
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to prepare clk_sec clock\n");
-			goto err_clk_sec;
-		}
-		break;
-	case SOC_ARCH_EXYNOS5433:
-	case SOC_ARCH_EXYNOS7:
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
-		break;
-	default:
-		break;
+		return dev_err_probe(dev, PTR_ERR(data->clk),
+				     "Failed to get clock\n");
+
+	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
+		data->clk_sec = devm_clk_get_enabled(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec))
+			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					     "Failed to get clk_sec clock\n");
+	} else if (data->soc == SOC_ARCH_EXYNOS5433 ||
+		   data->soc == SOC_ARCH_EXYNOS7) {
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk),
+					     "Failed to get sclk\n");
 	}
 
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
 	if (IS_ERR(data->tzd)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
+		return dev_err_probe(dev, PTR_ERR(data->tzd),
+				     "Failed to register sensor\n");
 	}
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1104,30 +1080,17 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 					dev_name(dev), data);
 	if (ret) {
 		dev_err(dev, "Failed to request irq: %d\n", data->irq);
-		goto err_sclk;
+		return ret;
 	}
 
 	exynos_tmu_control(pdev, true);
-	return 0;
 
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk_sec:
-	clk_unprepare(data->clk_sec);
-err_clk:
-	clk_unprepare(data->clk);
 	return ret;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.50.1

