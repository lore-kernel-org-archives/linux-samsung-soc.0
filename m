Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408C33062
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830804; cv=none; b=aH97FNaXGlXZFSHpggdmS6Qx3m2kS8PrlRe75xV5i7akA8tzJGEZZWLuwP4nMywoWKp3ktk12Xj2Fk1noaa/JFxrCOkVi0WcAk/RVQEA/Vub2puji/SBOrn6q9Hm8BvvVevcmH/TbU87Eoxqrd06cUfNaW5uvlnIdlIfgYrxer8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830804; c=relaxed/simple;
	bh=RrrYKA/AFI5ndy2h1Lx8b0hMlMn5qR8304zzYvRKNZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aVePsLapx9EAY6XtpT1R2wIovv1uTFwR7gu4LjUSTqwe8z0NGsOTKO+eq36ewbe32NZZ37aFL8lYUdGGvkKtz5cmyldubL8fYrDQqap9l/Pb2D/+Ax88tbLY3iYnnILY8Oz9agJRwQlGtifcNTh3HViSlkLX5HkGtCV0ehX0XMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CxTNcIJx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CxTNcIJx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso2311644f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830801; x=1712435601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxXsLaV/Jp0AuTCoy11lqfJYU7SA1bxHTVlpRCdXP0o=;
        b=CxTNcIJxTRUYZSkW5AfrN+9V7qghVkJ5K8pjLQUi6VLDcNC+fQ+Emkn4WBT8P9fzu8
         jAxOOKZk+yztPoen/bzEBbn7QhBBv+Jq5R50pXlRdvjtTHqPMhJsQhDY92O+brmRvItz
         opzloi54XgaaHL6GoMicxlRXo6fEr/taCisZwWiJus+dNqv+tAnmFcU92RvW9CJ37B2x
         yBYC+/n9JvGEU2D37gm/mlOsfApxjfofA1oWvFtPqzD7bQyRmstq+oNOKP2n6I6aFuGO
         eoxgCOU1AXYPaQ2s1+0fYc2hgDKwzJ8YA7QdyKicy9o8RRyhW9HlEb+5SFlh36KldH80
         YT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830801; x=1712435601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxXsLaV/Jp0AuTCoy11lqfJYU7SA1bxHTVlpRCdXP0o=;
        b=q34ZzvG2m/6XpKoM+xSPCrT5jppBFHpz1PGS5GPtf+RJfspffN+cmS28yseJvQc2YF
         IWuYJL14Af6BpkKlou7fLg5XU5QEPnD5H7JXstyGd2Dpj8NkyXBIUdR+/OtIZPsfT9k5
         3xQ9OfKzPF0AqODMjgbVp6tbdHfiAtBlhzePeoEcqKF6/2eRfkSYApGXWvjyO+BSng7K
         2kBmoZh5vLPHJdPM9RlrpGfrtJOJReCCuJB2qfmA5Q22lCF0VUkiifgwe6ggmQOVgB1W
         ejbn9udiWMqhxz7nu7wa91VeNDIv3KYKCG5eVXmCyYKwhv1dy7Jz0Tm3Cu6cSo66Cw6B
         YTnA==
X-Forwarded-Encrypted: i=1; AJvYcCVvWKtunoPeNlBLCl7TddasvbjNXJEb2HyUMm798tfJKtX1I+JATECCFZjXXHGUUGJKWW4ktVIKfHeb9XbhpxJKTZcfmF75UUx5pnqbuWp08y8=
X-Gm-Message-State: AOJu0YzsTR094ibyYOyUluL7X1LDBVPSu4QFFgSMvykbJJYvXvXmCBSW
	yCGka7CToWZW0Xf/RRvJk3sMe0QfOViuHFM0vz/QBlORvBWEIHzNyluJqqV8NiHF9uRjuV1ktCw
	S
X-Google-Smtp-Source: AGHT+IHN/nKCm/+Mnbt3kT5922it2JlAg2uTRVYbLIOJLEZ4YrvuKM85wtb0sB8SeztSNGtLyUBYjA==
X-Received: by 2002:adf:f747:0:b0:33e:6efa:757e with SMTP id z7-20020adff747000000b0033e6efa757emr3751670wrp.22.1711830801306;
        Sat, 30 Mar 2024 13:33:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:05 +0100
Subject: [PATCH 01/11] drm/exynos: fimc: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-1-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=815;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RrrYKA/AFI5ndy2h1Lx8b0hMlMn5qR8304zzYvRKNZU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcEZEHDFpKCTeyd9y90cBj1gZxYBm7I4YGUJ
 Sxemb8fceqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3BAAKCRDBN2bmhouD
 1xT3D/9zXrRAF+TmbzdfPV40breUzsBxyRtoc1viFKPZ51qVOINcSfgvasG+FYOE3m2Bsv2/cN8
 KohEWM0YcyH9ILS4YFz0hWOAKxLUARJWIocN+3ATd3BJvuSMoyfGaasvvgHwVXtKDM5hw3rJKdh
 O7AeV6fOH3/OTjgQ7sxknMrTwLDViIzXTh81p45zNgd0Mmn1Dw96uWp4PNIztsV0JzChNgt4/jp
 FNh9xntzf6pYgkeupWD3bCVV0M6NWmkLQMARj5miXx+zdAibMbIYK1/Q7etUCFDU7aKkQ/RVa6n
 GW9T75h9zvmdC0hipz2Osc7qAMOdBgJ6/MchkpZIf0s5XRApNgTtbVxv5EhZ3hJbXsKyFZtAdDg
 kT470aNoLsY3nxcwuVCntfrB/8Aay7japfstnoR6qOy6EV7AiAsE3CHX7E8LS0Badjz+ItkmIj7
 hTpWAxe3Pfk4vV0zoofqYyY2kuAW06VgxtqlmoCLg+OdIIhnogjnOsH0byKZ3r1uYMlxWM213+1
 xAuNnbwqLJSP81BX8vhQgTu2nco91Ks2a+bMDOlGv1rOWy6XwNUm/2OBpqFtFboicqooI/16MTh
 edSgCFuJtOwEBbhG7PlFWD+OJ/YAFRjb/08fGmD56aMZDjGayokHjEypvUisIO2AyDwEv1Uj0LD
 6/l2Z3jONE8VGTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index e81a576de398..142184c8c3bc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1412,7 +1412,6 @@ struct platform_driver fimc_driver = {
 	.driver		= {
 		.of_match_table = fimc_of_match,
 		.name	= "exynos-drm-fimc",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&fimc_pm_ops),
 	},
 };

-- 
2.34.1

