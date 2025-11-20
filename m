Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA22E4266
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638182; cv=none; b=HAT9LdwvtgL6b6eRk4ZbtuoNXxfZgDirUme6ju+iZlcnrzCKn1oQDtXaMvkjtQYIVEwZiK+g008SypsAIWN9CimxA4GgaRVrI30ss4/rC4EMztQFDsGJWf1McLj1o0BNwMirioggwh4AvBRHgl+kdDbx3IW4Dx6i1N0hd5U69BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638182; c=relaxed/simple;
	bh=q4SLhBlNs3t93tDVbeMVgBT6CvDIqD2qRVhlhlaXWaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IimFdpYbgzE0oSVG8cit5sfDVcUrqCmCYvbcMQs8iOS2aXOq7kDXxZ+IlsHL4FafWraGkBlPbVKUGbeczwuFLOkNHKim2KYosz/A2+z+oK38MydvdJk4wgOKOGaJd4V0ArsvpQu2Hh5IudktosOymP6smi3EEf+EMT/Nj5+RCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0NHX+wb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0NHX+wb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso649580f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 03:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638179; x=1764242979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuKrcuoBI7d5g4q4orKG9nRm+eFjAB5tnSDzYO6y5WQ=;
        b=V0NHX+wbWwNwM2r8DpiOMQQ1egjGv6JSAI6A76ss9M9w4FQqACSfqeTQFpfjZnjez7
         9sdtOH7ZC3yaZAPtNcVu9pg9Q3S80sy+eX3KszWhzKbLjqR02ecqfNi3Al9f6OkhZrPo
         vYCmVBdBC4G7y7vNMTyv3ZIyj4+ufoHKETeSWDi7fh3mI4aKpgSpz4u6+xlNvHXKEA+X
         XPG+scsE9ywKsaKUv6jFXxKGbqR2gjLPWX8L7RPbz8ZG5+cDG+6/f398Ow+wgs8B1l43
         i7rPPLqO6zoX9nQ/pMoKLdxyGbvJE54I2+D8cDiJaHBuKlqG+nhhZIJ2P7VQjZFFk4mJ
         V2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638179; x=1764242979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuKrcuoBI7d5g4q4orKG9nRm+eFjAB5tnSDzYO6y5WQ=;
        b=PiWsbL349zKYN2zG0XN2SOlWvByPh3sst+PmI/8dLn4E4z+/mrKHUmU+nmkjZfpTmt
         UZ6SURTEOn8SY/p0PUUyV59HQZCy4jZcfyz0TR1xuc0OJIbjvHreiOIDmIvH6Vov18WQ
         yjspqRPI9m2qmCtXiNXm76gu2dAVoUNtfaB6ftkTcCGLmnZqT+OGwfRBDusycCc3AypG
         Aj0b41bv3+c24Mg7dGK18kdYleDwlWigOEp6pdKUozrplChlIrMHU3uEqzGGqFw2iYJw
         ooxD+ppWvF7ZLi79hqh/K2sudCzEdUS9Q/l7K2GMsRsKx/Ks8qJ805dM7DJXzrM5OjaC
         wC9w==
X-Forwarded-Encrypted: i=1; AJvYcCVO8WORjLDmRA2lEy6kF+Gz7+IbQDtvo6RwBOt3XRgJbH+eq2ArB5CX+NOH51e1e7g6446JPCzUQZWrcnYsu57gjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkoRyNn1GSunTNu9DlJiov91dHuyvZu5Vjb5wMNZY4oOhBJvlS
	z2q0G/JSneOlG8yekvgttkchC8eQ18qU2RdcXOUM5FvIpsz0lSQys1bVQOAI0vI4wvY=
X-Gm-Gg: ASbGncu8oOW/XsmUY4qkLVcKoxVFhhqhdDQZij4lI2U0Uu4ZvnjGa38tfDrSNn7bRCs
	o/c4FoUGDRKKbhg7lHn2BPFgV9pgX/uw3YrY4LG/WXggNg3HuRTYgmaNkJ8yohEsCF2tg3vmfFS
	SF9oBnSmRMPPpUk1hKa8K8LPbJbYKZ9u+tsHIneQClgSQhiW8j7g7pZQgOnAmQWqL1QMFGlsdOB
	hr9ueSMJr1lP0iyl++jERhyiPsVT9zmXZvDVhdXk98WYKV7pRVEyGbxP8EkdsRSmpMEKjCka3ZL
	GfXUexXdrMk4joX5eKrynLdRkJK/q8mrJjYtvNhA1kkM0gP1z4Q0NS7IH2pN/gdNXkRUm/jy38j
	GcTct9CcYAdfIDBPJt2jQOzJBre6WiVb2/saTJIcS3dyPL+ZZDa3oWrCPLEyilROvKdQ17/mkBp
	IiDU5PTkYgVEetrOdiqAbwNMXrvqcv913JvgZvFX+KbaLzUDeku4CznuyS3Xke7+dTu2U=
X-Google-Smtp-Source: AGHT+IEvA1MyH031OEvH24ynuE0LyStn/WEmFOJ9u6ZU8yrQYuFsjPCmysl8RrhQB/MEu5VH/0+U8A==
X-Received: by 2002:a05:6000:2388:b0:42b:3366:6330 with SMTP id ffacd0b85a97d-42cb9a65915mr2696231f8f.57.1763638178815;
        Thu, 20 Nov 2025 03:29:38 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:38 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:35 +0000
Subject: [PATCH v3 1/6] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-1-1aeaa8b7fe35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=2398;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=q4SLhBlNs3t93tDVbeMVgBT6CvDIqD2qRVhlhlaXWaw=;
 b=nK061O76WMFoYj9rMWr/tOtXFH2+xEeqZerjwnB7A5ZG9eGCMLEYmueI7BG1LxSjTJ8CCK8ZB
 sgwYqPwxkbQD0CIyqIOcBPEiT2aDWcKRx3u/B8eAEUDo0B4tH3RLzZu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Simplify the unwinding of the soc device by using a devm action.
Add the action before the exynos_asv_init() to avoid an explicit call
to soc_device_unregister().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index d3b4b5508e0c808ee9f7b0039073ef57915d60fc..49cb113d99f314ed94730cec2b98f48a1a7b87f2 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -14,6 +14,7 @@
 
 #include <linux/array_size.h>
 #include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -104,6 +105,11 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	return 0;
 }
 
+static void exynos_chipid_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -152,28 +158,19 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, regmap);
+	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
+				       soc_dev);
 	if (ret)
-		goto err;
+		return dev_err_probe(dev, ret, "failed to add devm action\n");
 
-	platform_set_drvdata(pdev, soc_dev);
+	ret = exynos_asv_init(dev, regmap);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
 		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
-
-err:
-	soc_device_unregister(soc_dev);
-
-	return ret;
-}
-
-static void exynos_chipid_remove(struct platform_device *pdev)
-{
-	struct soc_device *soc_dev = platform_get_drvdata(pdev);
-
-	soc_device_unregister(soc_dev);
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
@@ -206,7 +203,6 @@ static struct platform_driver exynos_chipid_driver = {
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
 	.probe = exynos_chipid_probe,
-	.remove = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 

-- 
2.52.0.rc1.455.g30608eb744-goog

