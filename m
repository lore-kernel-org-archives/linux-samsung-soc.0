Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D40E4A99C;
	Sat, 25 May 2024 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643699; cv=none; b=Ry1x+JVAlumlxGPxnh/9B3OGc2JIzcpEJEJ/s2PyDNx+6o8Ucx/J9T0z4QzMSjfeT+6b4dubUqJa8VKvo8IimyIZI3dpzuaEFtmV/UQxZzP1xVU0MaHgeUpP/UN9A/jbHadTHFW+Ze/zHgUQeMFbw4eeILTssg1Rw+AWqZVgCu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643699; c=relaxed/simple;
	bh=hH25eTCdZC3BJgBa3AD+9InewcsW9rj0sd8f9BvAVfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2NI2dj2ENkdbSfeMpcG8aNvDDpQDjNv6Gjc4cOLVXUGq4gcwPXzQllYSsV9bb+qnzFAVcGK/HM2suGHrwulZ/rSmRtyHN9CM/iyaL4NOlWVXM3u0xMAf6wdAS0X9x6aK93/FBCS/Hn4sJJiyCiNwu2ypFsQdPCrA0A341LifOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgszNLrU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgszNLrU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5a4bc9578cso1362985166b.2;
        Sat, 25 May 2024 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643696; x=1717248496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUjZKrfisu2MIRRIzFKLBIKTAToYLPq2V2E0DmuWK3M=;
        b=XgszNLrUYgu5rFIs2oCkNkVu7S3ZznMxu5E607WFRiTVfgk6oyir5UVKATHnc1uWU8
         a8PIfSzouY7O/oaI3kRAxaJDw40adoiUXBHiMCOabPI7oDJHkNgz8V6ViiDEj97WvX00
         8+AmU3QGF9390bnxO7oatfl0bDCgX4S679hx1QE69Ye1r1wHS7oAl2k+7gTBr/ZE4yv6
         KFOk3i5SiCwgiNChFY77WcBhuf+rAQW/KRcNP+79tDcyTMtnMNxr6keoH7rzjOcdpzjr
         jA7kfQ2wc7K3+NVesiOlUmJQ1ofutU4IHFn8PQbuEEOIpldEG4ZIeRSatkj4NfgPI9EJ
         YU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643696; x=1717248496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUjZKrfisu2MIRRIzFKLBIKTAToYLPq2V2E0DmuWK3M=;
        b=W/5sb1/uAQNA1v5vKtMZeXOB3dUBG7D34yn4uQ5ATjvbgbjpZo4qCw7K11Re0MmHE4
         bCz3jAv2QEpIoMUwnGesAU6YnPnEgmIOA/gBu8kDpW+bY+RA3kv0qmiG0Vg6rn9YFHDa
         XtW3L8uXiUtsIe7aoxeIgeC0beWBPyaYxT2qjljkZHnd1QXtXG7AimoTB3pHXIL/cMCV
         CMH9W/YPnigqBlPKukbMsuyq0Q25Rro+xtGWcFRwB8WzEN96Scw34H6Peuhwyzwp5ATw
         pdnbbjL5qEUZkVBGfZVsl1rVFu0phJuqDp0pnmCS3Br3TzIkdOBHdey+06+iTq0ASFWl
         aaZw==
X-Forwarded-Encrypted: i=1; AJvYcCUTmoXFZIi9BEKGMmkO++dBlsqZeL6VBKR0eE0GSmNTHhXXUo8daIZy5ARzn6CEDgGL/b2+IlLxpnKcQMBWEcmXBVE2VqPU48BrxYzfdVhkrOsz1ysLIPaMJmMfDAVgHO2kaa2Rk+faLg8tsOPjJl+bQEOQFxH2/4OdqEOoF06W7Dtddw5IMUUtUfAypRb43HgyJ9S/J3jY9UJUg9jgnKzq9CQTo5SXyTY=
X-Gm-Message-State: AOJu0YwZdaz1FjpEoPcx48ONIWputVssULQdSi9Zdw1HvCM79+FTX5Qd
	TAeaKWCVHIX1GOBX0YOkhqHeKejH/JWvrxMSAYb0BqFI05F2sohQf3UTww==
X-Google-Smtp-Source: AGHT+IHecgBLLiR2XNqDGoawDWaRaibToLWBukY8GFmV6rY0WCbDFPgUt5GIcLfdOSKMc8LBeMskbw==
X-Received: by 2002:a17:907:9048:b0:a5a:5bc8:9fcd with SMTP id a640c23a62f3a-a62646d573amr341067966b.43.1716643695688;
        Sat, 25 May 2024 06:28:15 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:15 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:11 +0200
Subject: [PATCH v4 7/9] ARM: dts: samsung: exynos4212-tab3: Fix headset
 mic, add jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-7-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1934;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=hH25eTCdZC3BJgBa3AD+9InewcsW9rj0sd8f9BvAVfs=;
 b=8suLwt6PYYGht/gjaVmfd4Bf9bOltHXD8x8FCQuaPn3LrrrQKrPEQ7bht7esAwrg3XIlV6ZH+
 Wr93+pTNpjPBik9iZXR4UwXTlgPWDVB5/SEZCqWitcGOvGz9XZyaAEQ
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
2.45.1

