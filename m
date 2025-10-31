Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C2634AB1C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915370; cv=none; b=b23FH/qIod/Be6SYGL+8TvIv1GDUdfMShVz/Swl1MI/bSmeBpsMd/3Az9poqo0FlRLVFaEDmQwpbadb5uzufgxCbjNOaE8IckdhvaALGp2VpjG2B1VtlaLpueKyiP1gipfgP54wYrFcS/0O9lnlLPWe8XqecYD/rAvvfxUTJj0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915370; c=relaxed/simple;
	bh=NNM4SFeVcha76qHLmwleNiSAgrvUgh4usYvH0Mgk4ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5nZQh+i4WhOr4l9WymUehrUWCcSSdH+Ek4AlpdTkCyuRKhQL6r+ICpuI7AdkZCrHJ6ERZntvlDKt+7+5PEayY6WamcbD9AlI8BtGkD344hQn56IfvVNGGqyEgZzSetgq8FybH1DYMJGRDmItDll0I1dk5kPEUw6Ha/OAWCECZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UAlqV+5A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAlqV+5A"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so19341845e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915366; x=1762520166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGzycItuSiWLzePfs0iR8NZ1MGamLLUApmHPBB2Kekk=;
        b=UAlqV+5A8QelkHleHWVW4juzTY7Ouw30BGjTWmtxxHj9m+d3nZQfDTsshaO97RIQ04
         Qa7jsD/w6RE7YBG3OnS3yyIOHigKrVLLvMwC8BOpsXOjdv9iaOD8qwR96M06bFjyniMq
         UEd/zUqT7zGl3vtRpi4PXBS3NriCa8YMQ54whfe2mECl0imQhJQVAZiLNdmD3DyiYox+
         qRcwrhC1gxQHpAZlVKFuQSF4uTNDJVDnsUGqvOiAbMzeBkizYVZeAxRMvlC6VevzDlaq
         T91jxZbifHWVypziqRtN5k+un0gSecdLeCH+iByMgQUKv3c408GLDe4CuCGC6l2k2Pxd
         AlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915366; x=1762520166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGzycItuSiWLzePfs0iR8NZ1MGamLLUApmHPBB2Kekk=;
        b=YZGYTxpT7xm8rmdbExvN+FMX1hm9/94A/yireQQzbJCA+EaW0rNbD3LEJSJrJCK4fB
         m+8MGpglT5zqnikrtdJ/FzE9TFzDCAIm4NTQ0gnA6OwJAEU53HtAUzwkAYqZnSPiNxcZ
         bfwkK2GVQ234kmgR7yrwJ+zR1kC4RYrhpWYmJ/XSuIG1AfCynF1pkSJB2r1xCtwhNndr
         kWTBv93TDdohRB9ypUF0JVwuWPUVBr3VxlLXQWYIUxrdX+PodQSWdDS+t8P+TYQc9P7i
         oMUKCfHIJx48mfGcReCOQ6XWISfipdJzVBJiwQ8dSknmn+hmM/1LGEUE0UFHfITXPCat
         9fqg==
X-Forwarded-Encrypted: i=1; AJvYcCWnBMvUZO/k4+nIf/Z62XsWw3N7VgUGslxuhaibm1q0oJuDMvNT23ABh59lyqMm0+qbzR0uW5YCoaVs63afD0Nnjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6JtKXU7ROLZkTFZz2JX+lAC1b4vBKk3X5EqkQfLDjQ1OIfQEz
	NLaqrec/ps5ZnYJX6ZDjhs4aBw9doQDWevcD6+EoHpTcY6vsREIuNzickMZ2RJnBsgM=
X-Gm-Gg: ASbGnctg40cutpV3TDxKOxTOOLW/h3qh90AuZX/zU85GlkkJfvwdr/P+bta//nysup+
	ZFRxlNc3XfoohE7E7eNHaw1uKaM4l486cTqHgjCvDpYlKXdkNl55kDqSZHW/mSfD9rgVPPkpxax
	ZQCRiXMvo4a4984eKdmTlGaO4ObznJF2n2WP/mupwIlYgranqvJNkPjlexNkmGVHialVdHh23H6
	BIjvC/9Lj0+p3FZeAd3hlvxRFcSxWMYtpXwHRYjjY1yvGPubhR0sAnhPOFdBuU6i0HvOkn8mrAA
	O6p6QwBrmgBLOPc9Rj5/wPKNfFkGejmchxmsqqPTwdNL2MnC9Bae9299PMyCMN+la4nqe6sr2lN
	t1swTgKIZ2bw/l+7G9hPiv7klAupTs3pgOYtcoM7NCohBTkI2+3gEqIQwOH/rqUT9NpOt7p0iZO
	JXrM2A10s4E/lYQLV7wutcycyRm2hblG3Z3VALE3W+VMMR8hhXLkIZcjBDMSfkROg=
X-Google-Smtp-Source: AGHT+IG9pEBdndjx7oyiTadyuA+yWQc7v+Ul4I1Z11B4Hn5fGctLstA/eCvhF1GkcnlxdSMTkGKiJg==
X-Received: by 2002:a05:600c:a010:b0:45f:29eb:2148 with SMTP id 5b1f17b1804b1-477300b9e59mr30491685e9.7.1761915366461;
        Fri, 31 Oct 2025 05:56:06 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:03 +0000
Subject: [PATCH 04/11] soc: samsung: exynos-chipid: refer to match->data as
 data
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-4-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=2584;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=NNM4SFeVcha76qHLmwleNiSAgrvUgh4usYvH0Mgk4ZM=;
 b=GCMSHfKvpeO2dk9a3N5A3IjogAlj5fNR7z1yJcvLIgqPVwAp/5fsSRsiw6fB0LbtnrI11VbfR
 36PzrnjCSa2BSjpyMjkbPp4HUWtCbdwtVJwpUfjVuKxhc50A4jO8YWI
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Be consistent across the driver and refer to match->data as data.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index f5107b8b339e8884d6a67a80650a95441510c66c..ab6bdf24a754a0faf974190c1fa1f99735cbef8e 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -106,7 +106,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
-	const struct exynos_chipid_variant *drv_data;
+	const struct exynos_chipid_variant *data;
 	struct exynos_chipid_info *exynos_chipid;
 	struct soc_device_attribute *soc_dev_attr;
 	struct device *dev = &pdev->dev;
@@ -115,8 +115,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
-	drv_data = of_device_get_match_data(dev);
-	if (!drv_data)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return -EINVAL;
 
 	exynos_chipid = devm_kzalloc(dev, sizeof(*exynos_chipid), GFP_KERNEL);
@@ -127,7 +127,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ret = exynos_chipid_get_chipid_info(regmap, drv_data, exynos_chipid);
+	ret = exynos_chipid_get_chipid_info(regmap, data, exynos_chipid);
 	if (ret < 0)
 		return ret;
 
@@ -181,13 +181,13 @@ static void exynos_chipid_remove(struct platform_device *pdev)
 	soc_device_unregister(soc_dev);
 }
 
-static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
+static const struct exynos_chipid_variant exynos4210_chipid_data = {
 	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
 };
 
-static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
+static const struct exynos_chipid_variant exynos850_chipid_data = {
 	.rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,
@@ -196,10 +196,10 @@ static const struct exynos_chipid_variant exynos850_chipid_drv_data = {
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{
 		.compatible	= "samsung,exynos4210-chipid",
-		.data		= &exynos4210_chipid_drv_data,
+		.data		= &exynos4210_chipid_data,
 	}, {
 		.compatible	= "samsung,exynos850-chipid",
-		.data		= &exynos850_chipid_drv_data,
+		.data		= &exynos850_chipid_data,
 	},
 	{ }
 };

-- 
2.51.1.930.gacf6e81ea2-goog

