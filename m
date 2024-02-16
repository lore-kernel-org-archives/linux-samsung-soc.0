Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCF412C54F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092297; cv=none; b=r4gOMoPZ4+sCwr7a5O4xEYQHJKnSfSO2cCM9LumSupWi4iEbuj2Hk18+8Osmvfa++YelOjTZV6uRPE/WdMP1AxheQVWXrU/oOm37mSRqLs55e84Iup/t7MJiRYv7e103fNueN+vBV2qJw8MpP5+nK/kUMuiN9gcgFYi8rGW+N+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092297; c=relaxed/simple;
	bh=uMXzwh5LI98M06E5LlPIWoA0Gxr0PUNOn3He28YGDe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KSUk1kdTNYsuRkCG97Y47gnS4Ocq2jpRbewfkCCe7OELr7UWcYnRCnUuIHhl95zrd7y0jPwqb6uitgaADCXC5h+P0wX7Vp8fZsngu8Oqm+GEcjjFqLB+ji4yqpkEWdGSKwH0SzpHvFYclBqSBokFfoXuN4aac7CkDrLhZjRyOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PNrOYDpG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PNrOYDpG"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511acd26befso2659460e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 06:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708092293; x=1708697093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFFOnkuhdy25mEzIkoji6xOLVUrxNj5AoQeuBe9eLH4=;
        b=PNrOYDpG9YuORqGKV8MCfkdCgr0wHJG+cWbFuo/IFiTyvhxJINZtqWGXr7/AEYpk0p
         ogGagbVAEw+HjOTIIfrxCebfPAt+JCh98ifRLD/u+mgz+wA4REZVeG0ZbMj0fomLM29l
         Z96NhC0rx2ooW9mGVL9AxN66stolSrvgXtmc8+OLvYIkdGqgCIfSctXpmhiCrY8pUzY4
         04XGwjvQKdD4wkKdR4DIZYaPOqJr7vnE8Lztkx1LkAzp8vH3xHWzF8rZtNxJOeFTmzsx
         ZMzNnBywEgsl552FuHY1cxD5+2M9XVSocilCCZGZljq93aveMw6MaPGxK2QIaegKNbd/
         LDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092293; x=1708697093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFFOnkuhdy25mEzIkoji6xOLVUrxNj5AoQeuBe9eLH4=;
        b=VJa6BrstLLs3dnz9MEGU8YjNyudunwNFo/YfRwRFGpdXA8NIgXP47cALxJWq0bpT/r
         oqn75d8olRwxMc2rt2K+jjG2SKEXIT8/F59z8+Coz2X9c9UDBQaJZub13j4Rvcgo9EgL
         YbUfi683V0GxrXw+vyeBfgNCHsNcCNbP5VYuRYRfYbrcMrMAKg6O0AyRLy52tH0qTZG6
         5gJ499sGRvBBpBnRnWgPzqDMWncncHPJPfkEfQJ55tqpQa20QKP6dPzdu8X1I7DDRF3e
         z4OwDuGLKNKSV5GKISeweqBkfb5OqmZUjr3pVTQ4a/vZJd1fqh7beAgUxviSIXElbncw
         cDIA==
X-Forwarded-Encrypted: i=1; AJvYcCWtHZ2NgWjPsEV5ca8dlhSl7ZYxDhNx+YCjuJ9DYKe/RLuBGnGsyoYudBn9mqYohGuSBjK+btM7L4ohIc0KuYxjtxU1OF7rNzD1pOrtUBPtqcw=
X-Gm-Message-State: AOJu0YwU5jjo8jmzRtmDhSLSJJJmVHFoeaot1OvpEOi4qj99gFresYGK
	olM9rSGcjRe0KbTXO4TN1M+Adh/5BIiw6F6XKAKmukzJDeP801EauHQ+olQpbvY=
X-Google-Smtp-Source: AGHT+IE+1C4hULCImLj3jDWXQQ09a49vFqD6OoQ+yregE7p2ail5vYnmur2AvfavYdCsKkS65YKc/g==
X-Received: by 2002:ac2:5585:0:b0:511:8581:4352 with SMTP id v5-20020ac25585000000b0051185814352mr3468228lfg.34.1708092293128;
        Fri, 16 Feb 2024 06:04:53 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b0040e4733aecbsm2516628wmb.15.2024.02.16.06.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:04:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/7] ARM: dts: samsung: specify the SPI FIFO depth
Date: Fri, 16 Feb 2024 14:04:42 +0000
Message-ID: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings patch sent but not yet integrated:
https://lore.kernel.org/linux-spi/20240216070555.2483977-2-tudor.ambarus@linaro.org/

Up to now the SPI alias was used as an index into an array defined in
the SPI driver to determine the SPI FIFO depth. Drop the dependency on
the SPI alias and specify the SPI FIFO depth directly into the SPI node.

Update all the device trees that have instances of the SPI IP with
different FIFO depths.

For the SoCs where all the SPI instances have the same FIFO depth (like
gs101 and exynos850), the FIFO depth is inferred from the compatible.
Similar SoCs shall do the same.

v2:
- use "fifo-depth" property (instead of "samsung,spi-fifosize")
- update commit messages
- reorder patches. Last is using common sense for determining the FIFO
  depth. The nodes are not enabled in any device tree, thus upstream
  will be fine even if comon sense fails. I guess we can update the
  device tree later on if needed. Or we can just drop the last patch. 

v1:
https://lore.kernel.org/linux-spi/20240125151630.753318-1-tudor.ambarus@linaro.org/

Tudor Ambarus (7):
  ARM: dts: samsung: exynos3250: specify the SPI FIFO depth
  ARM: dts: samsung: exynos4: specify the SPI FIFO depth
  ARM: dts: samsung: exynos5250: specify the SPI FIFO depth
  ARM: dts: samsung: exynos5420: specify the SPI FIFO depth
  ARM: dts: samsung: exynos5433: specify the SPI FIFO depth
  ARM: dts: samsung: exynosautov9: specify the SPI FIFO depth
  ARM: dts: samsung: s5pv210: specify the SPI FIFO depth

 arch/arm/boot/dts/samsung/exynos3250.dtsi    |  2 ++
 arch/arm/boot/dts/samsung/exynos4.dtsi       |  3 +++
 arch/arm/boot/dts/samsung/exynos5250.dtsi    |  3 +++
 arch/arm/boot/dts/samsung/exynos5420.dtsi    |  3 +++
 arch/arm/boot/dts/samsung/s5pv210.dtsi       |  2 ++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi   |  5 +++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 12 ++++++++++++
 7 files changed, 30 insertions(+)

-- 
2.44.0.rc0.258.g7320e95886-goog

