Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3319F137
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723053; cv=none; b=N+jd7/o8zZPA+QtItVCwsMPfgujlWGAcGcRek48mKJtfpHkJjJo06iVnN8CZSTp9x/xVkzqp8w5fwJ3crSyaUhSxU8jBkhHf01iie/QollrV8dti0PTQiFJ+ksPQgiCm8iQCRY8Vtl9V1Uu5EYLzD1+gwGkJ54r93oikHFKkcl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723053; c=relaxed/simple;
	bh=NGorGne5j2JezpHvosdEQzlEl9QvtWLxFrF0NCtw9pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=flA+qxm34M9t87AeN9Tp5asEnFZMJql0ZrGvn0/QTLhRKY5ox9GvaScCEzubO+oHL4BY1Xbh2/BNmN3qIl34AEcPLRfXk3KKGYvsPAQJyUdd7k+lcgAj5qc/wmJlFnRLT0/MkumFJB58r/nXt3LTcQwIc6hdxmUM0pxQoFzcy3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLGOPVKj; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLGOPVKj"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b885a18f620so849886166b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 03:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770723048; x=1771327848; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5jgSn0iShD50NXkXtsIFhCoJl3UocaN2X43X5IPKtc=;
        b=NLGOPVKjmWIMA61oQCSUyebLaGeyQ3nroiEYr0a2OorBupRr5Gekh05gu2e7TDoNz4
         swRh8PBWtHBXrzsd5pdjH5C2TJrQjz4lZ7h2NZOxZVOtaJOqJqQs27YFvemvlOeYlzgz
         +04Yc+5WVJ6PMkHQKqyGj6tAyRHo4mI9Wb9op3cvsFHCJVXkErcKmZxqcEnevvpMNI+r
         m3PMeIJKWeeXFkHWFoN67woIm4xjSdjIHvPkdNKsaGljaCaBCDKpVQDxHJXye1OCXqZH
         NhrVgTLSJPcg9zNIwDd7UQu3II/Ihwlrjq6fFqRW/lNvYdt/C7hnEx8wyR8r7E+ljxiR
         XDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723048; x=1771327848;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5jgSn0iShD50NXkXtsIFhCoJl3UocaN2X43X5IPKtc=;
        b=cPmxhudgWgZpYXipccu0TLVa/EDoUjRPVormIvrkta21Ksu2p0x8HpR9J+9Nxctbdj
         3516IIW8dSankYofq4CIMMIrcsAZijqoWyurKEd/PpOjBDyXHStCZTvOla8NjE/KLqi7
         bemYPnxI/X4oJAc9rhEs7GNl29wLDcWrFeuVlcXDJ8GzrSAGNnNCnK3zGjHYRu7ogU/T
         3b+w3PSHHHJ9a2EZRWHH52HX6lkLEUD5zx9EmTRKnBDtUzuynap3wBSZ4Fbn0vOLPcXU
         WJWdG+ZIfTd29+uEa52NJuGNulYveDOYu7WQddg3y7F0T8ZtxH84uMtuqU2O3karleUW
         LXlA==
X-Forwarded-Encrypted: i=1; AJvYcCWB5fXfDMwDsqk7X0GkF6sQkPbFxT/IoTeknoE4Dl/VRlJPHkNtiMOBCYaTxUikr0P6z6K+jVC00ERPESjUOODQTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoBZE5r9QlI/YB3K5yIUy4l5dONW0X3AGRcn7bjRooM+fYGwNd
	FTYtYH5l2zLaOKGRT25W8hvPqZWjaBi+Dty/i30BHXfXFtOWB5SdcKc2rAYETD47U1o=
X-Gm-Gg: AZuq6aKNp+5Zuittyn7IfnJGo3MGxlJgAupCFszl6WD77KDSyUxrsYrYItXIXwZN7JN
	z4QxUge68lRKGBXw6vOL03zcU9dqe76S/E3GexSgy1hGpIxLJho2L1BcTLrG2qQ3Ye63QUyw45E
	E8qglH2XGmlcXLxbE0Qb9pxQAftPICdqShv5DPEin3sOAphX9voTymPCfcea907Pmp7XpogzYvk
	4NPUSqBmYZvk2LJ+v7Q3i6xevXgee89nIuX+pKMJ6th3bdPbC5AMuV1Tg/WlD5k36J8+LVhp7vE
	Qe7Nv6LgZ0hJNJeqEO5xf9SnfbbdVmWQalN+8w+iGJ8Axxji4YEF5yG+vkQzwlL57kgfvltyccs
	F0dQHIsfRHnW5n/aglpDXGKVWtuRElGqyO7UpkywCBNZ9nqjl5bGSUoW+p1dzbzOp0vDPz1r4B8
	3INAbgOWszYmauehoct3iaKJPct7Q1qKx+UdYZ/gxk8beQfgpHncBc0TaePcFmFEZv6Q2nfyInA
	JEHu765V2wbQ4Efdw==
X-Received: by 2002:a17:907:9454:b0:b80:5ae7:5d94 with SMTP id a640c23a62f3a-b8f5438275cmr98464566b.7.1770723046858;
        Tue, 10 Feb 2026 03:30:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3bc1esm511361966b.63.2026.02.10.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:30:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 10 Feb 2026 11:30:43 +0000
Subject: [PATCH v2] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOIWi2kC/3WNyw6CMBBFf4V0bU2n4IuV/2FYFDstTZDiDBAM4
 d+tuHDl8tzknrMIRgrIoswWQTgFDrFLoHeZuDem8yiDTSy00gd1VLlk/eg9zJLQj60ZIrG0A0u
 Dpqgt5ta5i0jnntCFeRPfqi8TPsfkH35jEzgJXlt8gs+6dQDgb2cCCfKszEmhK3SNcG1DZyjuI
 3lRrev6BmI8z1/SAAAA
X-Change-ID: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Most rails are the same between Pixel 6 and Pro, with the following
differences:
    * only Pro has UWB
    * Pro uses l2m, not l14m, for TCXO
    * Pro uses bucka, not l31m, for NFC

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- add comments for board-specific and unused rails (Krzysztof)
- link simple-framebuffer to display regulators
- Link to v1: https://lore.kernel.org/r/20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42be1@linaro.org
---
Please note that this patch depends on the bindings updates for S2MPG1x
from
https://lore.kernel.org/all/20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org/
for validation to succeed. Almost all of them are in linux-next, but
patch 1 from that series is still to be applied.

I've left out conversion of placeholder regulators for now, because
some more testing is required for such changes.
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  22 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 510 ++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  18 +
 3 files changed, 549 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 8df42bedbc036b5e97f6238d64820370043ffef2..36721adcaa239da20d63173bdeab67f4381f3c91 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include "gs101-pixel-common.dtsi"
 
 / {
@@ -15,6 +16,27 @@ / {
 	compatible = "google,gs101-oriole", "google,gs101";
 };
 
+&acpm_ipc {
+	pmic-1 {
+		regulators {
+			ldo14m {
+				/* PLL */
+				regulator-name = "avdd18_tcxo";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TCXO_ON>;
+			};
+
+			ldo31m {
+				regulator-name = "nfc";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+		};
+	};
+};
+
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679439bd87b0630cf9416b05c9d4536..3a14610a6e69136f1b989cafea6a78668dab25a8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include <dt-bindings/usb/pd.h>
 #include "gs101-pinctrl.h"
 #include "gs101.dtsi"
@@ -28,6 +29,8 @@ chosen {
 		framebuffer0: framebuffer-0 {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
+			vci-supply = <&s2mpg10_ldo22m>;
+			vddi-supply = <&s2mpg11_bucka>;
 			/* format properties to be added by actual board */
 			status = "disabled";
 		};
@@ -101,7 +104,7 @@ cont_splash_mem: splash@fac00000 {
 };
 
 &acpm_ipc {
-	pmic {
+	pmic-1 {
 		compatible = "samsung,s2mpg10-pmic";
 		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
@@ -109,6 +112,22 @@ pmic {
 		system-power-controller;
 		wakeup-source;
 
+		vinl1m-supply = <&s2mpg11_buck3s>;
+		vinl2m-supply = <&s2mpg11_buck3s>;
+		vinl3m-supply = <&s2mpg10_buck8m>;
+		vinl4m-supply = <&s2mpg10_buck9m>;
+		vinl5m-supply = <&s2mpg10_buck9m>;
+		vinl6m-supply = <&s2mpg10_buck9m>;
+		vinl7m-supply = <&s2mpg11_buck6s>;
+		vinl8m-supply = <&s2mpg11_buck6s>;
+		vinl9m-supply = <&s2mpg11_buck7s>;
+		vinl10m-supply = <&s2mpg11_buck7s>;
+		vinl11m-supply = <&s2mpg11_buck7s>;
+		vinl12m-supply = <&s2mpg11_bucka>;
+		vinl13m-supply = <&s2mpg11_bucka>;
+		vinl14m-supply = <&s2mpg11_buckboost>;
+		vinl15m-supply = <&s2mpg11_buckboost>;
+
 		clocks {
 			compatible = "samsung,s2mpg10-clk";
 			#clock-cells = <1>;
@@ -117,6 +136,489 @@ clocks {
 		};
 
 		regulators {
+			buck1m {
+				regulator-name = "vdd_mif";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			buck2m {
+				regulator-name = "vdd_cpucl2";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL2_EN2>;
+			};
+
+			buck3m {
+				regulator-name = "vdd_cpucl1";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL1_EN2>;
+			};
+
+			buck4m {
+				regulator-name = "vdd_cpucl0";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN>;
+			};
+
+			buck5m {
+				regulator-name = "vdd_int";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			buck6m {
+				regulator-name = "vdd_cpucl2_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL2_EN2>;
+			};
+
+			buck7m {
+				/* GPU */
+				regulator-name = "vdd_int_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			s2mpg10_buck8m: buck8m {
+				regulator-name = "lldo2";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			s2mpg10_buck9m: buck9m {
+				regulator-name = "lldo3";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			buck10m {
+				regulator-name = "vdd_tpu";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TPU_EN>;
+			};
+
+			ldo1m {
+				/* ALIVE, AOC PLL */
+				regulator-name = "vdd_l1m_alive";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			ldo2m {
+				/* lots, DDR */
+				regulator-name = "vdd_l2m_alive";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+			};
+
+			ldo3m {
+				/* AVDD: MIPI CSI & DSI, PLL: CPUCL SHARED TPU UFS */
+				regulator-name = "ldo3m";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			ldo4m {
+				/* AVDD: MIPI CSI & DSI, UFS, OTP, TS_SUB, TS_TOP, XOTP */
+				regulator-name = "ldo4m";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			ldo5m {
+				/* VDD: ADD, AVDD: TCXO & TCXO_FAR */
+				regulator-name = "avdd075_tcxo";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TCXO_ON>;
+			};
+
+			ldo6m {
+				/* PLL CPUCL & MIFx, UFS clk, MIPI DSI */
+				regulator-name = "vdd_pll";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			ldo7m {
+				/* IO (HSI (USB)) */
+				regulator-name = "vdd_hsi";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <6250>;
+				/*
+				 * TODO: link to HSI power domain, without this,
+				 * Linux hangs during USB access.
+				 */
+				regulator-always-on;
+			};
+
+			ldo8m {
+				regulator-name = "vdd085_usb";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+			};
+
+			ldo9m {
+				regulator-name = "vdd18_usb";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+			};
+
+			ldo10m {
+				regulator-name = "vdd33_usb";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3350000>;
+				regulator-always-on;
+			};
+
+			ldo11m {
+				regulator-name = "vdd_cpucl1_m";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL1_EN2>;
+			};
+
+			ldo12m {
+				regulator-name = "vdd_cpucl0_m";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN>;
+			};
+
+			ldo13m {
+				regulator-name = "vdd_tpu_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TPU_EN>;
+			};
+
+			/* ldo14m is board specific */
+
+			ldo15m {
+				regulator-name = "vdd_slc_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			ldo16m {
+				regulator-name = "vdd085_pcie0";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo17m {
+				regulator-name = "vdd085_pcie1";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo18m {
+				regulator-name = "vdd18_pcie0";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo19m {
+				regulator-name = "vdd18_pcie1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo20m {
+				/* DMIC, memory power */
+				regulator-name = "vddq_aoc_pdm";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN2>;
+			};
+
+			ldo21m {
+				/* Dauntless  */
+				regulator-name = "vdd_dtls";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			s2mpg10_ldo22m: ldo22m {
+				/* display */
+				regulator-name = "vci_disp";
+				regulator-min-microvolt = <3025000>;
+				regulator-max-microvolt = <3025000>;
+			};
+
+			/* ldo23m & ldo24m are unused */
+
+			ldo25m {
+				/* touch */
+				regulator-name = "dvdd_tsp";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo26m {
+				/* touch */
+				regulator-name = "avdd_ts";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo27m {
+				/* under-display fingerprint scanner */
+				regulator-name = "avdd_udfps";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			/*
+			 *ldo28m .. ldo30m are unused, ldo31m is board specific
+			 */
+		};
+	};
+
+	pmic-2 {
+		compatible = "samsung,s2mpg11-pmic";
+		interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sub_pmic_int>;
+		wakeup-source;
+
+		vinl1s-supply = <&s2mpg10_buck8m>;
+		vinl2s-supply = <&s2mpg11_buck6s>;
+		vinl3s-supply = <&s2mpg11_buck7s>;
+		vinl4s-supply = <&s2mpg11_buck7s>;
+		vinl5s-supply = <&s2mpg11_buckboost>;
+		vinl6s-supply = <&s2mpg11_buckboost>;
+		vinbd-supply = <&s2mpg11_buckboost>;
+
+		regulators {
+			buck1s {
+				/* multimedia */
+				regulator-name = "vdd_cam";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_PWREN_MIF>;
+			};
+
+			buck2s {
+				regulator-name = "vdd_g3d";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_G3D_EN>;
+			};
+
+			s2mpg11_buck3s: buck3s {
+				regulator-name = "lldo1";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			buck4s {
+				/* DDR */
+				regulator-name = "vdd2h_mem";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			buck5s {
+				/* DDR */
+				regulator-name = "vddq_mem";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_PWREN_MIF>;
+			};
+
+			s2mpg11_buck6s: buck6s {
+				regulator-name = "lldo4";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			s2mpg11_buck7s: buck7s {
+				regulator-name = "mldo";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			buck8s {
+				regulator-name = "vdd_g3d_l2";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_G3D_EN>;
+			};
+
+			buck9s {
+				regulator-name = "vdd_aoc";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			buck10s {
+				/* DDR */
+				regulator-name = "vdd2l_mem";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			buckd {
+				regulator-name = "vcc_ufs";
+				regulator-min-microvolt = <2400000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+			};
+
+			s2mpg11_bucka: bucka {
+				/* lots, IO */
+				regulator-name = "bucka";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			s2mpg11_buckboost: buckboost {
+				regulator-name = "buckboost";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3600000>;
+			};
+
+			ldo1s {
+				regulator-name = "vdd_g3d_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_G3D_EN>;
+			};
+
+			ldo2s {
+				regulator-name = "vdd_aoc_ret";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			/* ldo3s & ldo5s are unused, ldo4s is board specific */
+
+			ldo6s {
+				/* sensors */
+				regulator-name = "vdd_prox";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo7s {
+				/* sensors */
+				regulator-name = "vdd_sensors";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo8s {
+				regulator-name = "vccq_ufs";
+				regulator-min-microvolt = <1130400>;
+				regulator-max-microvolt = <1281200>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+			};
+
+			ldo9s {
+				regulator-name = "vdd_gnss";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo10s {
+				regulator-name = "vdd_gnss_rf";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo11s {
+				regulator-name = "vdd_gnss_aux";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			/* ldo12s is unused */
+
+			ldo13s {
+				regulator-name = "vddq_mmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3350000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_LDO13S_EN>;
+			};
+
+			/* ldo14s is board specific, ldo15s is unused */
 		};
 	};
 };
@@ -317,6 +819,12 @@ pmic_int: pmic-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
 	};
 
+	sub_pmic_int: sub-pmic-int-pins {
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
index 1e7e6b34b8649bc700a745c579a0268f0f6a9524..a422542715f27c8ea7a624f749b6d92e1bcb3429 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -15,6 +15,24 @@ / {
 	compatible = "google,gs101-raven", "google,gs101";
 };
 
+&acpm_ipc {
+	pmic-2 {
+		regulators {
+			ldo4s {
+				regulator-name = "vdd2_uwb";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo14s {
+				regulator-name = "vdd3_uwb";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+		};
+	};
+};
+
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
 	status = "okay";

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

