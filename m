Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7645731A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830818; cv=none; b=bLH5IYEOTn+MgR7jR2EEqXnt9Kp7qdM2fcawFEzEZGbOvFWYMYpOdCht3CKrj1qIKJ1exhlNdYz4U+ZsqNq3C6+9cyLBrW6Kd2jrIfMSS1n02uFMU19TgRp/CdV+wB6ynQ7BmJaZEn0prPjbfxNUqJeo8G78JC1/2OYKOadWAOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830818; c=relaxed/simple;
	bh=MRyvhFqUHJTCwrqcUOctTIpVc2d3BqgjKqNWZ2ls3sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bk8jUd6yh84QqPACaibtYrljZBllgx6Cjmwd1Z5ioVt3bcgkqeLnb38L268Jo1LivX7XPRBewkZ3sLt8StKELxdKgNejeDKRO/N7k6tgdv7dEuXp5V9RXyWTIfhSiNtWEZgDIX5JB5orY3gp8OGA2bZhH9Bv3zGEVcmMTc0Jyj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LbmfWN+5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LbmfWN+5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33ecb04e018so2218767f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830815; x=1712435615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONzs374y2ZZQ1dydMn/i0qQ92QOrtMdVepJ+YZpfIxA=;
        b=LbmfWN+5w508+TEMQOuB/SF7XH9Ovn6GoX1loa/fv/alqZ1K4vK3ytFtXcnRqfrsi/
         nEIpfS/8+eluCRJQMdCpwJx2y3zlJXHbbnh9LbBgmgBMue50LzFpO9uTFPBXG6OoRsUE
         PXVj01hkezoM8TAx7CaEVVO76HUsMxaZ3Q+AUI/6tBUvjT3AiUDz/iqEMgaPYkaxNM0x
         /mo7oasXKtSnQIP564Uz86tCPCXfVGvC0/lMiARIpm0tlSIa+xU+RelD/4fMKsdCDv4f
         Jfw+Z06EbHcUC1ZJvZRyc1oVPgTe+dIkMSGRsw9h26odLQQG+Gnhq2IEjI3iwV1VAH/h
         xO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830815; x=1712435615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONzs374y2ZZQ1dydMn/i0qQ92QOrtMdVepJ+YZpfIxA=;
        b=vZNQGCiAMt1USAY86RXJW6on4vPJQaaT1TbRK3lawqnpODFEUbxn8Ehah0WNoZdre/
         /mwi5dvmnOzqqOb+i7aOw5KNHz2vQbH/xQ9/WEP552U41P8YNeihin1UELPHZTvUIyR7
         QQw3R54L3Tjghysyny22BQ6EtuWjJWNlEKIVA1V3TDyqyf5Os2folmRMECnpJ+yA4bhD
         mkPtko0JLp+pJiNvGK7VMbxHNkcnIjFYnwNcHKFvFidxTPrqS7ccm4VW4YCYiygCfeFT
         Hq+AaGIh178n3+B3MeWGSyEGV0/6zPGd6dQQX0q9nP43RGWLvs+nzyc62Z/BndD2ZbOz
         lK9A==
X-Forwarded-Encrypted: i=1; AJvYcCVAuph45N5q8Y/r1weKgHhWgKsANYwcF3RJZSX8h/5/RCwPjz4Y5NDUhCTpOFQdfuNIWHYpsuVx+lL0y6wZPKlkVlb1cz/YcwqtffyPrcFRBW0=
X-Gm-Message-State: AOJu0YwQkBNaWuawdHOQ75APphiMbgUjhAdIc/Irub3nUH2+AobaaGN7
	GnMfSqE30kJ9cyoLvflp/XPH46KKRJlwX//Bzph2ESj4tq/Z7n16VqxomB7mTt0=
X-Google-Smtp-Source: AGHT+IFk9Y40VlFC3fq1m4LPmsbmadOu/r9RP0QX6ioImBx0Z4DDeukF3X61ng8xjtDRT4Kq9PpeFQ==
X-Received: by 2002:a05:6000:366:b0:33e:c389:69ff with SMTP id f6-20020a056000036600b0033ec38969ffmr3102277wrf.68.1711830815031;
        Sat, 30 Mar 2024 13:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:14 +0100
Subject: [PATCH 10/11] drm/exynos: hdmi: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-10-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MRyvhFqUHJTCwrqcUOctTIpVc2d3BqgjKqNWZ2ls3sM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcMu3ioGpIwgAMlPdiGBxDZevzR2aeirZ0+c
 iaB36NGsjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3DAAKCRDBN2bmhouD
 1zA+D/9PczHqQtk5Gt8jztAK2kf8QbuSCt+Dws8ZWR/QbuQ4ui74Zz3JLDzhG8wFUv6EbWwbMbr
 c/7H5EvzVIzWvqmjQFBZ0g5IPxNbSm0g5MY5/SJLgwN8XJE+/QHEo8iCSDAp/YRqAlzIbP+ez3d
 FPrEusO8YhnH7UHZCCfXPAHy+bISnorGwlOeTMochJ1NseuvOxI38JDBiJBcJrhfjtoZvUgcuj7
 SgMBxKLUYayOlBRGYX4wZAquCFnWnsgVqmF8CdvVIjaXt30p6BNfhV6aD78yAOqJGRo5soetLmE
 l4ygzTlQPlKF85TYu3KcGNO8NnF6OdTadTaGhnFHtaSbwnQJ3sa9LIv0d3zED8XVYzFf26nWQTO
 v5tnHcPR3Ypygt2BRHM6jnFGRcgxeJfkIYcU6LHkF146LtCK+T841Nm9bWGJz2ZAj2IFaDtadXS
 oNHzeLB9cTmoNgonteLxocojXJy/wCoccYQ0AxjN/u0kASj1eVovGIDAcMpeWzFfB+fPmcmzbL4
 W1x8btFvmTnQ9aKDtfZTPGAg41oMPXR6VvwkwHIE6cxgWMAPIGRtRr2PCSK3xZz8E0yVv5/zZZU
 s7ACz21ewNS+C0tcGK7Jpfh7WrVgXkwyi1CC3bt3+dsXKJKl/FhZ/ZIrq8WHqGMQvigbEJtnmra
 vCiindfJ5PCitSQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b1d02dec3774..5fdeec8a3875 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2126,7 +2126,6 @@ struct platform_driver hdmi_driver = {
 	.remove_new	= hdmi_remove,
 	.driver		= {
 		.name	= "exynos-hdmi",
-		.owner	= THIS_MODULE,
 		.pm	= &exynos_hdmi_pm_ops,
 		.of_match_table = hdmi_match_types,
 	},

-- 
2.34.1

