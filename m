Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520FE1991B4;
	Thu, 25 Jul 2024 10:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904050; cv=none; b=FgbovF/ecOlnG4jk+mQAU8b2AdomaegcSREDloNv9UMVsBZNB0rIjebRrcIh9QC8HC2NJKmRsfkLDxD/QnqfEI/oIt34yVq2LCczSjPd5tgomwMQZ5GzvivZ++fYgFr3S8KMPv5TJKl3tpfu4SHjOXHpfbGOp/HVvftokeF5d7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904050; c=relaxed/simple;
	bh=GMcA/CSZ2AnnqzHK3pWs0min7yshm+f3JahQWfU+ihQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3qD/I9XPxCrAD9CJb+lDTrrKrimEaqxrNTzGEY/GMCDRX4CYGFwF9KW7TA0OPEJ4Wub2hy9Nt9L/myxtL/qDhVv2DMuweDDYbFwFacDO5vqGktJufCldOZquJCX2DvMBl7pJnXLRYrxa98rT5n0ETrY9TmVopTQRyRy0HPUjf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc24KfH+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc24KfH+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso39608266b.0;
        Thu, 25 Jul 2024 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721904046; x=1722508846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jgZAm73Hf/bhFqyp8PoWdCzqWnz2LzHMQrAjO6S6u8=;
        b=Hc24KfH+v0Xoj1Gnl9OipeVHrAycfeJHLF7paFZdfxdFVlD5rlLbAAC8sJilMnUAhH
         qTK2XvQdeZ0DR6O931G/OK+hS2OhtBBwTSR9PUYLhjzxw0C+Gcs9+foPuSf/IdB4/5UM
         OugCmxSoEpIYLzZjb6aZ/PRov3kGu7vQz8WRBsMj5cP7vt4KANTmnJsBYHENlqpETAet
         nLf/rXFYKIoGcmn5Gari6Z77n+XjCRxQN4jPtmbV9WmwjSpl1O9r/jWy1MK8QhiqzXNe
         bAWO80UKAi8hkUY0e3mKGg9F70smmoveDWZikzVSvXEGOnnpBRrcEiY5Usr7VN129Z39
         Jabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904046; x=1722508846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jgZAm73Hf/bhFqyp8PoWdCzqWnz2LzHMQrAjO6S6u8=;
        b=qJUDuK57mEuZgV0Xls47tZMuQ7AdxQ9eND8rf/5S7cDOZCY3k3aA5rW8Pilu6cEymm
         AOSBiVhcej8C5mGIKGnstgX5Zx5Cd4bGx5lbGCJS2y3efzgDgPJ5rR5D9dc3BmoP3Fx6
         Ty7Q1FMB8TxAGRXolFACQMI8+g02EqL7aQOmp99KTWBr2AUcmSv9Gw/eLAUo7H72L8BC
         Ng1Pmk5PTcTXrgzp/E3SAKR6LNyNKXa8ALO4a+3VKydvwCf/iKuu6a3+7162ELYC/HFZ
         msgdn+x1LEs79kOgtZy/41fjjk+TvS0dXn/NCfadP/pDRldoZPMWrCZ/BJawq03EnUOQ
         jWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtlAaESSgzqYsfUgHOUPLlpGJnJxXL+cZfDQ1ivoBc0xy8E3MNPPs/xwDm5+oN5lns6SHaMKJxjyM3okEav1leCdLJtFqGon43HbDjCO+fxJZxyc4E9zHXYbcd7KLBz6+bB8xJGqxVGb5uFdUEOm2JP7xB/q+6nsACVmZ31YhJKZsubCJhlKQzzligAw==
X-Gm-Message-State: AOJu0Yx/i1UQJNXKQymkwueHbbsmq5FI+cUpRu68zsnZdVtyNNgMF0dh
	7FJ6jyC35gvRsy5LKzH+UG/KJ4Q1PSSm8NdVCbJ/GzFe5Ni8bEqz
X-Google-Smtp-Source: AGHT+IGovJSsZSFuA3Rq17j+OMkIEqicFAzp2LhAj97sWOxPvJ5mqgOjmYbaykRF1W4HiOM0VjAsiA==
X-Received: by 2002:a17:907:318a:b0:a7a:a33e:47b5 with SMTP id a640c23a62f3a-a7acb9b7230mr120125566b.69.1721904046538;
        Thu, 25 Jul 2024 03:40:46 -0700 (PDT)
Received: from tablet.my.domain (83.25.114.69.ipv4.supernova.orange.pl. [83.25.114.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm58342066b.38.2024.07.25.03.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:40:46 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 25 Jul 2024 12:40:37 +0200
Subject: [PATCH v2 3/6] ARM: dts: samsung: exynos4212-tab3: Fix headset
 mic, add jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-midas-audio-tab3-v2-3-dbc055c27879@gmail.com>
References: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
In-Reply-To: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=GMcA/CSZ2AnnqzHK3pWs0min7yshm+f3JahQWfU+ihQ=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmoiuoa1y6zAZghDGX5n5/kjHDjOkdleE4d6VW9
 MNmqhpGxGmJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZqIrqAAKCRCzu/ihE6BR
 aOxRD/9hAoKjY6o689I2hWMx51UiaLiHANSV1D4QZtTyRJEgFD3qpVpxqD3AcUx/801XjwvsIXq
 00/9B/gR3i3SiSwK+hduFutC2wb0bdxodLGGcMWIfnNzjGFTN/KCuSe+sZoe25Rh/cFvsWNLWX1
 +gv4KezzrPiIDvI3R4AwXIHnwkZ+gpNxQQyMuJNP6wNjh8H1Hs9ew0778etASf2itDcj8eME2VQ
 jmHoDRs21JiN4YrihRB55REl8QlLqK3FqJ/LbtZmKFoW33QcUY7FPID08AGGV4Q+BIjmclQAw1E
 /S7tqFGiZ7gI3JGjEs3USUCZwzBtA8cRSMFq+H3pZU2W5IFagHV9q9nwWJCB9TDxIk9AKgNv8qx
 wBmMqnEgK+8I42k/KdjbIz0CU5QNzbVEb6szGD6UCKl0LzP6iKcVPMTUYVAI9q/itAEAaxwFNEj
 WC1fA7FWvqJJe5VJ2B1NHO+9kMS1LfwK1gAcXDjru8InSBWqEMuu8cyexm66GWpVrli3pVrwyfk
 5L/MZv0FT+fH3/8PuR6I0HhDS9X7WiZFJczmCV4vEwbu7DvIO1ejuqx08dZ0AsJZJVnZJmWaWJe
 G4dtFJAU2IJtZrYf7cMQdjr05HeZYeGlASY9BDVgD5NHn7MkrJaiRNCtFM9/86aHJCKPBhu7njI
 CyMvpywuh5Iiw2Q==
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
2.45.2

