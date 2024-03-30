Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534FC56459
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830814; cv=none; b=LokUbOW26bUNIcxWugFA5SijEtcSkJuE1SHFvqbo7z8O6ElptJj7V3ccF19blW/sUAOQ/dlDvcz7P+n3s4G5RX9HUBD0TPVR961z5YMQhMwLEwO60Pk99xY838WLsO+nvNTgU5Qw0yu0B8DCqwsnj2OrJNTsUa9KaNzZkT3txZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830814; c=relaxed/simple;
	bh=HRewJKROx6Nn0LHgKE6EsT3R6rrYRmwDKHHjjo48+wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQFV72mwlPwtyBhnVALUtqktG9YdoNXNA9S9M6QojtaKYMofH1hsqcRnbBI7j7SuG0d/vSvAh70whAHCPHnR2jwFwnR+qWi6H7kXtIfWYHG61PGfOEuac2jCyCSNaVG2DednSg5C1tmXc9RH1JTr4r0wSwUrozwh7Dz/ZMyFM9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jn0n2oRU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jn0n2oRU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-341cf77b86bso2029772f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830812; x=1712435612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okXcxozSlQaij09cQMnZFJDIm4akho99cwdDVwFRPRY=;
        b=Jn0n2oRUNIZXD7WE0CwHDr+cIfk5gGzqlDgEP5UYZLhZJ9VCckIwU7Ju60cuXPk1C8
         b++w0vKw/ZCK9HZ5WWhIsWs8zlfqbsqC0lRXDRiGVgXFwKdJTLSOAfJIhKrrEPNfubVv
         0Vr3wxV+ROJjyFG4D1cRK/zU35/Rol9EO7KlIPp330ATu+JnjZ3nIry14QAbQvoEBOqj
         gjhpr83Uw0X6vkhqt1FGQ0TCrF7d9FwDL2aSiFriGkhKSzivXrLmWdFKTuDyUgAKaXMh
         fR9aMbdr2askNCYG78HvPP6LdJcsdC2+d6qUP2w4xWWnkh4XKc5Lsuh/G14aOuWlYeWx
         xjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830812; x=1712435612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okXcxozSlQaij09cQMnZFJDIm4akho99cwdDVwFRPRY=;
        b=AfEdyklzDhkHHCFarVXNXSm+jiS1pgBfkC9tKpAM2+cE7UcvN5Abe/3+v6i8FK7thK
         qicni2P1OxDRDb+7Fu4rOv84wQNEtgbRv6lwTwmHS7OI01hBpqDYQwmxYrGNHQhNLAS7
         sdIwEeSK5cGfGsIlHnBE0hCpz7HmPnmCaAtN+3bHUDPMkorw/pjr0Unb+rIUK6TeUAU1
         Fpb5k1nx0qIHS5xS5ayh9dfL3HB2UAvM3ymOhA0045FpJAbMxnB25uLzWIOqHneA5ndn
         8osOwMWvdwMRiAsSG9O7LKtGlSDXVxNO3r6XsbLKJi1AzFuEBnVqf7D3VOLSGLS+46hw
         hOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxooPPfqMv4Ws9JZPfIAego5UmenXyz0npNwFBqIgHB4lPlYm5NplXDH6zPzJWA0c5wFmWtqHZWsx0x5SIPLui2VoK6Gm+QM3s5ev2pVlEAVU=
X-Gm-Message-State: AOJu0YwbDoc0hjI+12wajm36HX+oTeIoSfAGo0WI2D3qIYZjAvRc7D7V
	ykjqE8V2kuOMiFrsY+SCY9m11sHMV2p3JNpPmUm2w+zpqsvg4eXv1KRCfvrKQHE=
X-Google-Smtp-Source: AGHT+IExwBRR6ELoyteAMM2AZW4w8CR/HrFou77porojhjA8ckvKqLMd9dECVHqm4WmsmgahTvhvmg==
X-Received: by 2002:a5d:634d:0:b0:33e:c679:da6 with SMTP id b13-20020a5d634d000000b0033ec6790da6mr3566287wrw.57.1711830811832;
        Sat, 30 Mar 2024 13:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:12 +0100
Subject: [PATCH 08/11] drm/exynos: scaler: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-8-3fa30e2c7e5a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HRewJKROx6Nn0LHgKE6EsT3R6rrYRmwDKHHjjo48+wQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcKOr3YLYD5+4yT9hehw4TZ/rfZQRMW7yGMm
 I+Cj48ZCm+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CgAKCRDBN2bmhouD
 13qjEACDMauB2fSHi3ELii/UYDCIxSdm7lIwe3GbeuuaNXy/BOVfJ4BLMuI4PiOt8ibSVGKdL2K
 yGFTyCeWRGyAF6LuHdAxx+HV1eBOd2OQViUyV2Vz5S26aI+ECWbIXfyGxikGT+ycKfgvWW1AxvV
 LnLO9Pv6LBQvinwTaJcooAofnMVt/9n8ObNek+tlc+9I3KZrrxlx9/3uhmeBNql6FOEZBNPTG/k
 SR+6KUfAQioPnUrbHLAg9D9K3dyot/GeqbNErdEtp9WVPwciM+0Jle321GAu3XgXpHNLhTLZ6SC
 B/1lrHE6Z5ZzNY9m3OgPWcnDYjOQW+9U3yzwyp3jupHWsRmIUerDXVPlhO4gIl9/dwYAVL6aRs1
 FkZZOp0VgLKXVlArf5k5yEmjAFmZKTpXh7LpuTMK79PrTxXxrxTEcTI47AcQ1XohYu4MqPxl8WF
 tT6ecMgM4/1sWJ37MlvEopkMXBJLjZzpypXCDuTl1/TWgrF2LFKkReFuhBZ4rQ9a66Yq/ubyHuJ
 RoO7FJK3k/VXksypzy6/jQfWk/iwgmHBhgnB1t5yqlY0Wt1xD8lL5xABe2SOk6lHIMhxniEIoqB
 nsJ+Z0HWrudEPjT0xhKr8+glFNJIWv+AO/6woNhwTDhjh1K0OG8VFXwblK+DdH5fT4UY1AzhBZI
 D/yO/PcM0tml27Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 392f721f13ab..a9d469896824 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -722,7 +722,6 @@ struct platform_driver scaler_driver = {
 	.remove_new	= scaler_remove,
 	.driver		= {
 		.name	= "exynos-scaler",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&scaler_pm_ops),
 		.of_match_table = exynos_scaler_match,
 	},

-- 
2.34.1

