Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A5136664;
	Fri, 16 Aug 2024 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794684; cv=none; b=tO/T8JsZyyoCFqAGp9K8uWyPAWk7l4VksQ8vVUng15/dGS7wNs5pKcoI4yATCXHEdmJW5C8op+fvrzyBgerUxM5SIaGS09Ea5a5Zg0cU2zI5FQz3QnOCLa2b6Hu8Z6y/5crjz/qog2VT1qUFu5uaOiJc08vfSSLQvpYqz7/x1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794684; c=relaxed/simple;
	bh=+nFLsCufZiehL/eoxteKF41dGYjzTzQkmxtyml5HKb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGVEAU0SxLYTSf3SloktXJzcOh09NlhJlTbGQ7ntwL0NvQ5D/IMYeKjNuf3fao3S8vLaDpl+u4pzTxICZLsBT7j8YlzL9Fr3U5q++P0RcoV2lGD0+eqTw4VPaxW7ZhZsENEeiakKar1RzzJZ//fZP9/HjWgH4PkOh15R6NZhUiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqX9TkQo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqX9TkQo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so6166055e9.2;
        Fri, 16 Aug 2024 00:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723794680; x=1724399480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNY+wb1THjo+CnMw7VM5lVjKwdkOwb5ze/davWuQ93Q=;
        b=mqX9TkQo5uqLiCzc/AAi7ERNOOvoDennd3sRdBlQ0wH5SlC4YdbPT0HqnoLO8EgS+2
         kOZ7ugNmGujaHIPPUj4J8WvJyTfHSwI/stTvjB9gqIui2qBEJh1aSWFBnwqH315gVsHz
         2DyS3RGFFUcnDJcKHE1WfpV/xWg+vDl7eHqM1HUrDCfWONZizijiX1QitA9O7CS/A0A4
         dQWS7uLhitHTP+0Y+qgAiTUQl4PIQ9ZcyJAQB/NjL3voa6j3wLZzZB0SAEjN7ZWdZUC9
         3v+t90zKvpNc9avBQXuIwqGho806xiVjh3wjQYAvOpeuW2jAXHtcqHcZ9WNwjGWFUZVw
         EFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794680; x=1724399480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNY+wb1THjo+CnMw7VM5lVjKwdkOwb5ze/davWuQ93Q=;
        b=UhxpI7/Cg13xWaKq9wPDTAL4xot/6WHIDnhUE5z6zTfYDJBX0wWa9JKDqORN5ScrdM
         0epvZ4RnQU4IWWwzIs0KIR2kg2PlvrBKK42GGxZB1o0rUGYVZA1jzAHneZAYPxA1Z/qM
         JdAYP2EvEOfXaiHAhhU+V3nnUGGJX8oJRb5aex1ouZFaO5oT3Z2fv2iVi/hwEUIzdVME
         Qz1ie0zpQlbEIHyxhcU36koKouA8E8VNSX445+gWxwc3ZRugddOR5U6Z5RzHRmVPs30z
         GDy2foYxjjljqNxFmeo9UUTaNyyFQ4M0Vne55Q9/PtpsRjUsYu22l8w27DEsZ6oOCMkv
         uiqA==
X-Forwarded-Encrypted: i=1; AJvYcCXHy4naC9uoGj8Ecc4LaEg1LU2ELaNCMPp0AdJLeY0/R6Zl2mt61iXZIkIF/VqSpu3XzeWxMqrDY79KF61nki2FhrUqF+fiNXW5fQmk/LCPxcwxSk/V3LHzDV3zKtiHbRfFWcegD0O8dAUvaXhHfs78gN6yAMBqDTo4yofBQwogNsorcPNP3prK0CK3fg==
X-Gm-Message-State: AOJu0YxVJ9SXg6KOco53X6S5a8vLI8cVOhdEnJYeP/0rLfW5rcY0P0IC
	IOx1v4tN/gKOJhH8o8dXZ3Lg8n0n1MBcQgY5ODnimq5vLeFPmY6j
X-Google-Smtp-Source: AGHT+IHoMO3uR084/TiqjhUtxamfnpPtywMOr7j0FvJycWCXr+USVcWGJpeWl2Dc8mghKV2E22gUHA==
X-Received: by 2002:a5d:634b:0:b0:367:f281:260e with SMTP id ffacd0b85a97d-3719431740dmr985335f8f.3.1723794680334;
        Fri, 16 Aug 2024 00:51:20 -0700 (PDT)
Received: from tablet.my.domain ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3026201f8f.52.2024.08.16.00.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:51:20 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 16 Aug 2024 09:51:00 +0200
Subject: [PATCH RESEND v2 3/6] ARM: dts: samsung: exynos4212-tab3: Fix
 headset mic, add jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-midas-audio-tab3-v2-3-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=+nFLsCufZiehL/eoxteKF41dGYjzTzQkmxtyml5HKb4=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmvwTnD8mC1+GqmOFwbcqhYHG1kNpEk6YJMfvpd
 XNKhd2qpnWJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZr8E5wAKCRCzu/ihE6BR
 aMq6EACX5TK44WyC4yotUx8Uk6fAbxLrKb3R3+UVLasScimI1hY0ykcN+GR5rdVLF3MVfpsug+3
 QogmFc3/HFpZAkMa/OJlzaYqeSWzFlkJv4n/3o1yzPAuYNqy7f+uwFvZw9DTD6+psS0thYtca/N
 eSDHnPTgof6myPwVVVIkc5mzAgQRBiRewu6XES3WHo0YxBBM/HQ1VZPYTAFtTb76xzbLK0GQjK0
 IdSvj581xNebmEN6sIEWMvWi4O6hWhlvadWbbXA0CfFlZbnpdFNV5P0OCi3TOsyfc7i4UHQYtUY
 qyY8DruZbh4eTzhOeHWRT75YAaQZYUfLWxVFSyXvFDVP3iUNzug2tAZn2iWbzaQlNyVdc6d3yqe
 ImdmCYARXk7Uo6NfolCttxIgfIQ4hXnOJJpXQbE4T2Z5sfbbth9i/3mr3u6zY8DS2Q07GUqka3/
 YqOMLsHf2offj3l5ePAacI0WLMJv5fCIoIWF49CGceRlCHm52W7PCzEIijyzhzJEYXUOLguOxXX
 wwuDoByetpGFhKJjls8Lx8TSWifNvJJMzhWEEybwcPkqAc5tHXqc95a0/v+Twxk2e1+Zb0VOCbv
 JeJfgN+BflWJasx3WBDf0znA6PDdXFS6687+nmgqOQsIMue7Ml11mBmNssu77CAiZIIzCa43pMQ
 2hxnr9dr6Bdt2KQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Set up headset mic bias regulator and add the necessary properties to
the samsung,midas-audio node to allow for headset jack detection.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Move headset-mic-bias-supply property next to other headset properties
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 9bc05961577d..bbafd4ece5f7 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -300,12 +300,31 @@ submic_bias_reg: voltage-regulator-5 {
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
 
+		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+		headset-mic-bias-supply = <&earmic_bias_reg>;
+		headset-detect-gpios = <&gpx0 4 GPIO_ACTIVE_LOW>;
+		headset-key-gpios = <&gpx3 6 GPIO_ACTIVE_LOW>;
+		samsung,headset-4pole-threshold-microvolt = <710 2000>;
+		samsung,headset-button-threshold-microvolt = <0 130 260>;
+		io-channel-names = "headset-detect";
+		io-channels = <&adc 0>;
+
 		audio-routing = "HP", "HPOUT1L",
 				"HP", "HPOUT1R",
 
@@ -351,6 +370,11 @@ wlan_pwrseq: sdhci3-pwrseq {
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
2.46.0

