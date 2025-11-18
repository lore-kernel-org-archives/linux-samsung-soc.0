Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7BB331214
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474185; cv=none; b=LRCArkl+b8jF1l7WCqbpeRBmJINuKVypXgoNk/BKW81AzfUEmS2meEQoOdGfRn+9hA/zuRj5v7nf5O6mJB0EzfUCiFTUVKu3Cmc/G1vr1n+Ebg5SppIfIIDUkhBpFy8CKe9LHbCS85Q/NwWKKHR6FF3nUxfAQHS6qcTseFnx7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474185; c=relaxed/simple;
	bh=AYey41JluNvIXnVAMYRQRudvFDMHByFQlXtTmWlf5rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aa/RjeNhoBjBYJ82e/tUrixlJRAjwfPaePPOj8r5fT455Mtc0W4gNfMzMHyYFhiH3Nxn7a5u/UqDMT1d88fNTKJXeVc2aJgI4C3P6Y7rGoOskL9mQWmqsoYCYdHVJCjA8OCtCrZjMeSDegGx/QftcnrHxRP6zk4Ym/SPdx1m4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVkDV6lu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVkDV6lu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c8632fcbso3934089f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474180; x=1764078980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGSZdccmXWk8F5qnJeoPtGkKc8FpBWygh4CtyjO0Ar4=;
        b=EVkDV6luUWBcOPU+pXGUG01wxqRMSbPZQF9P0X9GWC5icPHQqaoQE+woPEx7O6+vdF
         UdX08d2RWtkGertFxWzbcAokaufgbpKb1LECFW4F9TTUnSICPphy79O4SYv96AVAROjQ
         b7sYWiBYbard1ot5ptdcuHoSmHkabarbSDNPFzt/4DZa1u7Vl3c8olDRdYYHJokX75Hn
         j8Vf86Dv/GRgso3zmT8PtfsO9VLC7ULVtG933LtePkuc5mOAuaZyKj/Yu9Bpy5HJoozS
         5XJLHLT8IgCEKkOhVgs8xWotHAzZ3uTI6IadGmchtPY2PZBOg3MDWwAjG2O6NOZjAQRm
         SvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474180; x=1764078980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGSZdccmXWk8F5qnJeoPtGkKc8FpBWygh4CtyjO0Ar4=;
        b=B3GXHOaGMfradJHHJqkFiY5FGhXoAokgH9U21coP0DHJFDsl2muxvA034YsqGx8B5b
         rRDYewRNvM0sC97p4cgHlup9MmpCRiOz80u30q5xSH54On1/CziCPGAisoBBM2OYlhY+
         sihxAo0QpqfEWiNqCvqzaHHR02WEC/95NYFwC8mNuI49lkq0+3HoqJp6Ey7pdqEXgjYh
         mYBarOC247Jd0lRLD+CsJ4cGU23o6JbznPc/ZESIZpUeiWqF9z7VyLtL/ka5ONvo4aKt
         V3gsVo/Fu4HBY9Ye1WYxbvAT8sHvMbWt9LTL5BGT7P6MCNwiiYYNdq9h9RHZbG4L2UDC
         w10w==
X-Forwarded-Encrypted: i=1; AJvYcCVHkk4vuIDbukebp9cMsciYCFjrQQJQnEyhFJlaMocJCRyfeOn6xWYEmLX/Y37iky6OO1Iuz8XHlVqM4vLw/AqLgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LPFwVPeN74PjPOCuLw5/90d4KEL3ITWqZw1CGHjxf3PonjSe
	s3Q1/qaIhEiogCMhNNbrCHwQ2HXdowf5Ad2Nr0zp0sH9nDIAEmXu3Yy39edJ4MwQhwI=
X-Gm-Gg: ASbGncvRz9NXvuYG/PHyw+e5jgMEXCiSyxyU1dXNsQZUc3nmq3VkrKtaE2LbAS6jvlo
	DAZJNrjJuCdzaJ+4rW90djw0/hsjPzdDR6s5U1vc7BdO691e7XYYHMyjXrPBcy467jLQ3/WJp4l
	N3I3oSGG4RGEKvTDFneqs9jIlP4y4l1JrGc9DCBnD1w+7XkC55y3wyGXDyvSMaorUHTLkxiWPaa
	ZdNlRCGugZmceG7fucGjCoPRLr6O3xGJ9vv6GdBm33gwx9imH28Vy1wx9xdyfcu6RJQw3yGu0/9
	wMpfcw9k6MEVnfFOabzYkWtd//dBofH1BqMbZZlqcCIzgRYEN9tUVBth0zj/XH2RHH580MR6cJd
	yhQTQ4BXFntHJi0K55Vse/uQQi8jULYLjIgeY5mQOhMCiDsGyZeG5rr2oZb0T0eOsBWu/aUySXf
	n7bl6wHRnUtRRfsKMEHXpFB4rZqbrJN32OyMNi2GWlSJeT1778H3W3Ww9RwtPq0w5drxqcI1Qfi
	weO6Q==
X-Google-Smtp-Source: AGHT+IGJOqGPGMa/xpFl50AjeI6gLPwIWReT5xV4tI/TQp6aNhxWJYaCSsA7r2uIJZrDLJkG2ExunA==
X-Received: by 2002:a05:6000:2509:b0:42b:4803:75e8 with SMTP id ffacd0b85a97d-42b5937335fmr16390114f8f.43.1763474180302;
        Tue, 18 Nov 2025 05:56:20 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:19 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:10 +0000
Subject: [PATCH v2 3/7] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-3-e9f1e7460e35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=2261;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=AYey41JluNvIXnVAMYRQRudvFDMHByFQlXtTmWlf5rA=;
 b=/BoUySuXF+LzGbF8Xi0BjukaCLCcgm542pIxGyPIv9c71vz9fpN2QT6L/bYOX6wdCuHw/i8BZ
 CmaqZLVmv3sDkYpUE5IuVIAml7k3WYlIgKtBidL/6Exyw7Ub0FBh/46
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Simplify the unwinding of the soc device by using a devm action.
Add the action before the exynos_asv_init() to avoid an explicit call
to soc_device_unregister().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 8904ffdaf9a6f6d069cc6af18a24dd00a2780892..db73dfad4e1b4fb001cb653bc8caf8aa08d85f2d 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -145,6 +145,11 @@ static struct regmap *exynos_chipid_get_efuse_regmap(struct platform_device *pde
 	return devm_regmap_init_mmio(&pdev->dev, base, &reg_config);
 }
 
+static void exynos_chipid_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -207,28 +212,19 @@ static int exynos_chipid_probe(struct platform_device *pdev)
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
@@ -270,7 +266,6 @@ static struct platform_driver exynos_chipid_driver = {
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
 	.probe = exynos_chipid_probe,
-	.remove = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 

-- 
2.52.0.rc1.455.g30608eb744-goog

