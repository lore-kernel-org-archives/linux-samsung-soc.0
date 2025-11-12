Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8AF2F5479
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936160; cv=none; b=Uxq5ORggiWh+29hCRhf5aSvrJCVFGC6pnW5cAhZAINjsv5XTZyyVBUr7+g+JNb1PQqjdyLVL++6n6FYMEOx1z9l/fBeeU6HCW6mmpEWkOVDUT6RHJPXzVCZMTY2qeDuZuCdxBni2JVY29s58bBKmckvU0tJdq+usN57D1jLKzf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936160; c=relaxed/simple;
	bh=Y9wJNseX6YvW31AdnsD3g0WQa/woWSS4h+36pzpwGoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwrZlpuB5Ha+wVzWMfQ+0gFDukBrdJg43wZCyD6MMyz2NozHKOMBnJ65EOupCGrs/C0VGxpCYlwHEzTZu092DZh47dAGaRBhFWN2Q4/x5rYu52WV+v92nsV+4bq2Xr6iLg9QL7pZF2FTHE29duqgS4ywZpT1anUtseB0z4fyk8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IW47H+uc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IW47H+uc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477549b3082so4257045e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936157; x=1763540957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OFp+IPnKRa3v3OPLVGWcy+GrbtTT1voW5UO4BoVK5w=;
        b=IW47H+ucpDb3lheQPUYZmLeHQQI27P41LBIURZeI2+YJWkpjPtslCPmUcfV8nfIvON
         /AI1rohhZcIvR81FMrYSHqF+j1FIJ6/dlT8lIzHlT3qtSYiY+cKF6VoI/5p38q99BdR7
         Bc84utXZsaO5LSJMgc+Nmy9sma0bS7qUoz39xTzRtSA4pSZ7wIOM0CNhFxRzCGwXh4ac
         hN26lz+atEDjR50nPf9HEFiZPrZww6Yph2g9PVuQgqRAssJtPVaSIOtdy46IFeYKhsit
         yXu2UFdo5PEnRb/7xiAE1KxJryrkiy7wzazFo4RhB+wLfmCQ4BChIxkaA/0qzMyoS8XF
         bamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936157; x=1763540957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OFp+IPnKRa3v3OPLVGWcy+GrbtTT1voW5UO4BoVK5w=;
        b=MoiTHkrUBQadIu+Ts1ITiDk6Fy+qSOc+/k1/uvVUwAHp0fjNdrcERUgGnswhZQLSX6
         xPos9tNqv9hCbhxob5rwDU/l38ZHOzFZTQ82wO+rQvIfnHjPxvJschOsJpIMV25mSIvn
         G1D8n0NFYlBvGA1r2m6QKT7BhHistyqS9+Da6yRH1ZFn8+BhHA2G6AIT8EhZSzP4nxVp
         i19TFiHvrNkPM4cw/51Q68749FDUIv8Qujt4rGZBtMMPrzGAip2ICGYw/jvOjgtTGpz/
         VEtn9lsCSOtrDOFoulmcFQaQcorPCwutHl9zE1OhmqE3kCDFEU0aYEQMBacaLHd1qGkm
         6Vzg==
X-Forwarded-Encrypted: i=1; AJvYcCVykplfs1XoTtnoohNMkLMnAH7smHWV/YTz0dNcUIMV1rLl6B1LaVfmcFgWNXq8u3gOchFVOgHokgj1yL0p7tlQJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNht4mv6WSvf6nyAEA3Xz2U5CerB2ga+Zb02bODr2/enrTJ21k
	taj82Bwe6uESz0X7P6koF+u05JKClcX90JilDziKNmX0hkBfXnVesuEiG/5Q63GxRTw=
X-Gm-Gg: ASbGncsUgeagNMJUvq17XcWL7GIvOUvRx4hQcOuhjk0Nq1RwAuVo7F68cZaz0LR0tXD
	X+uEiDHsGb6laCasZd2h30YR5aOm6KpVySTfoDGn9Q/ukv8oIc3fVakEViyLOGAkfltilKajvhi
	sK6fxIxA9bo3KOnWiaj35kFO7INNPhtnjODMJ1xwlvk8X19D8LzTn3Oxru/SU6khAQsTOkBFLn/
	LPykp6D34ZfQwMmnpauvM1VT9GBMndeIqSYOso5G2J9EwJEUmoGgjZfUw3XiYklK4EQkQa61hfO
	5MjvlobWLCpdcIWSD9DKJ3tnBp7XW8FT5MrqTf0jIIb7by0qHOBG1wBohsTulgjnb52gH6Y7/lS
	WDgV/lWvxGGmrPTkfqWw35gGSLDsi57hNexiQL5XB8CbL7SZUJF1QsUa9UlJ/tUoGZ0vYXaM2Xk
	tuHbEy+oAg590gXUeBtW+OUpPEyMgUlAdj51k7cwM829sSwzWrU8hAnNle
X-Google-Smtp-Source: AGHT+IHlpapEj7ymskzF3Fjgqueu2gUV8vx50CAtQ/YTQGVKieu5QIoV5IAB8BvhUU3H0SWPp7ULVA==
X-Received: by 2002:a05:600c:1d0a:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-47787045055mr20227885e9.8.1762936156868;
        Wed, 12 Nov 2025 00:29:16 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:16 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:08 +0000
Subject: [PATCH v2 4/5] arm64: defconfig: enable Samsung Exynos OTP
 controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-4-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=1050;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Y9wJNseX6YvW31AdnsD3g0WQa/woWSS4h+36pzpwGoo=;
 b=Z6fGWT6SoRfFw0zQdHsVBlO/Qbu1DkGHl4MU1QSzryZwNo9dsZbeiZgmfpnXbo2SEuMtYgsTG
 gs+W0LRj75xBnRKyv7cv0ou/7oI7kGsxjbMNCoT1WLvkuXJfdVlP/85
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the exynos-otp nvmem driver. The driver reads the product and
chip IDs from the OTP register space and register the SoC info to the
SoC interface.

The driver can be extended to empower the controller become nvmem
provider. The fuse block stores various system information (TMU, ASV,
etc.) which can be accessed by client drivers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 646097e94efe7f1a18fb59d5b6dfc6268be91383..6433e3c0f88b892ce6f2ee190f866a6ab4889771 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1682,6 +1682,7 @@ CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
+CONFIG_NVMEM_EXYNOS_OTP=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_ELE=m
 CONFIG_NVMEM_IMX_OCOTP_SCU=y

-- 
2.51.2.1041.gc1ab5b90ca-goog

