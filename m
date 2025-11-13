Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0071F2CCC0
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040678; cv=none; b=Kbgmr8badQapJc322elFb+U4T5RRR4hHr6GwYaB52/8EdaHwkfRtxJhDP9iKpdMb2n7zvbOKidHJyXqx2CDpMIWyHEUdgETbJI1orOOPEQLrq+J0jW6xFgCyhobY9nfzOY7IR5yo5h0CMh/vNIedDxiytFHfYMJ9G6GQTab6qR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040678; c=relaxed/simple;
	bh=qCv1zxq5bcZAWOKyzmK4fjXJyOXUcLMhHF7+LsNLcXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BSJoBZja0ovhSK2EkI6qytnhDaYv9Y5qgPV0yI92qCz4+MuNl+Szt9RZCUr6zMihP3uEInuztD04twuHA2qdPbMCsO4g4yl//pw4zTtdnSXgGEm7U7m612i2mCKq9J7NbD5blSGHoKPHwXnlqfeAP/MCjKFuXYw6QHv0VI2oEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQ2z2tA5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQ2z2tA5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1215755a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 05:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763040674; x=1763645474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3Dqt47bT9tRJg8DFRDd8CZytQ/KWmH/+6ypW+kSsd8=;
        b=uQ2z2tA52yE6n9dNL+OawG1ixz9dixYtVPSGmajGvm9WZJu1Svsw8zuppI2McbYB/7
         HjaTEsySGLHDxLoU7UKijCbUyqVBd3B5qd5b+COYgMthbyU//jjymT2E0TTXbopkM8Ic
         kJFKmb09lUAYdtYcF8z5AqOuontS4jPwisD2ZS8dpgx/P9eiGvcIOrzu6ZKTlBGMktim
         KFp0Ab3rAFtLUpzPGhl+mnBUdwRQmnHRsX1dj+Mp6qoQjQ4OJIn2URJCzFXKEEiMTN9O
         gVtfkaPHdtOXo0+qW8NzIQh/YixGoKQPvKlXqA1/b36dztbvDIamDr3wBe3n4WnIl+hu
         2X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040674; x=1763645474;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3Dqt47bT9tRJg8DFRDd8CZytQ/KWmH/+6ypW+kSsd8=;
        b=I0X3rn28B3y32Bh3d+xibXoGgCvgag/wBnu+tM4q8FHX9yVK7ZEjThMC3z+JYk2EII
         FWOn7NWyxS3lTBi+r4s+UQyx3mzZhXm+P5X+H3WJF53fcUu7s/sfxUDTYEKFsszOOvj4
         rx3WOhTom1A/odefCmiezOFMw/pvQhJKEJSRKfVbF2E8PX1sfWq/yINcojJC8Q4y1UzM
         fQER84zfhDG302RyVdoxqK2Iqf4SCbfvDlzJ66cy2rs2E+7nf5zAMaMmdz2/QLijvzu2
         w7p77p+m4NvdZngvXe6sp0TB1sLBPXq8n7d+YYIKP3/iljbbEnH1fO85tuhjIk7XBIEw
         VZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCWFCaH2WkMhHTXgIMkowyLpn0VVIrVzhm3LmZ1MDjJXmH3qPTGzNnCI3ZYyq7czxiGUEJU7XO/4+ntd4evwspNrwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYcj6PrIAWQW0jF3Fde/nui11lurHZz/Y/aslhSHAgXREEY0W6
	bHYs8VGyIleitdi82mLa0alRNNAoyjOD1y4qJEaK1ZaU8BaLvuk7txjU5LKRlGTZ5tM=
X-Gm-Gg: ASbGncvPYA61gV96kBgKJPrerDykb8KltHJNZurUuO28EZTaVKs0cvxZWvb/dyow9dj
	Sgol5XY59qRlOAfRAzEjDUWvIOt+gYmt0Kk1Cb45eoJiACjVatg4M6aegOgFUoBqmBML6CFNknP
	FlqUbzKfn2A4thaWen4X8McTDZXub5ShbwdrOELwY48xy0H8zSdz36UvrLZD9hcjV+uNrXBurQg
	YoU5UMQlJw4vGzBU0P+HouE6c/TeiZHjOZge9SP6M5xBYrfCVHyYdPOvlzRFSGVbbmqcfTNMZor
	S1yG8ZazcNRn3KVOo5u7QE+LJp6in3E/ZUJ1kf+rEe8GvBM8E/I8jvmqycu+WOn6MerjC57WJx2
	mPfdVd5I+eSbIl6g9eqceqDefJGqZcjv3X8St0JZnXiqfI4citp2s5d4UPzae8vWcicBKk58AdA
	yzGT55DEVp6Im6A3AyBKVURO8zCo5gxg2J8k6PODCZpGdyV0OBoktutfVWPVkWOAVNGNM=
X-Google-Smtp-Source: AGHT+IGHxIo0Q+JtQIZs17biyUyimW3Lh/jOSGuiHHiwlpi/rTlUut6b9te1pq8EpoKb52ZnGoz/Zg==
X-Received: by 2002:a17:907:934c:b0:b73:4202:f108 with SMTP id a640c23a62f3a-b734202f8f8mr421331766b.11.1763040674147;
        Thu, 13 Nov 2025 05:31:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809fasm165197866b.45.2025.11.13.05.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:31:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 13 Nov 2025 13:31:10 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42be1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJ3dFWkC/33MywqDMBCF4VcJs+5AovZiXqW4GM3EBuotiSKI7
 95YF911+R843waBveMAWmzgeXHBDX0KdRHQvKhvGZ1JDZnMrvImcwxZN7ZqRc/t/KY4+IAmBiS
 mojacG2tLSOfRs3XrF35WZ3ue5uTHc/zxWvzD71So5pGXJdVWL8Vh1xQYm6HrXNSi5zXiASilJ
 FT7/gG85g8a0wAAAA==
X-Change-ID: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Douglas Anderson <dianders@chromium.org>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Most rails are the same between Pixel 6 and Pro, with the following
differences:
    * only Pro has UWB
    * Pro uses l2m, not l14m, for TCXO
    * Pro uses bucka, not l31m, for NFC

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Please note that this patch depends on the bindings updates for S2MPG1x
from
https://lore.kernel.org/all/20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org/

I've left out conversion of placeholder regulators for now, because
some more testing is required for such changes.

With this in change (and the corresponding driver updates), the most
noteable change is that the display is turned off at some point during
boot (since we don't have a display driver yet). To avoid that, one
could boot with regulator_ignore_unused or vci_disp (ldo22m) could be
marked as regulator-always-on. I've not done that to ensure power
consumption is reduced by default and the phone stays cool and the
battery charges using the default settings configured by the bootloader.
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  22 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 494 ++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  18 +
 3 files changed, 533 insertions(+), 1 deletion(-)

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
index 93892adaa679439bd87b0630cf9416b05c9d4536..f957e0abe9a0ea8a015334424a64b69b26d789de 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include <dt-bindings/usb/pd.h>
 #include "gs101-pinctrl.h"
 #include "gs101.dtsi"
@@ -101,7 +102,7 @@ cont_splash_mem: splash@fac00000 {
 };
 
 &acpm_ipc {
-	pmic {
+	pmic-1 {
 		compatible = "samsung,s2mpg10-pmic";
 		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
@@ -109,6 +110,22 @@ pmic {
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
@@ -117,6 +134,475 @@ clocks {
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
+			ldo22m {
+				/* display */
+				regulator-name = "vci_disp";
+				regulator-min-microvolt = <3025000>;
+				regulator-max-microvolt = <3025000>;
+			};
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
+			ldo13s {
+				regulator-name = "vddq_mmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3350000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_LDO13S_EN>;
+			};
 		};
 	};
 };
@@ -317,6 +803,12 @@ pmic_int: pmic-int-pins {
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
base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
change-id: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
prerequisite-change-id: 20250603-s2mpg1x-regulators-7a41c8399abf:v4
prerequisite-patch-id: 9d4a1e0afe6eb45dcd35a9537b7d5b4e35e801c3
prerequisite-patch-id: 928fd84e5f6207a2fd98dd8372a91df0776ecfde
prerequisite-patch-id: b87abb6b9a8fc104f0f752bca0e9347d17de72e0
prerequisite-patch-id: e053834e5bec411f5c512b63a3528e49aad11ee2
prerequisite-patch-id: 4fdd195c0b3fea537144ac8d82bb40a38cbde117
prerequisite-patch-id: cc716fef97d6c25c0589d7269b8f34e04ea96216
prerequisite-patch-id: 20ff503abaf2fcaef4328e1f8009ed3df242bad3
prerequisite-patch-id: a0d80e8f49401dd79a7e4dda2517e00228aa3087
prerequisite-patch-id: 2368af876ec7c643d9765d3fb1e9bc4991023a18
prerequisite-patch-id: b70d5648790458e72db82e26b180bbd7301469b3
prerequisite-patch-id: 92be1aa6f95b2a5795df84e11a602e97a41b2938
prerequisite-patch-id: 86625bb109da618cbb8aef07fa717257918077b8
prerequisite-patch-id: 2016c6cd5e0d51daddada37232e3b99c8f4ad77b
prerequisite-patch-id: d323362e84d3991bd949745579aec34897620321
prerequisite-patch-id: b1571de42ac7dcf0fe8ddb77650a656244ff751b
prerequisite-patch-id: 44ea2393bc4df716427cbac9b7f080a683ba1c0b
prerequisite-patch-id: c968c5b557897767bfc2629de79b1ede8ab48767
prerequisite-patch-id: 221800199a94e12e928dc9606c82b6eb33cffa3a
prerequisite-patch-id: c76d8055f620e0b5fa81101a31db08fd5a60e773
prerequisite-patch-id: be0027a934451be02b1c4653bac8b6bc2ae2bd85

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

