Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B03914EE
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2026 03:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824158; cv=none; b=JsZaHqmoZVI2CDDjJlR9rXAY9NgPg1ee6Fv5OXN3iP9oxYvo4ZuigyC6qCvirDztOMcZsotz1jOL/S8Bltn+TDj7iwohdWxWTexU4Ue96CJn0YZHlAVmZbp+86oEy/v8JIhzR31qIOnmGWrAHUn9bJ4cSge7WWRcdLymjxC+38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824158; c=relaxed/simple;
	bh=+Y6ho4fGnS+OOcq2D1geI15LucrZk6rDnmXB/fX3KrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvy2IUWD/JzjLdhYhJXScAPZnIkwO5hT/jVMdqOpFGSMTVALoNVN83v/xbbzjCBnqABy8TpbfoPEyku+e6fQ1tqyr4AIo4akmrGUDQAgRP60EBw7XCcDYGwAnddF732uxD9F40hx+aaslMHZUVXtnbjEuV55hXbittNeR8IlHGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q1mgWLsw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q1mgWLsw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso26745595e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 20:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824155; x=1791428955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1xaYOvgfuKPDqlqGi9mu0d7G4P5AdYn7w9BHWtqREA=;
        b=q1mgWLswOInuXiNLP0e8ys1PsHWWvwHaN4g6NgR5w8haqpvYG4dwewdJ/8YAezYMX3
         7imKNw6VOlRE/VNdeRPVvK2l5uZ8Qq27pC6RnghT/25ms6uumvVHuddUJVGpNE8ctYAF
         arA0GOySYndWA2vRcWifXyK/3t0oNpFEEpSK+F+WXg1WUf4RJlzmLnm8hIGJ0AAKTyTt
         LvYnnwmsorcBl1+C8blDmeMYhTRANuhlVaNIlBYF3newTx+wtcpPU8UVmbyAzF3qm6+d
         wa5d0ki5qngFYLjdNG5AjXIkeO3XUPkCkyRnmulQ5nGTstANT3lshGQdYAH3bHBLoQ3J
         m07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824155; x=1791428955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1xaYOvgfuKPDqlqGi9mu0d7G4P5AdYn7w9BHWtqREA=;
        b=fHffWnwZIJqqPQXnC+89mEGAuKEeHcGocFMnCo9FKG/sDB4wA+KDaSZ5tpsHQWDaeh
         jwlrcz8k4zMvlY/b7gQGvTfYHTPSIq20gSRyVNvG2/ut3P3PV3Xpm1o0E7slIZ/JLW8x
         99jGk+apw2hsd1OxSXn6opdnnVSAPjHCxYIRf8vqECcazulNhgPETXfGvGY0fJD09S4L
         F16v59o8/6+Fyfty3rraaE9SYtJRLmP59FLLoU9g4jQ0fiT+BxnlvOtqls5Yn88qHU3j
         yFJyaKvCG23V3R6aAS+l1cG12W/1aPI4SF/wIUVLm/ZIax+rlYdIeotS7e/+6try/2NS
         7Oxw==
X-Forwarded-Encrypted: i=1; AKwUvBzrJSYdAqNGMnYWiJyW7VX3V4/M2LjGlqegkyAfwY715crAfXAMIBlplGkl3Iq6d5DOtkwrDMTsJ8n+HM9EJgiwvw==@vger.kernel.org
X-Gm-Message-State: AFuF++kfvF5i80+adSXJ7hjJfFSzgKrm02HHMO6vKlzus5onWIxmN3+h
	uKMWrj2jsxr871kRJYqvK/GxYmE4SbDThWPSUZLAn4LKTuCfR9WTzSAetUFsUKGiX38=
X-Gm-Gg: AYBFou23LYsdIVcRgWNC5MzPeKKRATuoSXjoKaxMxcvYEqBDPt6p/SOZ90odrUsZGgM
	YH0h4BIN7g8lSHobNTkJu2trw5XzcwbZZXRUrNE6c0IC9/Tb+sDjmdo1XlbBOQ76OzJyyUNUvfX
	clzi0Aa6FdBfpXJKiodctyeYudI9LIJWXMcJIQ7EfDbNmTeAZf8RJkvD/5GqejfnM+23+ePwJa3
	ytWS2vcSRUjvq5z05EnjZ5g/KuGkaxpmVS8bibXkSiQ9qXm+pL5mqyiSvSkI7hBrS1DWRJyX7g0
	9icrbXm7NH2a9LaZ+Vv2N6IY3W7WrnzWikDsBizzR3pK2KYv993D7aPSMB2+aF3SIM8OFxD0bjl
	GYVLwYaXtQjvuZl/5SIMWc5G1R1oRNuRehb7U8OI5+xPpqy1mphkMTD3rjvzLv9lgVV7BhrHrCv
	R7D0Q1fntlIpyw6cNIsO6eDQLScfj2D4WbauQhKm/AUlwtmtNzpGmOko1l40Nbi6GYO8pqgK3bt
	BDeii9urLxDqWfp+FbEUGXpAMNtTv7PoFv4HYv0jSdLrItoWy5z6O/F8s9heA==
X-Received: by 2002:a05:600c:3548:b0:4a0:8f:7e42 with SMTP id 5b1f17b1804b1-4a01affad8amr46885985e9.13.1790824155497;
        Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:12 +0100
Subject: [PATCH 1/4] dt-bindings: iio: adc: samsung,exynos: Add Exynos850
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-1-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an ADC block within the CMGP block.
While similar to existing Exynos ADC v2 blocks, its data register is
located at a different base offset (0x08) hence a new compatible.

Add "samsung,exynos850-adc" to the devicetree bindings to differentiate
it from existing Exynos ADC variants.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index def879f6ed20..90a220e3b78d 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,6 +18,7 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
+          - samsung,exynos850-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.51.0

