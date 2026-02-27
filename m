Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341F33263F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173351; cv=none; b=aBpTL7bgLF/4Hu7pNQTpSh2UL86I9LxwsCllI9U8YUFHIbJdbGDfweRaTMp9DoWVjA5Hk1kqui4auWcnFjBCvWTZbLROgg/CdyZ+vVIa2euwrDvcDPNvNp2RWBgH5bUIl1FPfxSG8XwZ3uJA/BL7m0e/c79lWRyjWCpNVE5+Rxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173351; c=relaxed/simple;
	bh=gNOuJ460SFNkmJpVXZXHfL9zScGnWSGktr92RCyUGPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YuBNsze8voR4zUONOp3ddMzBfiBIPM4vg0vKM2xnDbBqKp2a3ckQobgysSALM3lSX6+nd6+yUS/Beu+llG2r6ABKbxMskMbKR85mE+qepzpNaWQIwe0qefuDKGuvpk960p32Mo+MEhulBJrQhW46Sl0Rtg97BrnsvASZBJnzX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWWaMz83; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWWaMz83"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9360037cdfso216303566b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 22:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772173348; x=1772778148; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5LPcgnHDezYmAmQJ8ddEK0GxF+9IPAjtDeRxnNjo3E=;
        b=fWWaMz83DlUm5pfyKyq1xA2ikGyDoF8m8uIzut7P7bzurlEOvo0EbCqCrssLTFWXIx
         f4a4yurlPeXhCu5jm1tOCtgaJZH6AJ4kdsuhCO7jXnP1Np2Ccs+uumdis5BoGo1N1hB1
         2aBFRz7U/NPbms6t9D5K8E1W4/FK13UaPdNtlBk6F7EJ1p5GLIqW8hFVpHSqhgDpcRyi
         12MrXDiPHasT2arpa/Bta7yJXLOobM7Bi85vINrrH8D0cbt4167MYmOP/Grw1scb5yNl
         688jX7Vra3sVjtm4Pg77cq84fG/xAGyx9H8eEUALDTXXcnxHeOb5qhkAai+j2e3mbJ3X
         hoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173348; x=1772778148;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5LPcgnHDezYmAmQJ8ddEK0GxF+9IPAjtDeRxnNjo3E=;
        b=FYznS4Z3GXRBMzNnu072lX0dd6nzTcCpGiBiy+bHMGdYPdKbhuaAqKVPZ3notMKH2U
         8IHIy8OKnan70WlV14MaHy92/wS+l+6TO3ZFbWtUBTICbvlusHiG3Q07TnRiRBxI9elE
         6cSSJ9SOLD9Mkd1JrK2Ygj94PhtzW1OEUAr3SWv0AfLCtwK1ng/Z9ix1UGzb8exuYEss
         dk6gfybck3mO4N5nyKaCznBv3Xoif4ZEz8yILkornor2lYBZXwnENkSvgE3yOUNpJWzc
         s+Y0cIaA1pMbPkETP4jTNk7O+sXZkw603SWjUx/ECwjlt6YL7J9MlTjpxe+lt6L95pdX
         Syhw==
X-Forwarded-Encrypted: i=1; AJvYcCVDFz2DL2QY6NCpOJohKC71qN5Mrx34HFrJhywJL2SW2SKgm0R8YRbG4QfLjt2DqlPXGWBf2nau1Ux/Qjo97gZOxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv4PeYzXCmBdB/65WQ4oWeAHoevfvHFwEnMEp2y0dewuZX5/BM
	P8+BxjsjR+o0L7x5bwu67VdUhmgYi81B20MwYeUstWXG7IMlvdtZMf/ux0F37X4JGOk=
X-Gm-Gg: ATEYQzzmMaJU03vLaLT8ELtZvHU1VHkfl+XbRhnKbmirvXInQL6DwV6MtTq9SLd5g56
	9Tp7iVzlF6MGj6JS+aQeSUKOpB1twyCQq+BrPareoYVq5klJqZX9bX6vN5aIunlamxRZL2CXOCS
	KumUViRX6YbTAmXIWSEgnuOrVS2gEEfA2xX0vQik/bGFkn05A3/nIuLn/IX3BB5Zvhp5j2jGWgP
	7rTrJBOy0a1ZybwvIHL03loJKZmAyWYu3iwse4MBKveZi+OxgzHcOCQBP0HeQIb3zTZal/zWKMS
	dpc/uzgXvvKQuJrcmU/hD2Yf2zRVFs9HPzMiKMJRTU9RAn/XG++S/qhdrXBl9y4nVZ2JEAUiSeL
	Y2HKcJTe3+2Tvk2rzO9c4ve3jMa9djIVJmlz/Ye1t/1ETNcqvz6vJ5qsS8QDieKiRr87g0CxQBZ
	p/RkTb6UzC1RAOu6gLDmFnEUiZgfPtXwuEAxNMM2hHfjiMBS3hp/z+Vodu6+3aPFjm+ElUO1Me9
	UTFwgJGaeeESI739w==
X-Received: by 2002:a17:907:847:b0:b93:5ad2:c6b3 with SMTP id a640c23a62f3a-b9376365c9cmr103968666b.2.1772173348221;
        Thu, 26 Feb 2026 22:22:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm118432166b.44.2026.02.26.22.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:22:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Feb 2026 06:22:23 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add Maxin MAX77759
 fuel gauge
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-max77759-fg-dts-v1-1-16c5733e946c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB44oWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNz3dzECnNzc1NL3bR03ZSSYt0kQ6PUpBTTREuDJGMloK6CotS0zAq
 widGxtbUAi+pzGWEAAAA=
X-Change-ID: 20260227-max77759-fg-dts-b12ebd5a90b3
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, Amit Sunil Dhamne <amitsd@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
applications is used, which contains four functional blocks (at
distinct I2C addresses):
  * top (including GPIO & NVMEM)
  * charger
  * fuel gauge
  * TCPCi

This change adds the fuel gauge.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
For DT validation purposes, this patch depends on the binding updates
from https://lore.kernel.org/r/20260226-max77759-fg-v1-0-ff0a08a70a9f@linaro.org
They have been ACKed, but not merged yet.
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..c01fec7c867d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -225,6 +225,17 @@ usbc0_role_sw: endpoint {
 		};
 	};
 
+	fuel-gauge@36 {
+		compatible = "maxim,max77759-fg";
+		reg = <0x36>;
+
+		pinctrl-0 = <&if_pmic_fg_int>;
+		pinctrl-names = "default";
+		interrupts-extended = <&gpa9 3 IRQ_TYPE_LEVEL_LOW>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+
 	pmic@66 {
 		compatible = "maxim,max77759";
 		reg = <0x66>;
@@ -317,6 +328,13 @@ pmic_int: pmic-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
 	};
 
+	if_pmic_fg_int: if-pmic-fg-int-pins {
+		samsung,pins = "gpa9-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;

---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260227-max77759-fg-dts-b12ebd5a90b3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

