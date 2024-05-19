Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA41E44C73;
	Sun, 19 May 2024 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106701; cv=none; b=Qrq+cB4YtspT5ap4fIhYniPC5SgQVV34z8N+Ovjm+FRe/ktIF70rb2/g0JdU/MIn5WQNhRsFaa3BPi2HDtUeiNtqNZJ7nnyV1CpnblC5YKM9c8k6v8GU92obE9LHWqG/CtoOpqGD4cK+9Q84OaLk48vNpLF6VYjsbZJxlnfOfvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106701; c=relaxed/simple;
	bh=/QyKeHFcTD2xub55oeUkv2MeNFIR4VYheZEY658FtbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaEyuWZRxWss/hHjsFSKX5My+TN7VzJQowU4nXxBsvG3saBR8xOBkNHqG1figgl+QpLX8Iy87rK7lLE0fgKAoJOVQSBfojf9MGAfpd+LW65OJaDN97dApA9Emu2O3HSUW0eI2Kw/e1tqidRiAsfUyHN9SI1Em5FHeyYc92QXJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsbnD5pF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsbnD5pF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso7096392a12.2;
        Sun, 19 May 2024 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106698; x=1716711498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoYlKJuAVKS/043JOXevm+O+WyF+DYPGbRh4c0zs6G4=;
        b=RsbnD5pF7EkI5Cn10Rlej9fWzFf1d9/fR2nLcmH7/Z1LK9rBHSOfwubZNEX1tIPM1i
         MXq6bifOCfyNTEHgJvx1S8xNEv4XUElJbkkpSBagWIHWH2gZc90R83BilWLcAlLtfev0
         Q5vYbr6oO5MqLSZ+yRArW5ZFsurSCzWkk+A7Z3U1Nx8ubnsXpjecNWbMFt6o+C4+DqNs
         L73JzDASFJ7P0Da6wZOe1/UnLhZzd/lBhMe49OQ3v5GwCaCqULnvdpHA5k5FEyDm3UFb
         Jq7l89OqenHrjmNWMt/ZB60TCWWEOWs6n9XPqRfUgQXA8hxZZXYdOP5BSUYZ0OSDqXMg
         cDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106698; x=1716711498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoYlKJuAVKS/043JOXevm+O+WyF+DYPGbRh4c0zs6G4=;
        b=mdgGFALc5GNOJcA3faUflYoJMgB9z+mbr3EhVfd2xzIPzfxAh9UU1p3RJwZKbmwrKO
         xBbqnfbxeyJ76gqG01cUr15+akJ5lPd7QntajM2DYGg/9dTqnuW1jKjRJInDIja3iHRj
         ct0b4jyW+JaOyeZk5IPjiK1l5vNONu0wFgn7CmZc2bl9cMhRLsONJotL7MgZfyd0vNd2
         KJhOfM2fbNrM6i73brJuKswVvf6z5YK/nASk6j8H59HGBvxazv3cLhPCnXXKFI+HV4+a
         hkdUb6y2QbiO+FNDdkEz5srdPpK/9sOGcOwAbJFGFm1IKq+uVDaSYPFUP1MgBl4y92lt
         HDHA==
X-Forwarded-Encrypted: i=1; AJvYcCWMKoiPtXplCNb7enENsx6mW03U1yMqJoSVe4XGJ9Ap9uKnVQ7CPAyhBL+LVXGpYk0X5M1rBunKitf6ofDRHmcGArfnA7vuuhdP/CMfMQFBwGn1XrQzbtkIX8KOT7l16ora7D0rk9vmBq+zGeupHuHwdyw1nVhGpV2O68mgwmhr7YFWTuoRpocIYM579HRQMnJoSiupzv+Y1S1fcaM4RfFokWBg7RWXgIk=
X-Gm-Message-State: AOJu0YzAOHwL0O2IpBSSigir5sttsS63l9/+XwUsm1JpoK9oCU0cIm++
	U76eAc3GOT4aNpxxDCXRaSfrjhDzR4KaIP/KDuLKGPpQ2hYzSRPU
X-Google-Smtp-Source: AGHT+IF4aVK2RHhsoD2L1FcF//bl60wrCCva82WMUuzqnmun+LZB4T1hbo8EUe/nwWs1BL/H6eqGiA==
X-Received: by 2002:aa7:d1d3:0:b0:574:eb26:74a with SMTP id 4fb4d7f45d1cf-574eb260839mr10123048a12.21.1716106698259;
        Sun, 19 May 2024 01:18:18 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:53 +0200
Subject: [PATCH v3 7/8] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock
 to WM1811 codec config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-7-0c1736144c0e@gmail.com>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1280;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=/QyKeHFcTD2xub55oeUkv2MeNFIR4VYheZEY658FtbY=;
 b=uIhQX5gQujMd8bBF2k9b1KLhHd9WhMaSqaCMxb8Np8cIQECgR/UjvobYYub101csayG1sTsUl
 wFY8L+MWe0dA9Ypafuhq1UhoaBTHpdAku9evW3iE3kLkozY5QxnDDuZ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

In the schematics, the MCLK2 pin is shown as connected to CODEC_CLK32K,
which is derived from the same 32KHZ_PMIC clock as Bluetooth/WiFi and
GPS clocks. 32KHZ_PMIC is connected to the BTCLK pin, represented in
mainline as S2MPS11_CLK_BT.

Add the MCLK2 clock to the WM1811 codec clock property to properly
describe the hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split out from "[PATCH v2 7/7] ARM: dts: samsung: exynos4212-tab3:
  Fix up wm1811 codec config"
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 8dc81112172c..47e9a230f2e8 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -529,8 +529,9 @@ &i2c_4 {
 	wm1811: audio-codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clocks = <&pmu_system_controller 0>,
+			 <&s5m8767_osc S2MPS11_CLK_BT>;
+		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpx3>;

-- 
2.45.0

