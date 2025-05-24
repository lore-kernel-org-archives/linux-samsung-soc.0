Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C299A1A3155
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2025 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064102; cv=none; b=X773tcKDiEJ2I8N1ZAcrraY9zU9SpbwMA776wbkUqxmFD3zVHSms47dIWrExDu7yIlbHJH2RPa2BHfuBLVf7/diRz+xSQAP0nqeccJzvEsvEw7cvxt8eYBIfNS4fJFTannnyocXs56ZpESptj6c51qnVsxDZn3ufhvVIdFSm7yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064102; c=relaxed/simple;
	bh=CxJGVYe9gQWEypwBZmgwMYlPMVvbtIIqNvj32ACzzR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRdQDcusiiXAfiNLEcXnwVxzqW6fuy3NuW/4pTsFjpwsVHtAGKmizf1/q5uWU5knD4s/SCjduqRI7OnbY2Y/zmHCi15DLIOENOFGW7kerR/9F8KvpkJYr3vHUdZ0JpSG+DtdZ6VY63q2OE3TzTQ9jYh56OMYelGrWD5/aYw7fs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzTJ7w7J; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzTJ7w7J"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb5ec407b1so74855066b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064099; x=1748668899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9Vj2sz8u3fgQAY0zH4yjJJsJuXYHYmr/5RzLXpeQpg=;
        b=KzTJ7w7JRU3uBYTnn09a70sQrd+t2FrMKTBGh1Pk9fvJO4MP/n6rM0Ew0dfZLojAFG
         SbLax91wVaPUvRpU50mJEU0MUpKGXwRLyhUlfxO/hFXz+NmEb4jurvsQCx3nAuYMrMaB
         kFWJPl5ohPi3xG9wgKkOC0ia6cnll7XScCDw68S5bwMZ2RFogAOgaVu39mK3cuuKXokN
         Z2lIvUfL8XYH0/j+e3rXrKFSysz8Q5NrbUB/muR303vteLrvMzcfUe//8bf1MZcUP+fL
         ATN/MObBzyv8i0YuR77i1u39YZ4o86M8bV4ScJEQBqtva9kWCoCnRyJt/3jwpzyYZii1
         mVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064099; x=1748668899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9Vj2sz8u3fgQAY0zH4yjJJsJuXYHYmr/5RzLXpeQpg=;
        b=bFrSRM+fHVOzKWzzlI00gYg2D8U+x+EcXt44g6bHF2ZRmUKIF4VdqPxLeN4W1bBqH2
         bbSq6OfnfObiT1P6Lk5l6z/39J1msqzzmdybfeWkWK+apFVI/bodxhv6wqxV57AovEMO
         cYYk5FXI00ICGpzfgHJz6L5a7ZDD2zkEf5Tv3SsKqVCmMPWHxw7YMVq2h6n8T2Tgco2T
         LJXuCjKkHKvRE7N3IxYU5eVEUk3LSh9tRpijGUijwV2aovBAZYKdqlzGYpZll0vvSD3T
         Eb6T2fHntGtmQzzURqXOg4y1ySq1wpGisRK4XD7w/iIR09DXzhm1h1voZGZrGPZxprmw
         K+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqMjs/IXEEHeB8+AcWARg27D7B4fAAE79CTEjt2ikljmTGj84/E+JUuFqIujsQ9LeMyvCkWT15yvzZ11MvzV8uwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI4jDbHZZvoGkT9QjigWwbHfp/UomUirhBTMTfib9U2GC2JSLu
	y6kREuBw8ZzVluSiJkv4LXxMGHHQsKqFfgDShg6cfSzya+KtzWAP5b/n92Hn1EjBqn0=
X-Gm-Gg: ASbGncvmfMlG7cJz5U+Hpb1NvMxf3tifyDJQfVJFpLVVdedSfLaau7XlOyr9JMD6XAv
	GMwR6qjo0KhSCQEPIuqFy9JMonPyTWAn45uR3Fud2P7sfJSoCT+4B6YsQ2F4hEi9YZAlw/gyHNP
	fCyg3TqwmCrQxpbp2sxrMltYCGCuusoyfpdU2UUe8rxyTtyQkjXwtQgPEiQSqs5cLtm9YHy2n6r
	oU+QCXqOpeBODLHO/pvJZQoN62wPPQOW1ixSp0GBlTBO5jr3kOkyVRbp3wefyySQMLsktvkh76h
	lsyEbgt/otgVNOBYQVeuI6wsg7u+fu2g/yruu3twsI9qoMlWV0Or2T4S6l7+7EirkkgIv5e6vO4
	LxY9WOD+SxjLtuf3seSoz0XBugtKv/L64ogA=
X-Google-Smtp-Source: AGHT+IF8pgsRiLru+xzCs3/kYK9IFFjLgdgCKETe4qhqLvBb/0iNzUicN2Yb4j1NXVYdjuG8Y5CZ0A==
X-Received: by 2002:a17:907:d06:b0:ad2:2ef3:d487 with SMTP id a640c23a62f3a-ad85b329c74mr142108566b.58.1748064099139;
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:29 +0100
Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 PMIC
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
applications is used, which contains four functional blocks (at
distinct I2C addresses):
  * top (including GPIO & NVMEM)
  * charger
  * fuel gauge
  * TCPCi

This change adds the PMIC and the subnodes for the GPIO expander and
NVMEM, and defines the NVMEM layout.

The NVMEM layout is declared such that it matches downstream's
open-coded configuration [1].

Note:
The pinctrl nodes are kept sorted by the 'samsung,pins' property rather
than node name, as I think that makes it easier to look at and to add
new nodes unambiguously in the future. Its label is prefixed with 'if'
(for interface), because there are three PMICs in total in use on
Pixel 6 (Pro).

Link: https://android.googlesource.com/kernel/google-modules/bms/+/96e729a83817/max77759_maxq.c#67 [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- update commit message slightly
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index d6ddcc13f7b20c6dfbe92e86abafe965870d0c78..de5c8d236b705505c0745827c5c6b67d94ba6227 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -188,6 +188,60 @@ usbc0_role_sw: endpoint {
 			};
 		};
 	};
+
+	pmic@66 {
+		compatible = "maxim,max77759";
+		reg = <0x66>;
+
+		pinctrl-0 = <&if_pmic_int>;
+		pinctrl-names = "default";
+		interrupts-extended = <&gpa8 3 IRQ_TYPE_LEVEL_LOW>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		gpio {
+			compatible = "maxim,max77759-gpio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			/*
+			 * "Human-readable name [SIGNAL_LABEL]" where the
+			 * latter comes from the schematic
+			 */
+			gpio-line-names = "OTG boost [OTG_BOOST_EN]",
+					  "max20339 IRQ [MW_OVP_INT_L]";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		nvmem-0 {
+			compatible = "maxim,max77759-nvmem";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				reboot-mode@0 {
+					reg = <0x0 0x4>;
+				};
+
+				boot-reason@4 {
+					reg = <0x4 0x4>;
+				};
+
+				shutdown-user-flag@8 {
+					reg = <0x8 0x1>;
+				};
+
+				rsoc@a {
+					reg = <0xa 0x2>;
+				};
+			};
+		};
+	};
 };
 
 &pinctrl_far_alive {
@@ -211,6 +265,13 @@ typec_int: typec-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_UP>;
 		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
 	};
+
+	if_pmic_int: if-pmic-int-pins {
+		samsung,pins = "gpa8-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
 };
 
 &pinctrl_gpio_alive {

-- 
2.49.0.1151.ga128411c76-goog

