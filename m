Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BDE24A7CC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950711; cv=none; b=teRdeB9ljl6k+H2VZyhzOkn0Juy5ROmu4LEECo35Eu2C8mMwDyIR6UOkgGxoVLEFdRcJnlAMJcSrATg235hvjniB5rP68o/plwjOEJKOnq9weYNQJVDkAKBHl/StnF2QENobFdvLd1EDaxJA1iAa4gt2macnFNSyMxEtFSSXY3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950711; c=relaxed/simple;
	bh=cvoRnokHeZzQ8VRShaM52NdG4d55CGIYxo5phUWuECU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAJbeo0qdOmXjC2hb55B8435BiZKPVtQqdjRusbPtCC1sO/qAm59IYGmRb0jimDlNzX+iYqkSsQnXrQoe6HDP4JVeSDMUgegW9utWSRPjsx/iuyl7CPyEPt7/hyYxDlKEhlo+6TWNl77Goi0lew9O1Snq+ZwFgXt6KhWbrYcsKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KWbS0xyg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KWbS0xyg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43623f0c574so48541835e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 06:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736950708; x=1737555508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HO4vKlD6tNCPtkuVgbWkA6ubwQYE8g7AVmr9ium5BE=;
        b=KWbS0xygiLEDDRJKI4oyLqlerGMYzPYubAWzfYAFVCZP8jffuUmJY2447cEavylOI/
         hQkygxhSO5VnYYi1kjbMqcGfinmI4hX6lbD8jDwjESrMFneBxD9fa6yKUHEFuEfdQr6b
         erFeLqtwjx9MtySLerQ7D1DGe4VJIzozFWk97C8naVLWmWdOIkS+eThJmoRy0pHYCOrg
         TaITWTqu/4l3F6+EvnlCNiLsa7N3KGUR/1zI7S5/5g88lFJLYw3J+Gkng/sInoWXPlVH
         hxRq4Hz15y/ZwecmmAVSOkyCCBVrS6xQpZhhp5Dn72YxikyAWraeczrcfRQaXB63Wv0f
         Worw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950708; x=1737555508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HO4vKlD6tNCPtkuVgbWkA6ubwQYE8g7AVmr9ium5BE=;
        b=I7f9EUNTY1pM0xi9K5NqPv0Ny7cH2jU8rGeGvJUO3/v608KP2A+iuVqofsXqAOHi7c
         CQS3I1mOPSwDCr/YLOuJVuIsEz/wUhvmCd6Wb9siDbyEa3HkEGM7fiDZMYYVtdzcJMV7
         GSHPyE2KCojUlM1kNOsNhdY9ZbLBcjbOr2SMLWfIVm20Tap2ZC/jg8hThHgZBi8gubvY
         8CauUYKDwjRrgEib6SLHJ4qSu661sTElobgpvy6enLkqwhyKhGPbZSofQiSuNwrFtODj
         V5Ur3NrtmMmdxIjDE+8Auh1V8inzHOHjnoWVcoc8srPem1nTAiLtAA+KbZexObkdDT53
         +pfg==
X-Forwarded-Encrypted: i=1; AJvYcCU3TCGibPgXqt9RyexPr4/4r79rsxpu1p5zg4DV5TUKIFxk2ZDnpyHgYtqLl+eOtYlOIHnPXLUswQ8yg5g4O+WLdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/M6j2M4iYqqC8ehvQ6HfDuvzmrYULpNS8QQh5q3xKdCLxVpeC
	qdVuDahH+Td6f21Vl8QCdNH1UzolqfZ8iG+XYyrQTF+9iw4jWT02uWSO6JPUYGo=
X-Gm-Gg: ASbGnctKSta52+X2XwA6HH5KYgjawxTxS0aLD8fR5Gpc6GgBmhHhSiUBf57SujBT6GQ
	6V2SXPNYCmK9dj+8smh1emmlOvvPTrKYSuqAWtZ1Ky0z4GTBw8H/K+D9bHKn1uRal+tFudT6O46
	51lD5qUcWRDOEKkbbgju4ULjEIJgyUX9qBXSyOwEsVfGVMSq4tWklvlCtVtyPQ7cG9JPq139+mI
	Tp4FpMr/eS/QzL/z2m7I9toQTAMV/Zv0mJ7mW8cTYLpjULXwyklrJqBiCdWuF5p6ZeE5x9LODqf
	JLKvzLrO2roIeNETukS39KE3OSltRKJneN9S
X-Google-Smtp-Source: AGHT+IEqKXJJbnn3/1vrwEtWmevXHNqUju7YBJtvyvj3cj5u+nYmT0ONw6A52GmWC58UAHN28vy5fA==
X-Received: by 2002:a05:600c:35c1:b0:436:a3a3:a70c with SMTP id 5b1f17b1804b1-436e26ef06cmr220817945e9.28.1736950707824;
        Wed, 15 Jan 2025 06:18:27 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74d8e06sm25184555e9.31.2025.01.15.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:18:27 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 15 Jan 2025 14:18:16 +0000
Subject: [PATCH v7 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-acpm-v4-upstream-mbox-v7-3-948e09fcb5f2@linaro.org>
References: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
In-Reply-To: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736950703; l=1338;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cvoRnokHeZzQ8VRShaM52NdG4d55CGIYxo5phUWuECU=;
 b=0aWQkFROnDt3ngWIx381mdcLAcbZApevkQbElAx12vy+BlWgFaRDh89nZsR0/9mv2HawEKvjC
 tyS3q9kEstgBSc7lvjrckxx1b0ySb/qAlqQh8J+vp2+hHZL+VT3G2E5
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add entry for the Samsung Exynos mailbox driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26..20163d8a8d90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3020,6 +3020,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20712,6 +20713,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS MAILBOX DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+F:	drivers/mailbox/exynos-mailbox.c
+F:	include/linux/mailbox/exynos-message.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.48.0.rc2.279.g1de40edade-goog

