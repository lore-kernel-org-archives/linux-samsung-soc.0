Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5983935E530
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474187; cv=none; b=oAppcyGUuaR6cgPFmHCz/axyuN5ThTwadPvKm0c+sQSx918wdzZ7mC6jwQv8yC4PSofHsQW/P7F1fSt2L9hC85aUVXXUIH64o9XKa165YawH1rfOwajbhHc9VMdLRuObIkOHsTWY5WnQeYvjDWTOLvqwnrUQa9n0HWJnXuNVR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474187; c=relaxed/simple;
	bh=gyjJc742Xp7x3M1wMCcAQq2+Hzs2mbWAJ0525DJRzCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwjBM1DSKigkqgHBFY2QzGJ4RpjRi6JruEVOvMIX53dpE2NtKezIldW934O0T3sSa5ZO04DanwppzUmigotvwPjvELbQuRlJIYrWlfqld19LHwmJCZEn3B71c5xxD/jw6XUfzVi9pk8KRD88pVNZYzVVonRsZlNcc5e2X6KEB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YetKHdA6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YetKHdA6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso3537963f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474181; x=1764078981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKYlMIfAWjT0Z4v8dS+9AJxviT6d1hSBxbFdrwjdNQA=;
        b=YetKHdA6GH0FOfwx9gjwTTdvxpDpycsbuDIqzcNHt6H8q+azTd1y9RDDcYHVjgXTg5
         4Ql1hz1z5Mez8WQA4XWHkQGqwE2rgkZX7bSpHNbsVkG1B1/6bzyGhu+KxizNZujzZ2cU
         Se511FBVsHA6nsEtSahMaids1ISA/9Ky4eXK/b1YP/dQORKkXg26irOVvnfWds3KQglV
         7ySkimkP4GZMhHVpOYKuxuxjSv9sw0CXl409Z7yS85PJoTiLLP+JLVybJP4lSabWeuY1
         K+Lvsp3enDeVl7k6u0QAdWSjoeT0U18DtDBmLMgptSMnmcDQDUM9Uth5k+MPLGWLDrMV
         bBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474181; x=1764078981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yKYlMIfAWjT0Z4v8dS+9AJxviT6d1hSBxbFdrwjdNQA=;
        b=n+w6R1FtAjWqa9hLhqeFO4f0b9OJsu1LMf91ZJvVXS7uB4jTuXc3+CmzOhl2QqELtz
         D3jRECBX69AoxYvoN3Rtdc/1gCvBGB80VlBblD6VcaaaUvnV4YpexcDgcSaA3BtFjC+U
         ov8sSIvkoP6nKwRrBx4IZ4pnZTuXveSQEDY9R1B3Bam616ECak1haR/upqk7kywYTHek
         gLbm1+aPeMcvXAP6awD1toZmZBwhj87HJegHUtQTDyxzKT/C6LX4rNaxKinZ4isuVKFx
         5OY2EdHzjBd/teL5J7MsdReWf8SCiOrJODLdgVF99RxzQyWMFfPELMF8jW2W9iRyg0RU
         sbVg==
X-Forwarded-Encrypted: i=1; AJvYcCVfsvCdxv8qocGCDSeWsb/fgIXzZTAMzqnruenIykQFNW9waVEw9PZ9IjMKbNQ2jZtHWo0rE9KS/4HpFHH/B8nLdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrf6mfBR0C9pEwLjiv/MRQPORi5Vf8dGW2JTReSyrzZAJDs3sq
	xXvn0ZkunzTVxzfi5bcM81SPXpT9GVHjW9l7QIbY6BkQF7TQP+qxVWToYVabRC/uILg=
X-Gm-Gg: ASbGncuV5X7tuXMyA3cebMc3iXAooUjsCgSd2btioUSjmvq87NjfDoMn5TGWK2WqZCl
	mQQr2QMWNz5mkg04yvmCkKHonbe0cH7yYTeKCybMwzdZgMC6BDBAZwMvICNA5jDnf3mhzQpj36O
	C+Y/uEEC5GwtalChfeGD5ULYYB1brgwOcj26FVzUU8X3XIdIFZbL+jB3+8y0tIe2eTcr7J5lBwb
	O10LasL18JSZokqKi6I8Bg7/bQnCyZ+LehPjKxrR9Z98PWksd8+oKLy/X6cOoNZ6i96Jq2XBukF
	0gXZkumwCVSshDvVWtpyCSYJ8Mqmy9juAxeirFsvyGRJEnHdttg6iWIIiW87PdOEPEGsn5i6vUq
	rYbb/4TGahoQPd3ikCou8SbUhSWV61aZsfh/jQUVux0KUuWL6lbjbkGXJ45pDIZ8oNLVFZIpgYA
	kalgFXiRHKDD6H7QvSVpPgBUvXO/h4YOxo1S0DTpS1bNH3JLsCvTa519lFmPpSs3bWOqGFxxOx8
	DgSZw==
X-Google-Smtp-Source: AGHT+IFLEPtny/4M/qrsELeJqriFmtfSC8sisj+iye0XhMUpxvpy0r10rHp5Vjj+6+CEqyh5vAEHSA==
X-Received: by 2002:a05:6000:186e:b0:429:cbba:b246 with SMTP id ffacd0b85a97d-42b592dccc4mr15022527f8f.0.1763474180971;
        Tue, 18 Nov 2025 05:56:20 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:20 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:11 +0000
Subject: [PATCH v2 4/7] soc: samsung: exynos-chipid: use dev_err_probe
 where appropiate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-4-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=3298;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gyjJc742Xp7x3M1wMCcAQq2+Hzs2mbWAJ0525DJRzCk=;
 b=Dkbia94LbiSf/CBO+A1kJVBcYCRosgXFGkXFNUhm+Xo18ZKD9i0afT0aoz5prjd2k8c8oWq+O
 tEsgaKaT06PDq+XRCKwTR2CS+JpUmPQ00PQ9Th9PlQNtlhuRbjlUreJ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Use dev_err_probe() to benefit of the standardized format of the error
code (e.g. "ENODEV" instead of -19), to get meanigful error messages, and
for more compact error paths.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index db73dfad4e1b4fb001cb653bc8caf8aa08d85f2d..e7dbe1bc45d6af58527125f512c0ff22c03a9629 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -87,8 +87,8 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-static int exynos_chipid_get_chipid_info(struct regmap *regmap,
-		const struct exynos_chipid_variant *data,
+static int exynos_chipid_get_chipid_info(struct device *dev,
+		struct regmap *regmap, const struct exynos_chipid_variant *data,
 		struct exynos_chipid_info *soc_info)
 {
 	int ret;
@@ -96,7 +96,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to read Product ID\n");
 	soc_info->product_id = val & EXYNOS_MASK;
 
 	if (data->sub_rev_reg == EXYNOS_CHIPID_REG_PRO_ID) {
@@ -108,7 +108,8 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 		ret = regmap_read(regmap, data->sub_rev_reg, &val2);
 		if (ret < 0)
-			return ret;
+			return dev_err_probe(dev, ret,
+					     "failed to read sub revision\n");
 
 		if (data->main_rev_reg == EXYNOS_CHIPID_REG_PRO_ID)
 			/* gs101 case */
@@ -163,7 +164,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	drv_data = of_device_get_match_data(dev);
 	if (!drv_data)
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to get match data\n");
 
 	if (drv_data->efuse) {
 		struct clk *clk;
@@ -180,10 +182,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	} else {
 		regmap = device_node_to_regmap(dev->of_node);
 		if (IS_ERR(regmap))
-			return PTR_ERR(regmap);
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "failed to get regmap\n");
 	}
 
-	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
+	ret = exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_info);
 	if (ret < 0)
 		return ret;
 
@@ -202,15 +205,14 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
 	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
-	if (!soc_dev_attr->soc_id) {
-		pr_err("Unknown SoC\n");
-		return -ENODEV;
-	}
+	if (!soc_dev_attr->soc_id)
+		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 
 	/* please note that the actual registration will be deferred */
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev))
-		return PTR_ERR(soc_dev);
+		return dev_err_probe(dev, PTR_ERR(soc_dev),
+				     "failed to register to the soc interface\n");
 
 	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
 				       soc_dev);

-- 
2.52.0.rc1.455.g30608eb744-goog

