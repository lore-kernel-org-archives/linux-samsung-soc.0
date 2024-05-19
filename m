Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94F45BEC;
	Sun, 19 May 2024 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106703; cv=none; b=I1I5JYy5eAToh6in7gChKxdjGpvHkHXi10bH3Itupc1lDmcp22PfvK/3hHHcUEpUwbq/K6IEHuslYtx7cCuOhHJ9jCklT6pdVGm1ghbc/WK0nXU777zgcKmTEo2F2h5790muf04AoMEU3cjy6ctjJ5KRmoPWmOagYYN+6LS/oXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106703; c=relaxed/simple;
	bh=EKY+Hy6LBgA2NYrAxNKes2DxchRh15GEYQsulR1Ud3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmRjI9yTl92b66Vaf4VxTZWvSEhKWw3S1O82UbQ43NZ5+usSpkhaHGYJscCVpA1fb4pJruK+LHthvPVbuggfJNEWVJ548FgASRD/n1Fe8lGMtDkD9Mli4M1lxtZhvRxCTABWeOUV1LoI0f4dwSnTY3X53sq7M2v42fIrpg1A3J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCYqw/cz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCYqw/cz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a5cec2c2981so208301666b.1;
        Sun, 19 May 2024 01:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106700; x=1716711500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZHcFtW9++T8RHFOp1RN6v1q8xOqk7qAzG9FoGfpxU8=;
        b=TCYqw/cz0+ZOxzALHuSEu5QWbhOvKc5iqjI12vVlMRn8ZsHWT4uxl4LGzpZ212RIXx
         6OS20qy9L7TtSNlc13FhqDRLne7HaRkMeshvu/FkeOxU84vvVvKx4TIZuzyxjURU+KEl
         //XkczNRia35DOTbTlYZP+q0NWL5u4/bEQci5zvhPfi8j/i0wzzIP22fFxO2Jr0Exd0T
         DRoAMvI3ppIZ8AZQDxBbiB1CHgIeoxa6etEisJO+cYyUEgC8rr96uBlqP/RW3e4lhkLn
         x8OvUUCiHfgqM1gXjufeF9bY0lBBgxuRoxbCQ0I6/98hkHRvmcrLPie8PPWG4sFWFMv5
         zofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106700; x=1716711500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZHcFtW9++T8RHFOp1RN6v1q8xOqk7qAzG9FoGfpxU8=;
        b=WrDGyYWvS/8JhGhFtv80AQg7YtSRCJiM9SeKQkXnLS3xDWQBjeNVcpD3rvbplbL65u
         nLtBiKMdrVPnUyK3P06DrydQBlU+CO94cTuAAVRMHqi9jt2eB18IoCqNuOXLghKI6lWL
         72N1ImtR1651okW9B3rAc9MefWjxSuXDQoPSAPQXjSDeWABVi+zBIL7Q+T3l5gpL+Qum
         zQBO/FFSTGj+LTtsfzWsYCeKQrdLskJF3uDTj4uHqk2ZDcvd821dJTpISTLXBWjfDbzs
         7XWZnFw0h3Cc5fQd+6BOBpNFnJiK08q8DlzlIzpF0T4eI3Rc1Y2RnkKo6zfzFtbmwiwL
         xRGw==
X-Forwarded-Encrypted: i=1; AJvYcCWyXPDiMS/MBDgZhces7VCQKMXEIZ2e5cBSNjgi50REnaDABKxhlg6Yw/QJBV7vLS3jb436shXmfkTcFt7jBXk/NBblHCmT6zY9DCbV9QHuPXFwkw6gBfK7m1+UD2C9VmnaVX6eKQzdTmo5MGE6B0CyLq+/g/e0UCKIsR8AgCReUbW113t0XMZ6yz7wJuy2SFs/4N/RLJNrVQkvDsVSbD0x9+KzQUAHkFo=
X-Gm-Message-State: AOJu0YzPAUanr5qmJS8zJTGEuMLdRsDW0oyB9Sofw2aJEfiC2opTpRrg
	SYQs73LpZXkIJ4DOIUJL7j69Uc0aL9LAsHUwoIUpgQAx3eRoTec+
X-Google-Smtp-Source: AGHT+IHzAvK+rhsJq8Fp46ZI7QRqXTxhpYy+yG/cCF9GqQapzPdzcVtci17vQVRRgkNlN/TxSgrMKA==
X-Received: by 2002:a50:d518:0:b0:575:2ccc:13c1 with SMTP id 4fb4d7f45d1cf-5752ccc14damr2537043a12.9.1716106699861;
        Sun, 19 May 2024 01:18:19 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:19 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:54 +0200
Subject: [PATCH v3 8/8] ARM: dts: samsung: exynos4212-tab3: Drop interrupt
 from WM1811 codec
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-8-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1130;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=EKY+Hy6LBgA2NYrAxNKes2DxchRh15GEYQsulR1Ud3E=;
 b=Nu8HOGw+ABK8etkGN/FIHwRrDIIaop4fIm35cS8IufNRyVktSGw+ltxRgukhX9pKr+Bmh5B/R
 wxogZ+n7q5vB3cE8+MeF9gE6ftpRyW72QbVAuVZlr+VUAeM/A16FXYw
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

This was initially copied from the Midas DTSI, but there is no
proof that the same interrupt is also used on the Tab 3. The pin
listed as the interrupt here is GPIO_HDMI_CEC on the Midas,
but for the Tab 3 it is the headset button GPIO - GPIO_EAR_SEND_END.

Drop the interrupt, since there is no proof that it is used.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split out from "[PATCH v2 7/7] ARM: dts: samsung: exynos4212-tab3:
  Fix up wm1811 codec config"
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 47e9a230f2e8..20e5e7ba6b92 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -534,8 +534,6 @@ wm1811: audio-codec@1a {
 		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.45.0

