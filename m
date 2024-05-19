Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ECB3D963;
	Sun, 19 May 2024 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106700; cv=none; b=EdYoOCTW4rDnzwwPL1FQFEw9uRB/6wXxPmhmagEkdMLmJC5ZHWVlSt3Cuk++lOtCwmHxNpV9rWH3JVI+WulE44SRIDE+qQ1GJ05bwVbpcTKHvLjpHpd7Obh7F9qMKwhQHzeMn/k+ib8BjbRe4q4W08AkzGxuBrZHy/3teEMEbNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106700; c=relaxed/simple;
	bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3TtaEoGpfreASYpsdHVx72mkai6nnVqtacLOyPpB0fvxBv/x94EDM7uuzdORHJxz0OC6iSilBW8w7yALuVY18ITg2AdDjBxC6nnT6Vb4ZzSlnNCeztL/vJoJjfZ2iQPY/c8TLO7VOvT++0ZUGdrOLY9IqcDwy4aFlsEPbZ2+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1h0p4XB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1h0p4XB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5cec2c2981so208299266b.1;
        Sun, 19 May 2024 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106697; x=1716711497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=H1h0p4XBxiNofg1ggcgytmaeiSBfgw2PhYaWYml0HgJu6trRrXgnEbcQL0k6CDeJF7
         fFqSLTPmX4qWrPA1HjJ/kiom5LRwRD3Rj+/kAB5s8OUzt7REamEunaSRIM5JPHf3z4F4
         oyYNpyxszY7gsUPbXZpbwRaLzLmuF0D8ietD7CkQg1XJL4vwsxwFoS+7UEcw3TRfj+1j
         lFwKDhterjfrEf2iTtawFODLQiXXXCg58nikT1U/azYxVDXYZA8DFnW+grgJ6OY6kd+2
         VngjxktqS6iLfxH8KU4kGB4dwqwdRhwDyvY8bU0Mtr0CGuXnkuZEben7narGJRqLS/IG
         F3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106697; x=1716711497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=mnSQ6dXGNO1bJ0lZFgyneF+gQ181YU0RmEh7ssu6gAcV5SfMUjq6Dunm0wRHmc7o9B
         FQbtHeWq95HyOv52chS9PUUCOnO4mVv+8QfeIUx9L6M+t//SHc55AkLo+zUQJGw+dLot
         cPHDrXiz/eOZXQ1g1lYo2EAldVNSiM20970yf2Atlcf/7g0Qm9STmVVHO8izj/B0o/wp
         EZ66O1S1pBaGR771IH5U2Josn/gK/WAEmCGrCMQmE5uxAseg+IMZCn+kgJWiaLPJRA0Q
         j1dpF9e369z7cDy5hzPe39xOSpRbA+DMaA9/XFxoezuV/Qx01cSCzqdSqefTQLOMnmoo
         XSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/QdNOLTBLhraeWwItmkp8Y4PF+5JePubt+qLcxhoExiw7HNZq07LKyzFg+3eHVUXDWSxsgTLHABIZ+wOwIMoAJmC3bYo/ZJnIo0or/tkRg8AMfzdZssLnoEVOZTqJEQRGJa/XiiEXIwaHx9mBXYBltufOEn72KxOJ2ghoCnTivIgku5CO50AZM134MZhPPbYoKZvUxCHjD4bt2B9qVh4emVrO2HUxQlg=
X-Gm-Message-State: AOJu0YxSY5EBfTIEfiVtiFbGJW5Qk1L0x/v2S5DaSFhaRmeJRiYQ7HsB
	CiR+gGAMQ2wCbOj+3PEIqJR5BRleaMjfoEKM5ALKzqnBXGWks5ul
X-Google-Smtp-Source: AGHT+IG3SMaDBws1fzIkcPLAJz7n7Ag6C6la0lbxW02ImT03Ca69NZo4TJd0EVoTiNb4ZOsqOYvl9w==
X-Received: by 2002:a50:d6c3:0:b0:575:a0c:4b8c with SMTP id 4fb4d7f45d1cf-5750a0c4c71mr7898781a12.38.1716106696840;
        Sun, 19 May 2024 01:18:16 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:52 +0200
Subject: [PATCH v3 6/8] ARM: dts: samsung: exynos4212-tab3: Fix headset
 mic, add jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-6-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1934;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
 b=7uG1N3oCFSVcHBgOu630Zb3pi3zaKhxy6TMe+0DPNU1zBvvLFKsgdfN4Ck4LNGhnW0CpYcgRE
 mdzyO/Ha9ITAAd84jXijoFHaM9QleQPYATtna13/I/VA3AuPupxCnTk
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

