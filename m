Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC9D84FAF;
	Sat, 25 May 2024 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643701; cv=none; b=bLPKsX0ekAkufb/KKj0dXokpacTNFYsH3/d68rG0VnYNivTXX5g0p/+yNa5M1HHAVukGpUtNU1R8AmKKNvycP8qHaG6k0OnpRTIHuJDc8eupPfC0SeugWEoqScRQODYe9G6SVbD4x/NUGhM5PlXc54InhStCKZo0+3H7VgC8B1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643701; c=relaxed/simple;
	bh=JqmBRm5p/y60vQho/QixG5OijJiMY4yvo8+3qIYS2Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SH8gdJuaqUT0qorFw+D3eKRszsXGhz3U36gQP0JCpuRsv3A5X+8lLGzZ6FAVXmcUNhUqce7O9f9khlj+BSOgSuYIQ59Bo9G9vN2Oj2+Ct+fjjJK9sviLfC5X2l/WqGXYRbdXo7Q9ov6d+Dkb3/69a6jEhE6AQIx/u8pgw/EK/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFPOoWPZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFPOoWPZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5a5cce2ce6so1245061566b.3;
        Sat, 25 May 2024 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643698; x=1717248498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAevoRwyHB/hjeggss8BgF1gg74yCzQU/uk4mIsOlV8=;
        b=nFPOoWPZz3CxJg744QldMKzU17p190cSKbnz6wr2xcV5zLZ6FLxZiJbsLmMfcDKzYd
         qOPuUQR0izmWaoPyHKiYqwrx3jcvKTtuY+Bi0Yg/PJYzomxv71gGLgTVdn+xf0eIU8yb
         crrtQejtqYS25X+Z17HBXNRv58OrwuDyS0ImQYe5hBQBKcoMgoahLskEkPvlcym8s6r8
         0OCce3Neurk6p3GSlvqaQBoeD99DI5p4EMdPH+OajnZphhvbcl/31wv0ZQji3mg2hkBM
         O3+nM1QRTZrzButmAZrzU4plr7NMi0Q34V0bi9iuUvuCjD1G+fNRRGOKUIM4GbGYwJRA
         B0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643698; x=1717248498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAevoRwyHB/hjeggss8BgF1gg74yCzQU/uk4mIsOlV8=;
        b=qN5I02eBjaVVy31Oei3GBs5ZTbbqwnFeKiaagZhXEs3DwUI+RMtOxtxmqA68s5hS/1
         eXH7y7eE1EswNUQKxfTMDA2wzfpfaNNzBsKrXFOCa5eP84cbS+VddrDP/0GofRBg4huQ
         PzZyY3SnnVQMteWHVXz+bMOFJpuhCgW757cvWZ7xgosLHWXOM5gzgy0ZXYM98iR55xoh
         49xVlYKvgwxDRXuayNCjfqNEFCIj8IwDetxxFl3ZGNN69vGEd8vEcdi0MlCCi087R9ui
         Ie3sBU7xznTAu1HMHQOR3VM+T333676OQxgYJpxi8zOc/UQfEN8kH1mfzGF/9XrzObk3
         tMEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3YWvGMj2F/650tcx5o6MLxPjlynfO1EvcDkCufJyF2dt2YDz7a/jzJnIhbe3WqumVvgIWFwqpAQplo5dwkLlej0dshiDObnomZg3akM5Lw53g8mIdi91PInfQwfgoEDsKg2bCqZswRTHmX92M14iZfOEdn8T2ZBKeUz9c1sGQdqB2rKGU9Zn/5oaIA/dx8d2PXZ9qkkVZJgT1xZlvOM487sD0B3/xl3Y=
X-Gm-Message-State: AOJu0Yzs72b2GKkCsVo2v0KWdbQKeQL9sq+/CTxMA8TDeXCuUmYV6mxq
	EE6S6KoM8GKPr0xkeHjXr2e6NOqlR0RogiOf3tp+ZYNyImGrpWC0
X-Google-Smtp-Source: AGHT+IHjDWw31Jpb0flKPT54OLT41uuXKaoyPQviyN3N7/UlfI6Rk1BZIMko/WbbCb3qjGua2q1M2w==
X-Received: by 2002:a17:906:68c7:b0:a59:ab57:7413 with SMTP id a640c23a62f3a-a62651341ffmr304999866b.73.1716643698275;
        Sat, 25 May 2024 06:28:18 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:13 +0200
Subject: [PATCH v4 9/9] ARM: dts: samsung: exynos4212-tab3: Drop interrupt
 from WM1811 codec
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-9-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1130;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=JqmBRm5p/y60vQho/QixG5OijJiMY4yvo8+3qIYS2Eg=;
 b=att6PI+S7xL/90ESu59NSz4LR4vIES/yJXLYib2LgY8EMPIGeok1wNdGajg7ym3EcfPb7CnFU
 Pwld1M2ToFDAxruK69JapsFnNIrDHO+vaCy7Kw72doBiWQPqda/rdnC
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
2.45.1

