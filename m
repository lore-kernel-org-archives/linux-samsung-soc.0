Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBEF2FB977
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400245; cv=none; b=Kw6sl1xoZXR8XSYhkRS1Un1dMPq9t8m1p57y/ma9rPdtjryS4HU9M+mzP2HlxLgyS0cLEGN2BgFmhDhjxKzshisz1UWWymIEg4WvV4m3var4lR3Xz5vrmzoIyzDcwO/vZxNgdq9CsjsiECcBkVCibt4XJVjpbwqz22sem9tivz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400245; c=relaxed/simple;
	bh=4R2WX+ZJeXKAug4HVmP5YDimNXbTtbG2dMJBRwWnt8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofRxEfqS0PeSRyNXMevbUTJb/qE3XPRaGEOI3oSgVrIQhjZq7TBu8Hmyxsxx+JsQaAuna6QtEtbZRE6wwgWoL6XGV07JBdzUegN0MTlvLHjOWTozHoRYWAsKUKWOMzFYnm5HFGGxzgSBDGdPGZkdkIIgpkge5fE0B9uaAu7r7Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDRj4jUg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDRj4jUg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso8827595e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400239; x=1769005039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYwhWQ9zZMnOKXaK1vSooK2Sr4WO9byJT6zo9omkZXo=;
        b=QDRj4jUgvMVjRvDUcaq3w2qIBMSbU3mMssLg+u3J9bnrzVBrrpWuge5W//ECWGgoPW
         G3fRuzXdDFenttMAvHUnp6aUVLwQo97GWTqaUdYcbLSB4Qd+Ku4MKvvPs8CJ30547Gxh
         xtPjOdIcyERGC7GHH7C9szZHtFgxVR8e1HKcr1hpEHIfE5nFM4URNjBC226sQjjuud/z
         jHRSdt4ty4tyjJbd3hoya101CFojKcL4GNFqPHo6i6HAU/v/5Od+Y57fJJquf9AhRGFi
         snrWQ3GBgvVzlGDbNCXCsbT3B0oLf2qWFwQt6UJx6/3PjwfSheWN5hEq0833aT4UpCt1
         0LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400239; x=1769005039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KYwhWQ9zZMnOKXaK1vSooK2Sr4WO9byJT6zo9omkZXo=;
        b=icr4f4coDKMiQhj8Qdd0geDvmQMGxHkLv7Jog6Xz/mkrCnwmEIYhdUYNDrSx/3ujEY
         1cb+WlS+xPxpSQgWaC0ICvtJGhtkvYQa5s7fkxMDi91nI0lJny5M9+SMAPqPoii5wWfT
         IRx+NFuI/ka7yfoEZ6rsqxnCWfJn9YGD/hgs/WuRas9XnOqNhFsa1dG0mqyJd4znsDHP
         RkHjhMEiAylPPHc0/jPToBrMFVtIBA6udSC61r7L/F1tXFXAL0MHdD0ERvdjyr7ICBkt
         4fgm0rk8zZ3Tn5wccATrLDEm2x6Aqbuw6Tk6hsk/0AmBdTdZeiOuFyGmUaDJifOWeyyo
         x2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu/WIdhSgnUNsoSDXn/9efzf+GWYhv+kIgQuDkkk+845QxRw34NuUaoBxxJ91zyX3Qm/sFuLHOQiOcr5b5msnflA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBqOG9AYQpmGAecxJZ5igL+wZ8MyRJ2pGYvHwbsooBfzS0/SV1
	tOClEqyGgzWK0g66cDhULqqjuStTbpHkLiIoI9jDMu5dGgDR8Y7dtrVeUr/fPdPddM0=
X-Gm-Gg: AY/fxX7PP6PvaPR9XES/7O6dbzAUicN43Zv5ukeOCI2bZoyxgteZhKkBzp5jWMxdf0q
	hR0t5JdridVsDUUjcxa6E1RgB9HaiEuI4zz8eaPg5PE2camSDKpydMNCy9ufZD7xQBPoC3YeHm1
	er7bd7QHm37p8tyILJ5RzobnlQdVug0ezZNEhTS/etfGIDamu2fDMXBoW03MVFVH3hLc5OSjAVI
	jNiFZ3zuJ9NcOIAexm88GhDWJ2wjakUaNExoGGhLMfjMFTNVMM0BSlP/87f2nJEgYrHErJLwbrF
	YxjQQAHQ9YChdcwpoKbREvEIRdfbzt6UDxAAy0T1sOq/b+bxfVRWXJU4ZXsux9Zs4xFrrBbJc98
	Owi572owDYS9gFs/WGwdNMJDzzxn1+cBSfRcubZqPcUgpAqpZmGzN7KWVvQdwzT5KQRkrZGQ8TI
	NuQY8ZPg7JGwVSGSvmE24Lc7DE0D2epOOn0nO6KcnzxfURtuQyId95+C013BIpQOKkozPppg==
X-Received: by 2002:a05:600c:35c6:b0:47d:900e:c646 with SMTP id 5b1f17b1804b1-47ee32e9818mr42733775e9.8.1768400238988;
        Wed, 14 Jan 2026 06:17:18 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:18 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:36 +0000
Subject: [PATCH 8/8] arm64: defconfig: enable Exynos ACPM thermal support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-8-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=969;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=4R2WX+ZJeXKAug4HVmP5YDimNXbTtbG2dMJBRwWnt8o=;
 b=VnsK9/fLTj9mjFXQo/4xOaDgDR3JfubzIq3NbGbuODD2OJ1c6XHTPf+LI9LbcMoZ3NCIW9wy/
 IJLw4Q7eeDiAhz67Bq9hsH5OJkql4RdLF5r4fJcduQpSKMK/g4HWwqv
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

This ensures that thermal zones are properly exposed and handled on
platforms such as the GS101.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7365427d98195c48e2f8065a8bb1b..1bfe37857f51663c9d745cd575f107fef183008f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -752,6 +752,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.52.0.457.g6b5491de43-goog

