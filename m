Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0382D9F;
	Wed,  8 May 2024 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166089; cv=none; b=OUcF+0s8yHj5JvXSDhbf7aE4KzVGL/zjFsZ0mcu2E3R0AoXFpe1ZVGIQPJ1azRYasKl9AW7ejLsTUKNiMxksKo4SS0afkK17X+fQ9m8cCLlqq+bNp2kVpmIbaU+QnK8g4rPDNC+M9Vb84kgiqGFcZrJSpRKXyIoTEnuIsETc3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166089; c=relaxed/simple;
	bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmaxcjQw5DDQscvm7DB9ez0OjxeEzinIN7/1Fpszw3I5l5K9OygoSW0208DHUlfJPBUDD8o3xiBfwpZl5rKFbcHw93kVE3zdIfsnISXqk/+OTy5N5qvgJzy3FT1dx2Vx15NUVqlF828Lejg+9gw2pLXieAy8KckmmRK3ZqDYIFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuMMpDjH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuMMpDjH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f72a29f13so5077229e87.3;
        Wed, 08 May 2024 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166086; x=1715770886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=QuMMpDjHPVcKHvAi7qfwl+O1FmvQlCvE+Ur+5LkKeGTEK9bCqqzfTTluGgcPJkFOt4
         6S4AISEIk4AqwRNKTIfdaJkUiZx/kN7D38leIMPNibOoDS2x00QUwSYT22g3jb85xYU6
         4VR1hhfYA/Y1878q6noBA/g/ORqG300vcc71by0nB0cGL0pEEN7ZCEpU1z/WcWtERPTo
         KOmZEhaXlFMecnYz1ws9yJi9JXEOCoWZsadA66UTC6cqu+s3/1+vFOGWBwcJ+d9a/8Dz
         9UcoUN0jOu93ZW8Uh+BVSwBulWEQAOTEOCBJhJ8lXS9E+1QniULajr0A3MhAgAz+8ggT
         RL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166086; x=1715770886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=tzcvzfgQLF+V96du1wdEdtvHzTRCXwtmX5caqrnH//Rgw/6bCWTxnyo1wwrG/Kg4MB
         g4WwLA83nq4t+qjrn+OlAxCR0Cvk75BZTfJsP1MjrFsRVkIZDmLqZ1n6SF2V6EYTK+mV
         O9Ez3iWmmLmjzcxbNPIrwBXVibzwKm31oUNM1SPL5ezmttcXIH2myuIzlPA/BhjjOfzg
         Zhmkl2u+bWAwf0g31lrp/RLQIIsOXRiHl7vQBASWFd/NQqt1mrXkTI7H3YT1vp1ke+Kj
         suNi7x27NyGGLO6TXnYznGAFM8MqgjM6606kpeI6XW5TrErylaaTtVthDbfy/eR1tuvQ
         V1BA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Z+H3idP0snMelo5ke2/PL3uv4ND8sKZl+3ukTNeh60dDmyvwhj90bUqPYJEu1h7sGPfvJXVfM1Cnw5hoUDZ7LMyJKlBZ+ddVyNPu1LP/bktd/Hm9szgTca+QeB7Zq4MF0I9XQOpwuLSFyRSmculTKsZ4kXM/uLfopKlUwFdfvMHyrr3kBmAuqDkM/pBQ+O47lwV/WHKRsUtE3WxOj0D1VPpiixCRTzo=
X-Gm-Message-State: AOJu0YxGKG/uDxEty74GS7TIhqMWXnMAccNgNcl0AqvnjoAi1LOyzPLp
	UMprWRv9Nu3awAaIVpctKnQeIRv42LkRROpsDqPOxsLu1QkXKVCX
X-Google-Smtp-Source: AGHT+IGeO76uQCED1J00VN9QCAey1wfpGDo3fQs8/bwbKEbtAP/7na2lzT5MZkH/YfwFEC18bO8Zag==
X-Received: by 2002:a05:6512:40e:b0:518:9362:f63 with SMTP id 2adb3069b0e04-5217b5a6837mr1384384e87.0.1715166085711;
        Wed, 08 May 2024 04:01:25 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:25 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:54 +0200
Subject: [PATCH v2 6/7] ARM: dts: samsung: exynos4212-tab3: Fix headset
 mic, add jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-6-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=1934;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
 b=l0DFXbMoynUW/3tl/JJn+d4FFNg8IhQpMsG9UJeOU2kGTDNLpMYNTOAalpniOTbooBzyKlSiZ
 P9EqRrOaA4YA0I/fq2SM0f9GJDPc5NwRz+qYyqlEMUZfFI//F0HjlH5
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Set up headset mic bias regulator and add the necessary properties to
the samsung,midas-audio node to allow for headset jack detection.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added headset mic bias regulator
- Added samsung prefix to threshold properties
- Dropped wm1811 config changes
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index e5254e32aa8f..8dc81112172c 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -294,11 +294,30 @@ submic_bias_reg: voltage-regulator-5 {
 		regulator-max-microvolt = <2800000>;
 	};
 
+	earmic_bias_reg: voltage-regulator-6 {
+		compatible = "regulator-fixed";
+		regulator-name = "EAR_MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound: sound {
 		compatible = "samsung,midas-audio";
 		model = "TAB3";
 		mic-bias-supply = <&mic_bias_reg>;
 		submic-bias-supply = <&submic_bias_reg>;
+		headset-mic-bias-supply = <&earmic_bias_reg>;
+
+		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+		headset-detect-gpios = <&gpx0 4 GPIO_ACTIVE_LOW>;
+		headset-key-gpios = <&gpx3 6 GPIO_ACTIVE_LOW>;
+		samsung,headset-4pole-threshold-microvolt = <710 2000>;
+		samsung,headset-button-threshold-microvolt = <0 130 260>;
+		io-channel-names = "headset-detect";
+		io-channels = <&adc 0>;
 
 		audio-routing = "HP", "HPOUT1L",
 				"HP", "HPOUT1R",
@@ -345,6 +364,11 @@ wlan_pwrseq: sdhci3-pwrseq {
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo3_reg>;
+	status = "okay";
+};
+
 &bus_acp {
 	devfreq = <&bus_dmc>;
 	status = "okay";

-- 
2.45.0

