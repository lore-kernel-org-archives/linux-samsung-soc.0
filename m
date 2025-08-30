Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F9258EDE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756573281; cv=none; b=VtJ4IhUQm5vrHfxI1SfTVWkVUQhunxHKgmbe7v1dlj+XSdh1bedudnnCRPQ6L/M4YmYGZctGNmI9hFxvVqr7YcS9/MeGVzTp8Mu+s/LyPkzW5HI3cTumodJfyWc52AlnN2de4N74/eUq4YfVCehYpkc0+KxPU1sM4/eS32KtNdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756573281; c=relaxed/simple;
	bh=RPUJbg100xa0IEvnoF3u1mdVLmvj7pTfHeSRkyLDqeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TobslbzzBAsYCdr2G+1ASiHtyC5J8ffkgn3udHgagfM2IqQmNVtjAuYLm5x//5o+qkt85h3IeUzxXyCG6E3C3ly9G7w2dNsvqBpDgIAjaKWj/ADIkfVDBGv7o6RAmZBr3bWn1T7Vbiim2s/n2fFm2ZfUQvYIcGIEvaFVsRQ+LLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qkw891aE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qkw891aE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso41499866b.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573278; x=1757178078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdB5MqNC+p3bmf/ntWx5h3e+QQrokyQ+em8wO8bj1sc=;
        b=Qkw891aEUEZdoBQiqvMPCPc7lWTnfMqpIFI1KYxLzvRDWLJwVJ7sPHL+86IPyNk4lK
         iSxhk6SRsUe5HEtZ3dW3dmGp2B6Q0ouKJtdKtqvhn2zvgc/t+49M5i2l+pM2BtIvaoew
         RInTEqvYd11YgeHf3dgEb4huPTqSFMudmceaNutoEVcv7FFK1MMpsHMxEn0+sPAbctWk
         ppovUgoXnZVvjcoDdsQxEl6vFbI0p7984QowvvLdIL53uRxtrzA8xyLLl77ZUuNrT0H1
         hRMCexZOjkn4PY/a5tArVtkRwVsu2SDmCcJQVx2aWVUd5jLWqa8ItwGTtKjmjTdTES2c
         N6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573278; x=1757178078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdB5MqNC+p3bmf/ntWx5h3e+QQrokyQ+em8wO8bj1sc=;
        b=TSH6MmQOawwp9hEeCnhhuS6zX9nhZ1cQdhELiHRZw6A1SqBWpxpoK+w/0gY+0hz6cZ
         BrQeMf5J5ichdQngsp+9DeSqoG59/9h0MLs+z8XOnq9j7mcVu0KXz4zhRPd1Jtj1MgcR
         H3BdOmc6ur4zItjNk9tkCt+LttZcKar21mweBewOp/naCHZ1ZuDr20wUrKMQnifu6IDR
         v9g5e+nmjs0v0dXb+vjdjiAJAA+Btbp7WgW0zEB0uJU/KsLrP8rXMZAER0VFOO96/bhY
         flG61gJgj5aB7TN0HwlT6Wol/SjPllASg7j/ylwRlr9ReQbah8+t2Q3Q6pMtAPl0nhQt
         +9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEyvWcH9SZBsR5lVrn5ZjeZF8TO738SGUPkZW26HaI8aUfNQwoUGwebZ9pjjMof5jsjytk/bUhogp8rrH7Bf3MZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxAK0hUWY0BrvrvJBHwDdyrRHwoG4Zla4LLS6xYLNR30aJKmHo
	nkcleehZLTULsBI9i+yDpx3NB+s5ylVKO44q5vl+wJ65qZeQvODYHc8E5DWQ9MyDXHY=
X-Gm-Gg: ASbGncuZzU9xJOjYFTNdIpPlJJZODMQnb2JYskIf4ww1bVkHiehAOtABrhJSqoOYuia
	zMu+kU/mCQQd2nweLfsMATlIOBM7RbolW1bpU1E5zh5RgYS2DNCylQrnJ/0d48Tc/pJMAnFBKp4
	oOuGowNOvZj9lwxAlKodLGKD/iKOp3ZhJJVAX/0y2i1L24vRpYOU/3u3Y12OEsZ5zeaRUGQ3FKn
	qIJ8crKMGdFhmpvZ6YsDxVNA8amKU1W5AkT0NjwHxevd9rQvpxYH/wJHJOWeIU/CSX7AcBGQMMz
	HssRFDDWzBCG0/6HcWxxrHgPU6RbkanyK74lS+BQYhvn/lKOJr3yw7e3mg4mELnsAqsVQRgp9fD
	D7jYNgodtQqBTdfGOfRz5mtlkoQW7xePnCJiz1Lb17by1407kEg==
X-Google-Smtp-Source: AGHT+IHe++mZhWzLj+V2kR1/YfRvNVOIAhKLNUILUb6vPmc6HP8S/l0mFC1K58GUtxiQDbdzEfLucA==
X-Received: by 2002:a17:906:9f85:b0:afe:ae6c:4141 with SMTP id a640c23a62f3a-aff0ee05414mr274464566b.2.1756573277761;
        Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:09 +0200
Subject: [PATCH 1/4] mtd: rawnand: s3c2410: Drop S3C2410 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-nand-v1-1-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RPUJbg100xa0IEvnoF3u1mdVLmvj7pTfHeSRkyLDqeE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5XzOuvSuRgZYrPBWhcA/8cx0Ta1ZMMtq3VA
 U97dWTDNgGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuVwAKCRDBN2bmhouD
 15CkD/9SA+hmrUU/1U3lo3ofl7xEfszMtOVsHre48VzovCwtJVbvY66wq2HilKGrcKVaCJzaThw
 /0pxt9R8+UI8qBpXmErjOiZoOSArSvZwnPrY2IQiynNufwCqsoBkvKOEuIaOtPTOJnsxkJKCk4H
 x9fLs6FX74gWPS9K38wmcebzL+rWDEy+oVtVB+L78jnjI64mH4xo2bv8HKnBQa9ZfCL1LdLNMbR
 d8VElMJoGEsZkOOZxR/stuuVdZD3dXombq/YjrCw2nRpJtyLap6CcTg5TmpVKGL35wdcmXI/OZI
 MjekuYui0ID1Ft43KT0xlyAQUK/IoESXLBVRuIUChjCFuyEuP7RY1u50r+ETJDQb7y8xTWHBE/D
 ZKRpBXP5BP8IiclImSst1JMUfKoM8+gzYSgQd/mOxY+iiUHv9Gb5j/hzNrkI4XBakbHWlHXd+C+
 ndvykMkA5Ymrasd+5bVN6fSUaY0gMUeu8vf+X1Zo4XP4fdMl6MlC6XXSAMvmwO39AxEt8zKVgZm
 dDoFqaKhVT0CHbg2mQfgG8Wr9wGRZ3Rwo5r+mqebEQ0E7kQ3Y9i4h3c18MrGoGn2HVRYpD/mYee
 C1izWKtMDfyU0Yhn1qP+CovK8XgHtSzrkczRxDC/VAivNBM4SJcrnRlUJt0qeZTRqoRew7wjkQu
 3z+KzqjjHeF0x4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of its compatibles and platform IDs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mtd/nand/raw/s3c2410.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 229f2e87d56eeacf5fda0ad29df59655b328658e..33130d75c5bab709a3e5cfd6e95b273cf62e4d46 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -169,18 +169,6 @@ struct s3c24XX_nand_devtype_data {
 	enum s3c_cpu_type type;
 };
 
-static const struct s3c24XX_nand_devtype_data s3c2410_nand_devtype_data = {
-	.type = TYPE_S3C2410,
-};
-
-static const struct s3c24XX_nand_devtype_data s3c2412_nand_devtype_data = {
-	.type = TYPE_S3C2412,
-};
-
-static const struct s3c24XX_nand_devtype_data s3c2440_nand_devtype_data = {
-	.type = TYPE_S3C2440,
-};
-
 /* conversion functions */
 
 static struct s3c2410_nand_mtd *s3c2410_nand_mtd_toours(struct mtd_info *mtd)
@@ -944,22 +932,6 @@ static const struct nand_controller_ops s3c24xx_nand_controller_ops = {
 	.setup_interface = s3c2410_nand_setup_interface,
 };
 
-static const struct of_device_id s3c24xx_nand_dt_ids[] = {
-	{
-		.compatible = "samsung,s3c2410-nand",
-		.data = &s3c2410_nand_devtype_data,
-	}, {
-		/* also compatible with s3c6400 */
-		.compatible = "samsung,s3c2412-nand",
-		.data = &s3c2412_nand_devtype_data,
-	}, {
-		.compatible = "samsung,s3c2440-nand",
-		.data = &s3c2440_nand_devtype_data,
-	},
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, s3c24xx_nand_dt_ids);
-
 static int s3c24xx_nand_probe_dt(struct platform_device *pdev)
 {
 	const struct s3c24XX_nand_devtype_data *devtype_data;
@@ -1194,15 +1166,6 @@ static int s3c24xx_nand_resume(struct platform_device *dev)
 
 static const struct platform_device_id s3c24xx_driver_ids[] = {
 	{
-		.name		= "s3c2410-nand",
-		.driver_data	= TYPE_S3C2410,
-	}, {
-		.name		= "s3c2440-nand",
-		.driver_data	= TYPE_S3C2440,
-	}, {
-		.name		= "s3c2412-nand",
-		.driver_data	= TYPE_S3C2412,
-	}, {
 		.name		= "s3c6400-nand",
 		.driver_data	= TYPE_S3C2412, /* compatible with 2412 */
 	},
@@ -1219,7 +1182,6 @@ static struct platform_driver s3c24xx_nand_driver = {
 	.id_table	= s3c24xx_driver_ids,
 	.driver		= {
 		.name	= "s3c24xx-nand",
-		.of_match_table = s3c24xx_nand_dt_ids,
 	},
 };
 

-- 
2.48.1

