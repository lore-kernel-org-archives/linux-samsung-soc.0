Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B158350D41
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298544; cv=none; b=aXiKc0Bpen/mPsh5+lKseH/0gukxCpKdqlSPAqdTnFApDppQNfr3AGT3XUUEY+liKe+01UO7QPyNHIbaiHUzK3pu+icwO+qTKqq8qW96rv65C/ViLVka+ibstovT+vWtPbvnQaE201Fmmm/hq9IWuUk//oizd1do30D39MhMjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298544; c=relaxed/simple;
	bh=FUVnP6N7cHQr47dLL4bin/JIRmBbPwyaNW8naNR4SC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDIaJP4jPxY90JRprJQYEnvT3fS2ofid0eNSKlYDkVwPJQvYDBtWs7CcQkpfOrqU6jX8AYtHWcnbJ9QeeGgKBGeNZkb8VI+ALfYGFJcDW1zF8mb8f6sU93GDQWb878T72ihZlRQYdvPLnnp0uHn2YatFwhtxbodLpY9cJPt+iVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d0n9PSEf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0n9PSEf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3cc3600e5d1so1454337f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 05:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298540; x=1756903340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/mZvV9kb0orEkNWMjrJAyvdt/44HABaPUU1+rYsimU=;
        b=d0n9PSEf1iLKn/iLkzzmaAeP2ilekJfZZo3zx8KE9J1GKnmDmLuxn/wtdzSZNYjvK5
         UH+WyFysw1B1+N8pH8Eh+BQCX3qbvjmRYBIOivzyUHdq1mtaHL87suD1MY07Se6bnonQ
         x/Cyf7PC5s55D4/C+g0efqLrzz925C6LsOnJGhAHfjenD4s8s6YiBz5YPJt/+zWdQi9y
         WQKfetJviK/ARGtWi9Pkn3zGzbE9LDVUQABfu09vL9+pfVs1wxNJrXpFTzwAhMc+Dl2c
         kfyhBFPdB0nih99EYc0cZztAv7Ok6vmS01a3wGBvYXTE6esfGQQZB6uD9avFZmx0wxCs
         Ipqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298540; x=1756903340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/mZvV9kb0orEkNWMjrJAyvdt/44HABaPUU1+rYsimU=;
        b=uIcaCi3VRtA0QlO1hAA+H2VAjyhbuvdC34KYI1xwc6EWM7FG7YW8crYI+UBr1YlxfC
         pVxuEvcwFJv/rInHQRC8k2N3c/7OibB+76IN3QjUmOlkMIVxCIlp39bju/hcv32EVxo1
         zCk2xnNfoMOLw6YtfcnFHNfg9hU32a3s1Pqz7blxfItrrIGtHhz5r5hKdrRxV07vOd74
         rh7Kwd3W/cnNnNBXuXbSNvFb9QZ3zejfVCt/SXZT10LKcAdK25uCSOeu6QnRdEjkLj3B
         hfv/CMiZk7o7qqDWG9+fMS5RYga1Tl3uNjq+Z8grfO0qjP22jzuDZ9oCX2Dtf129CQS4
         Mmlg==
X-Forwarded-Encrypted: i=1; AJvYcCWXNmG8ACUn1o1qDHi/a48GeArwQqvtL3rGOcybF6jhd8XytFTPwVHYmTXKvoK3JYcfZQfrDgpPL5ca6GFfzp4H9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8TWmWbgiWJn/YakKtqgc1assAUoPvC05AL6vapAFkolgf791S
	xlgqSFjBRH6f6tvsxx5BkL40hq2zA8RJLKKFb/zZN7dyUg+QRw2ulrLk8ak52KiG0MaBl1nZ3ju
	XR5xf
X-Gm-Gg: ASbGncuARhhCLQzqswP/EV4db8kekFnl/K2K/TVI3TAHZMQZ6HmZqIRPGgqqUYtWKmG
	veFwLkFPUgCqpW1wK1UVVvdYa3ik36vto1rYkSUfaqEOo9tjpThKJzW5rI1AUAWZ9N9DmzOIML2
	hBPw977cqrHQU/GlcKUPQRx9iEP1bTqJ1gY9r4ECi83elwJNuJ4YzCwbi7mpI8ybByVgw8hxDzT
	izA0nFYETSeZKeWltJZ+q7FsaMdE3tnGN3bOvg9JKpg0pEf48JvP4EqBWuDpjMSYlJjId9/YIeq
	YOsGkNcEopC5JdQDU4PPIhhf5CicMGAMcpyNW8629uCE88fwBga1PvnAcdU59UVf9958D//RNFK
	iM/U234kNIiEN+0WgEzzF2TqXGN+7ZjvGrwN8BcSumAMh8xYf9PSykOgSICEbziMIfSunifJtvy
	vckA==
X-Google-Smtp-Source: AGHT+IHDaXwaFMJ9SMq4opGoNcipuyVIDBjCdJ6Q67OG3cP6PVryX0OdauanSBAD0FIphu46Ph59Og==
X-Received: by 2002:a05:6000:26c7:b0:3ca:368b:b816 with SMTP id ffacd0b85a97d-3ca368bb8d4mr6810396f8f.62.1756298539689;
        Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:15 +0000
Subject: [PATCH v2 5/5] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-5-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FUVnP6N7cHQr47dLL4bin/JIRmBbPwyaNW8naNR4SC8=;
 b=vr4YUS7k2uOJpKSWAUY/kzAsaucmPj03Ajnab4gJvYwF+6XrFjwzDMIGkG2H/vJmrLX4DqF85
 Z56PRG77k/rBpCAlx0bGdbJTtH91a+wz1P3HRfiu3UXboI+aGKI2hkH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.261.g7ce5a0a67e-goog

