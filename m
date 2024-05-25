Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A731B4AEDD;
	Sat, 25 May 2024 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643700; cv=none; b=UtcnZsRYKp43Uj3CeNJ68vhkZ2R6tqyTGVR+2BUFDkxI3OmSCHJTzV9O+moczi3u+E9DFCrbuK5debNf2pZCH9KtoHMw2v0TXF//9SMEHe2P+daugRnZGK7lPZcoov1YbntKJyXmgu6i34fXrEYofb7+R6ABBQTu3kPMsuUHXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643700; c=relaxed/simple;
	bh=9NhvL8rRJ4NpIlfmWPhGyv2x7+JR1l7yy4pYIQI11b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGNxDp2YO4NPvCk9g1ofLIXaT3ho4IzMJIDoLW9W3zb8blMNTee9YtzG2W2z+F/Du7UulpYoydK5OvE7lIoinPaZYixQ+1MiwtXMktVpVQXvIIm/GdspphblddlXhU9kE5T3UKAg9AvZL44xi4v6tpIXlM4z9P3A32es2AEVnV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZ3YxhG3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ3YxhG3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a626ac4d299so179795366b.3;
        Sat, 25 May 2024 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643697; x=1717248497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVTf+ORIRGYRpXo2GEU5zQOEzBOgFtModBKMJI7KIkI=;
        b=cZ3YxhG3lJ7PmZAzO8yf/UX+0eCOiZojRrx69l5dfvrxPPdOun4bNim/pgjCxBT7UN
         FrQ22oivkfSwbh0P8jQr+ZTmcMJRu8a609Zd7A9NrRW3EnScIrN1kLJG1HqO0zJo8e0h
         /HZ4H4UeaoCUSrauRVlacEP+NnDp9pOzOWpa6oTTDfXNDcqfkIBAuXCz/CMWqiJofX0z
         d+jhbDVwYVdnDd9TujaK6Rhmac8s+7YElSBY/247+g7bKTpw9EpkHoCH/B3CY8sjoTRV
         3gil2L2yVqGrLyCV+ROQ7hZDMrNB9kDH4BLySOmr0fCalBn58QSkz+2RKO/ByxF9nOfX
         w4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643697; x=1717248497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVTf+ORIRGYRpXo2GEU5zQOEzBOgFtModBKMJI7KIkI=;
        b=i7WeUVWAg4eaQiJcaSEzDy4LalFMyhU6dzoDAlSpotkiNFCFY3w4CzZXRfCV802qZ9
         kQfJsnXBaWtV8EA6Ofn0MewX933wdXt7mzxDToaqsl4z5cRbYXcLdDQQgKWGrToNlYhL
         pLrFDPUt7KBxuYCMzSCxatyw5Z+BUttNH7oGWDd+gNB3FGiee2hFadfUPVbn/FzFwYgh
         zobkqL4eQRgE8VQI11mZLTavALNP1oJH5VWELgl8lKTYl36Xxz635wz1pKXm8kyo+YiP
         Wy8XziudSH/3BfD8JMnMPv2xwb0aArNolBIRM+maQJLiAMhj5K4uOw1YS2M76yX1/H84
         cteg==
X-Forwarded-Encrypted: i=1; AJvYcCW2kiHy+e+abb59fxnKmRMyVkv/oFiLGLJeqQ4CsTp9JwVB8maVxDDy7RUAgD0a9IMPD2GjUbfOuP+myOWg8gJ3upFZDC8J45+HGt5MrXt5vP03xTGYw/AAZM+EkxQf0yUU6HBMPDTDHBg/EgKIO9wRp497Kb+vyBLW3aRLaZjJPFWGGRvqNoF8jaPmRqD0FH2M/86QYEFQHg94KLDq6WbwD4FZdrT2Wrw=
X-Gm-Message-State: AOJu0YxzebLjjyhK4c0cDq77AJmDtxaD+aBg9YRl3I7aS2u5DQ16rzop
	Vqm51lQpiQ5gvDi/M2e71WTSJlrtlBUX9WSJaIsJorLva1qT8ffV
X-Google-Smtp-Source: AGHT+IGKy/nfMumZ+piDk12ki5yLScoDlP3w4SoUDbj6/OPTWDEjPeyHUakIPs5ygv6O1U2HHNXMYg==
X-Received: by 2002:a17:906:6d95:b0:a59:bbd6:bb39 with SMTP id a640c23a62f3a-a6264f0ebfamr326678866b.55.1716643697033;
        Sat, 25 May 2024 06:28:17 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:12 +0200
Subject: [PATCH v4 8/9] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock
 to WM1811 codec config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-8-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1280;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=9NhvL8rRJ4NpIlfmWPhGyv2x7+JR1l7yy4pYIQI11b4=;
 b=C0ynPtHNYmis/xfQ/wB1ZfG8JHLYQUqSEjR4rYX7GYbMQmbw4YCAxg/2J5P30kp+52wjTF7+8
 rsbM/TdIWdzB7cRXlBvMytyyjCrEOlBBw5psPJJ9C8szKVM66+8pWU4
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
2.45.1

