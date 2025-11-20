Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999ED313540
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638183; cv=none; b=bjV7HJI5qW6cNqiAd+otQ5TO2Cun6DQUibbO9fQq5baraUn0maFWH6ZZmYmSv5+pE5drmWQzUdYbhRPon+JY2i6hM1GgCoyIPzAluWbWFgVvVFU1w8GmmsT/GjXTDFkFwIveYEnAHLswjwx1OreyXHxr9xGom9XdFRg0n3bZwv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638183; c=relaxed/simple;
	bh=ydziPpmvPsHAqypZZhan8Qbcj761T47in3GhwmLevxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DX9KzDEVjU/fTTDcGb95ndCnZgCTwVgvTiQizOHIA846CNF/s5mPmUJBcvd+yUbz8NdLecRR2tt4MkvOzNrZvnCrmUIpDStMwdNiI+YGnvPdvWtgHzFRqeAuThPzPnDJqhKsBRaD/WZ4ahEzj7W1NRQ26HYgVBQo2aShEldPNFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXo0eDH8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXo0eDH8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b379cd896so411404f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 03:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638180; x=1764242980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaAjSoY/nku4Rf/DgaeK7ZZ3RvPX6WjghtPiUfT8Z6E=;
        b=yXo0eDH8a39wf2mJZi5ZCmO24JkO8uqcNDlofYdzhqODguuHUFfSOEjClgSBkBldGI
         bELcTfoT9IufzwIV0FFnxFsx6YOTA8Tu3BEHBZb0bzmr+gx60CYpbHa6XJGrcc2EoYkg
         T/EFqPjqKIiKLBjwPfb5sUkt9jZCXKZoY7TO6nt6d1cFYz7ooIpeG0EilIUkA7gcmOvh
         lsilJuMTD+Bid+C6E9SPRegYHoMYypzhVFmUM070b4rC3RjXyvfEGpSA22zyANYVgeXb
         YQrYDuw+9v9ugMntVQGPHqdkUszOI+NUIwoRELfkV+k9cS74qJ40DZ9DSrGdlvRsdJ9q
         bPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638180; x=1764242980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XaAjSoY/nku4Rf/DgaeK7ZZ3RvPX6WjghtPiUfT8Z6E=;
        b=nXFEilTze5XbaRuNM0E1/GFpZKvtd2J5tjlttnhfU3NXFG/+jxVqA7vQ6xnszYDR+7
         gRp2b36B2MsqOcZ6CX/Wmej4lW1I1kJP2MBGA7TzJAgubVT4tZhGJyQLhwrqh0KM6vg0
         l7k/nGuPUX5yFNVdfex8uO3mKPXWu08Tlf9JespcFoHkQILqGw7rG1ee3qwAsd2xE9je
         tqd3KYJZfR4s9+mePMLP0+mwj5iSXpWSgArg4VkEZevt5St2KJ7pEWDFHPejuD2Clnny
         jIwIw02X4MAuhdUVcdTd5eOz4lHV2sKFRdASYEUFrd4l3pZpCucp49+JHHNBTgWy+pcY
         qtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo9W7e+gurkY4LivVExbkZM+c33VVck0ujxbnOyHW7UyCqoYNEqLVpnsVVJMqOU9twVTybyNs0ZOHfdWLuKDQCyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZoGB+7uo0cZYSRalm6PQboUcDTQlf8CMQT9CogIFM1HXEtoc3
	FqsI0TMTtmvFWhG8oV0NAbuW8YbOP2wBpEOH03UcjcUDPbO9/vNmeqzJ/MOnrtacU40=
X-Gm-Gg: ASbGncuJm2z8noil8riMy+ncvqn76sLmwNDs0EZhF6wtEThfcY2OX04yHLp4mm03yhD
	r0BnJFOwgv4K3gzgrvf64Fz338dqyapceqpFIvOpzH7bUus+GlzzfM0q/TCrHEgHSmOqhF+1mXS
	TRvFeSkPPxQ/NLhtn2f/5lyA2KIE+vCm4UJZTWA0Dx0kOMZ3DzrmqLxe/lQkVW2bPj32ZsYj5np
	DW7vHVvc7MkpAbUXHf1XqEWrOmm0GOm+kfxOt3DZ8TWvplquGQr3C1pCQ6j6OfKErJ3x9Er/Lat
	x7XmB7fMCMPId+LVGxM8leRngEGKUPyiukjKs8TlhlP0DH1j3xPw8uZg6Fv5cdt84cfqIiePJ1U
	nzU0M3Vgy/xngiwupPj6mwqzyDKZ1uw/o/wejZJJ660sEDr19hxnUf5MwXZlfBoWHdtYipEHOUU
	2v80L/TLC20lZMCykXm2MOh7UVZWDI+56mTxaRLtlpQYi1zT3iSpzUTxMZ7tkHQj9joTw=
X-Google-Smtp-Source: AGHT+IGbKsNEy/oueUtizdEXhVcAeX3YEdD+UJr2wvqpgctEkJQ/yJL/aveJn6ori9RZU00wT99XRw==
X-Received: by 2002:a05:6000:1846:b0:42b:5448:7b06 with SMTP id ffacd0b85a97d-42cb9a219ecmr2426328f8f.13.1763638179927;
        Thu, 20 Nov 2025 03:29:39 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:39 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:36 +0000
Subject: [PATCH v3 2/6] soc: samsung: exynos-chipid: use dev_err_probe
 where appropiate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-2-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=3106;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ydziPpmvPsHAqypZZhan8Qbcj761T47in3GhwmLevxY=;
 b=3QfKC33suSvG0rhHt/+ek4MMRHqRHtNEUYflZ9HpBIoEjKBWMgp5OHbOKUXglp9RLJujxdm4Y
 eJ0sTaG3i8yAL0fq7oX5LmnwNS87zA7ibX3lE4bZJ0CXepRz/sSZvBV
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
index 49cb113d99f314ed94730cec2b98f48a1a7b87f2..b9a30452ad21c326af35c06a341b28491cee6979 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -81,8 +81,8 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-static int exynos_chipid_get_chipid_info(struct regmap *regmap,
-		const struct exynos_chipid_variant *data,
+static int exynos_chipid_get_chipid_info(struct device *dev,
+		struct regmap *regmap, const struct exynos_chipid_variant *data,
 		struct exynos_chipid_info *soc_info)
 {
 	int ret;
@@ -90,13 +90,14 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to read Product ID\n");
 	soc_info->product_id = val & EXYNOS_MASK;
 
 	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
 		ret = regmap_read(regmap, data->rev_reg, &val);
 		if (ret < 0)
-			return ret;
+			return dev_err_probe(dev, ret,
+					     "failed to read revision\n");
 	}
 	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
 	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
@@ -123,13 +124,15 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	drv_data = of_device_get_match_data(dev);
 	if (!drv_data)
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to get match data\n");
 
 	regmap = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get regmap\n");
 
-	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
+	ret = exynos_chipid_get_chipid_info(dev, regmap, drv_data, &soc_info);
 	if (ret < 0)
 		return ret;
 
@@ -148,15 +151,14 @@ static int exynos_chipid_probe(struct platform_device *pdev)
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

