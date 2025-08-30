Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04546274B53
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549152; cv=none; b=lKccpwEJ/Kpvj92qglzlzhAcqA3Bfp07l+uqR653cQrknyAC2CHcEUdxT7t8PPQsuuU3MCtd1/U9Kh1Nf8j8XVmVIgYraF/TRo830rWNb/mn/jWSzhxSNQO2lzKfPQsAkjY/tPwlB4oLFwOKN5ftXtzdOkcqDW1bqof7EMoATBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549152; c=relaxed/simple;
	bh=tzOQaWmU4Y2kJdGcyusF9g24SdvfScKvIrSTOFMPkHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDHNNwHdJLpNHbrGjttFE508+7CRFRLW/y+zIBk3434s589cBvaBHZK/egY2an0WWe8kWk2JoQdGWQoJgjb0ZqYwg0KKX7Nz5u1/fm6FTAKmWab+RBiDqUyYaV/ZacRUoZMoGSfB/UTf+IRsoy4g+qLGyeklbZ7rUBDgxGkC6HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uzxp6n4N; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uzxp6n4N"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3cd151c38ceso419993f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549148; x=1757153948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZnyvhWBfuOE2HRHqZcb3d7aQZKVvQuhqPXuSlkPMk0=;
        b=Uzxp6n4NFwlvx43R8pXzHOxIIURYB/4IbfyaaPq4tdRKUqjSXzp2b0zZ/+DzUBkcvq
         Iy0HAE5ysIDJfUFwy/nfwEOEFXXz8dP0lW3JgyP7mv7Ed4Op9oFTWQ0AKjlRhWNNpQkH
         S1+YNN1SpCBGKiCNZxuIn7bK4W6GuSZQrh/xWQw+AvMQZf291YVtc2tbJo01mI7Zoz4+
         J+lpK6uHfcKYYVbHDjf7v8/3orplItMfB/nt/J8X/4RNC+W1er+9RbNPW6kMZ9bVNW/I
         F0KlTuF4LT37JG9cHhEZJqjYePdvQvr4MlFQnu2o0hWYsjMjzUebn0W7Dy15iMYvPctc
         M1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549148; x=1757153948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZnyvhWBfuOE2HRHqZcb3d7aQZKVvQuhqPXuSlkPMk0=;
        b=aEIk2Jube4I6ceUYrHb8Vofoyh8qLxM9UpFxfjE9h/Z80HCny0KiGKI1v9XefMqfQw
         v+NYT+3efP0tmym3Pnwc5Io/VMaBdspk08BuYzgfxxLQ7fFbYboF5Lz6VA5xId4GK2bb
         SR4oETxZ5eggjxaB3eJE9aPnxnMp5OJEzs0+6eM8OyVAtGNLTmLYyVU6fsF0AWe4Njvi
         srfJkprKfZzHRne72+FTWJyDpXuW0a+tWPbu2HqdlXapMp0E82E9q04c+09PNlN/2QIU
         7EyzZL9//P1bi0zsdDtVEzNXuhrx4gNW4I+oMblO+XoerJpbA1xq/B9iRGE0Y/P+k5pU
         ehFw==
X-Forwarded-Encrypted: i=1; AJvYcCUapNzMIEe62TiHt7JmDwVr4z9uhGO6LagsunvlIuTYerAmCEoXCFuMoZiicZDnLeWI7Tna1eLpIAQXedNe9t3NNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaSCzOo6kStZYM9jRiw1S7BFZZgJaFcm+schhBzvnIQB5lfsvf
	uEdVepyIgx48aymdmbTtGzU8W54Lz8ny4rdPS05aHhknxU+RLemZHAsiOGeBzxsSmwI=
X-Gm-Gg: ASbGncsOTfmy+MrZYyglHhslL7WOHMwKK5nWHvFGvzJWcRxxikctWxmsbzzWmPrWYLr
	TCzdCHbj7uUawmLLHlih1YwMRZ1BIr7NIYF5x7EN1v/K4u2wVilz24rH3onSBmd9V8QmDS0jwiY
	b+92oQYlbTy8MOT6WmZTi8inGDZWBixAp4hPvVCjm0adVZLUgSvModUgL6OkSwJgyNkvcWgscTl
	X5szzIBUnHyPoyBYBcN7GxPBd3wCwfbX1sqhoelMQi9zIog5KIBH26m7slMjpbH8e3GsqXNIQfF
	gOmRSjP7BU8rcvRtrkcYE6GbHRhznVM/enAegKPwuDXND5FWyFMlVldGCmZrZrzhZ5hqR6Wrlxh
	sGnrEA//nM8hRxr+4DY0O8uSsQ/9oT4j4/u5WGclkBWZyVGN9SgP9+B74n3yo
X-Google-Smtp-Source: AGHT+IFygDyjBigp6iZ69YDdQmrabcSS3QXu7NjqRTS+fEAREpf4yRLclbJcT/wkaR/57d/WiRMZ7A==
X-Received: by 2002:a05:6000:26c9:b0:3cf:6a9:f3dc with SMTP id ffacd0b85a97d-3d0fc3b630fmr1581151f8f.10.1756549148299;
        Sat, 30 Aug 2025 03:19:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:18:58 +0200
Subject: [PATCH 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-2-837ae94a21b5@linaro.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tzOQaWmU4Y2kJdGcyusF9g24SdvfScKvIrSTOFMPkHE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostAUEYwVAJtWM+2isVc7f3o+wMUKCm0EagDjU
 aZ+JOri5seJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQFAAKCRDBN2bmhouD
 19uCD/9CaCFnhAJlqwZJknBdZ3Sgef20JhK7F0OVjmhy2NesYaYZyETjCt/5O33RFCN9lVnK8+l
 r8tud3DpSBL5Xyq4zqA1Fcuy5iKSpMuWigJ7LqDzquDawxoXtDcZ31/th4ZAg2Kpr0ONMCONsPx
 D8FjGLFmNJEGV0VDDcBKe3Dpv9fmAdvw89yHLwOpoEXPMboThA+eIUeOcH3lViARsaaI5taVPhU
 vDvo7xQOBXdSuzFNKsKrSis4pSoSa6/BTHoVAQX/UeVPK7uR+UnUow5LhLBCgck0ylZCU0Ey2e/
 +xFb7ptteGXzDJs36WyeCzmvqUgsEIDI6IEGdVOwE7PvZLc5Ho+PSsQ/Ij+28dDvZqv8+4yMf2M
 vFA7r+QD520/OAFmEePSx8QzVbFMkXse1EF73AnRYW7SEqS3I+gCYTIPRjflEmMqATuRoQR1NED
 m+72P3imsoEOus4/JdSRV+rXVuEYSK/sK1aUjdrTnT7+y3/CUSMDml1xuaxxHWttgkbHoCuJs10
 Mjm749ZzlD7bOY1J7GWBDI3IYaBquJX85jLKnxz8GpNZ/fXQKO7gLa2bP9eK9h9p5Eo2v7SXKXc
 QVgbwskQ2yQN7pnh+5oeGSaYhU395mJhe6AiPZ7NvNesoE+8d9N7tPq972tjXOlc3G8twG0IkSH
 m2aSXlbDucyrD0w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
and s3c2410-wdt platform device name, so drop both.  This leaves the
driver boundable only via compatibles, so drop any CONFIG_OF ifdefs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 40901bdac42613458f93c09654353190785ff072..f65f25fcce3ecbb1739ff98245b69601dc5353d8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -200,11 +200,6 @@ struct s3c2410_wdt {
 	struct regmap *pmureg;
 };
 
-static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
-	.quirks = 0
-};
-
-#ifdef CONFIG_OF
 static const struct s3c2410_wdt_variant drv_data_s3c6410 = {
 	.quirks = QUIRK_HAS_WTCLRINT_REG,
 };
@@ -368,8 +363,6 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
-	{ .compatible = "samsung,s3c2410-wdt",
-	  .data = &drv_data_s3c2410 },
 	{ .compatible = "samsung,s3c6410-wdt",
 	  .data = &drv_data_s3c6410 },
 	{ .compatible = "samsung,exynos5250-wdt",
@@ -389,16 +382,6 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
-#endif
-
-static const struct platform_device_id s3c2410_wdt_ids[] = {
-	{
-		.name = "s3c2410-wdt",
-		.driver_data = (unsigned long)&drv_data_s3c2410,
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
 
 /* functions */
 
@@ -705,7 +688,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			   platform_get_device_id(pdev)->driver_data;
 	}
 
-#ifdef CONFIG_OF
 	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
@@ -741,7 +723,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
 		}
 	}
-#endif
 
 	wdt->drv_data = variant;
 	return 0;
@@ -929,11 +910,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(s3c2410wdt_pm_ops,
 static struct platform_driver s3c2410wdt_driver = {
 	.probe		= s3c2410wdt_probe,
 	.shutdown	= s3c2410wdt_shutdown,
-	.id_table	= s3c2410_wdt_ids,
 	.driver		= {
 		.name	= "s3c2410-wdt",
 		.pm	= pm_sleep_ptr(&s3c2410wdt_pm_ops),
-		.of_match_table	= of_match_ptr(s3c2410_wdt_match),
+		.of_match_table	= s3c2410_wdt_match,
 	},
 };
 

-- 
2.48.1

