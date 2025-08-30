Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB227B35B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756552196; cv=none; b=a3uqBRcIABkT/QutTB2Pq3PnzFyF1x+QV8DaOD/pOeAp3ek9qJvbB9YIur3D/3+FJ4s3j7PaE9PRYAav29jebn+MdUr3S0dfGH3qqdrXprY6dt8legeKupYRP0KyP2d4L88PfKQcutArhAIPl7RE3nnJS+mvm2Aa28ngDRlFYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756552196; c=relaxed/simple;
	bh=KjoP2OpIwgvcEU8lQlbyugpaZUrY36rc56GQiCq2XW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amZsoBH8uRZGZGvQ+OMe2rnTOXR9ZURoabexTJ5Di7YFkmZzWkZfKz0wTBVL2K/eNu+kXnueyPnpexejc60bbKr1tO5paIaZfLEyROawVPf+5jHv+4mKJlP4bN5aT6g4ARVVmkpXw8a8X76j4++7SVNKfrw0Ki6yL5KinlkDk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFi8f7TC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFi8f7TC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afe7584b6c1so38211566b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552192; x=1757156992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbqsXZ0a+2gRMmLHMi/t44FvhwPty9xFovSO5BTpK8k=;
        b=IFi8f7TCxN+nVFQuDVoK8TIJzUUDh12mv1OLrds3nptTbnaoVcikWPjB9L/um1NBPH
         HMWS5F24ez7u0k1mWUAHSSusIBq+Xlf29b0sIQ0WpPUyd7Iuzscj4UMwR6jqzGu13idI
         8HQxqbQ82Omv9rLXfQh7tgwosc8abC1xLdPUTBnh/fMh00zUg+/VfWXPq9GwuQlLxLJo
         4OCJab1EFItjJhXBaw4aNdO31ppnBCxreUKYIDVAtvprErnk8DqSBzIzsiJiPGtxKlLv
         ugDayC4pjjjegsrZf5/U4d9uQ+dLqYF+zxKUyncSfAq+zcWNek10CQHxxMxNJcXrWTT7
         StZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552192; x=1757156992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbqsXZ0a+2gRMmLHMi/t44FvhwPty9xFovSO5BTpK8k=;
        b=YUTh0dm3g65wM0Kc1LfgZ7p4Q36eR4J5YUn/ekGFHXgB52fsAkBEGA959iVtjeIZ8C
         QwhfSUMk5oigYDe5g0oEza37bFp5ljh3ytuRXRi2OUBjYgQIeHYwqpEP60DsiKbS9iBT
         rUzKQfJ1JwzEKF5pd+hcaB0+6sMGdW859usrsXEh9FRSA38Q27t7KBMWWe5FGHP9BbAf
         wLDP0qHVwJg2gZ25W+p56n3p6gN2cqfzeFE7oea9N7oqjAYdAoHAcpjBnHbehZDMeuMF
         tTf4neLc9IdYu/sPwusdrtCLuQMx96R7pIqs/AEk7qpqtkJtI8b6bY8JtspyjUSCVaek
         K9aA==
X-Forwarded-Encrypted: i=1; AJvYcCWmzmjbl99CED7bwg+6ykekIjk57SFmDmLzFI/COE19U8y6mFQ2X9ouoMiSccjjqOcHjPY2pGImvxca2rfibBuhug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw67K5P3JE3InKqnPU4Uuejilan/bnWrum7LswWJXdcWYhCfgTF
	GUlxwoqxixpUwgZ0UTQGw9o3WuVHHcbzXB1RZhWtpfUHdgIU0alQ9zun/aeWW9SWlkw=
X-Gm-Gg: ASbGncu1AdP0Cplsko1cn9XXS3eOc3O0g5xRFr+erzwKGHapzsuY4+1nZVJDVDaSovl
	ei7FuHSLFmjeYGcZXlhBV8enNGXaI8V//A4VKfJzPZvQHtyPX+3sDW2SF0/TQUiF7P7yrMLAEEa
	zn4Wozkt0ggrIoZrSgpYxLsqFAh3LXUAvstNBcCMmYEeUQTpDdjAgPuvHgkycs+Su83yU3ZFp8X
	y+Nl736TeQcwImOjKRT9qjga8mFqXAHmTA9AnfhxbxeHeLADc55Bo/IZhlhthCJ8RHJF2BqDL9G
	i3jlUgUUdfDWgFIDAkOJgH1ApsHtV8fsn3z/pSjOJ3AAMkWA3Nqm1C5OqV/uvRTzcNDNwjPkD7D
	7rQN1Wrn1FPhx9j8JVQluW7cLV+GpE8fkRQybnrQ=
X-Google-Smtp-Source: AGHT+IHYI3tcuSfMfYLyvgkgErLnZ1GzeCpm9S3JwFpVHykTzgSrhsFx7MfV7tYp5tXNWutnC3a91w==
X-Received: by 2002:a05:6402:354c:b0:61c:d7e5:47a3 with SMTP id 4fb4d7f45d1cf-61d0d365421mr1981474a12.3.1756552192554;
        Sat, 30 Aug 2025 04:09:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 13:09:40 +0200
Subject: [PATCH 3/5] iio: adc: exynos_adc: Drop platform data support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v1-3-de54dfb1d9ea@linaro.org>
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KjoP2OpIwgvcEU8lQlbyugpaZUrY36rc56GQiCq2XW0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostv13VGu7FUVwm7lV7kKSuqLAH95o21fWUsyk
 kZGd4D32xyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb9QAKCRDBN2bmhouD
 1xCpD/9RsBrZtrfnGAO6kOBtpZf3RsuYS4WozEoGAPOZ/+LUFG7GyY6PHdLh04yO0tyeru9lmnl
 NWiyylXT161JodBZBtmPzVGF03rHBTAOUplPZd5paYxfpJwt8PJb/xHmt+0xSbnapKtKq200hOX
 EUPwCpJQ9D8g6nPMbYUQ6Ens7xPCUMXbhA29e7wK9UBBL0oTOeUZRaBbz4p0phSh1Jm1shYTVXp
 QngUaBT09dvDLQfrg9tGI+JBpDndf89JRLDDK3yQ/Vj813uwCaXSU3NmD0OKS/vtuUyzo/J0OIt
 8vVneJFmFtj4xhz1JdbVUnA8vMsGRMZLf/f0M9GRJHxy7pHzmzW6OUolCzk+CHo3KCQgbOY1coA
 6v46Kib9uoMtvr7Y+3aQb0c+2zWCV24+9ia905h/shhAk8pEhuZun2FPDPiUxSr490p1irdBmt0
 6OCDoUzRL5lkSOt6avOdIL9235r4vBEvl2HvUzT9elT+Z6862INH90abu3DWL6oAm+rk4O2k401
 /PuIEEZckhNUQTxHX/j6Hsvdc+1QQgbLp5dQXn/VfZp8fCYyNy6NE+jvz2674Gdvk0LFg9KbCrn
 v26uvKiam2qS5ejw+6+GF74I/T7rOXWawPDPYNvrAjuXZOsC2O1WHTbgNsWyDAC4U4RJ3YDi9gQ
 EEPu7EfKv7b8Umg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

There are no Samsung Exynos SoC ADC driver users which bind via platform
ID, thus platform data is never set and can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 30f6d8436e775a8d2177951b436cd45152307ea2..dd1494ee365a7b34d6b485ee4c9e753f50b5ff26 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -106,7 +106,6 @@ struct exynos_adc {
 	struct clk		*clk;
 	struct clk		*sclk;
 	unsigned int		irq;
-	unsigned int		delay;
 	struct regulator	*vdd;
 
 	struct completion	completion;
@@ -213,7 +212,7 @@ static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 	writel(con1, ADC_V1_CON(info->regs));
 
 	/* set touchscreen delay */
-	writel(info->delay, ADC_V1_DLY(info->regs));
+	writel(10000, ADC_V1_DLY(info->regs));
 }
 
 static void exynos_adc_v1_exit_hw(struct exynos_adc *info)
@@ -556,7 +555,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
 	struct device_node *np = pdev->dev.of_node;
-	struct s3c2410_ts_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = NULL;
 	int ret;
 	int irq;
@@ -657,11 +655,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	if (info->data->init_hw)
 		info->data->init_hw(info);
 
-	if (pdata)
-		info->delay = pdata->delay;
-	else
-		info->delay = 10000;
-
 	ret = of_platform_populate(np, exynos_adc_match, NULL, &indio_dev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed adding child nodes\n");

-- 
2.48.1

