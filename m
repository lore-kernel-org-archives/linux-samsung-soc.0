Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812690;
	b=HWubxQJ8gzuBoddluxUBZMu6HqgPYXUATo1kKW5UDnOQ2EeGG8KkPPMplUqFayBfmZEW
	 A503aRaapaHwmB5/9g+pRnwnMf7w+XukUaY7mTKMl+DNb/ggSb+nz+9UGmpg0BAfzr89T
	 U2mrUWqMnyPMyxYWpPuFI5Q0IzuqBspe7EGxACJQBpVUIhHsHdEXz+lVEqWsy/V1WMK1e
	 QHggtdat1daaGDuQdGiTxKSEv2vXgDXYZPXLUoUS5+KGVrAAFIERl8vcXbOhYoNrn5xZP
	 8A3ydwF2z0akADnvGL4snUwqL7gx3b3OifYUIeRX09Gk8zVGadm9qh6XgMNkIILe4lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
	b=JMzZvbTuRfpgH/9pKlkGIGrEABwIEEDfWdQ4kdaQSXfIcRBAEOFEzYlwx8Asn6CrEsti
	 KoPIKyoARMjYr7zBpppiDB634inLLEXFNLug7hgbH5ISv7ZTc0VivU6XKE3JPY3KIMods
	 U59vL0t7w9+xKsG6zj6GWxNPCHTBCaahuIJ4gA5q8Gugij5koQAQQGfMhk9ruJHefL1wt
	 1oOAthk+c9g13QPIfYdqh0JN9btjOCe7HsMnGBRVS/uSzOq1HFTr7bVWYeK64gY3Vs9i/
	 aM1TwK3h4d4cFErUqIC9QN4E+CvCrC9xUwYEvIN/RNWSKeinJY5v3w0t3KK0BTSPFxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A71cIeR3;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D923606A31B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Nov 2026 17:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D923606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A71cIeR3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6039775e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2026 09:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793812687; x=1794417487; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
        b=A71cIeR3AARNC1XBZ/bBp1ZicrZksc7yqu6Ryaj/NLf79YbXXoFX7Z9JC6B8Oop1YG
         cuzMQtJqj2z70GJnOB0NmhqzMYIpHSFuO93N4FXB5WTUsfK45VNB10QGVTm++r2D5X9G
         E0XhphC1qgdaQtvfFq883+BWD+jWIE0Jqq1CWKDeGS7TVXDqU2yref+D2hsuE1W4koTi
         yYuoQD+VgVk0He7b/dMRDhA9BQJQ5fcxAmGooiV/YefeufX5JvF70sGjpI+QKIKlmD/x
         LzY9g9iPw1dqD7qe325U6QVeTcnp+JkzbuPtYoHozLZKi3VVQIC8PfUZGMtQZg7Rsfgo
         Bl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812687; x=1794417487;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
        b=Pgnd4LNSu18aaRydzBRUv3RBH16c4y3tDCrDhYY4q0RQCkgYe3DHQid9rNqDEhISPP
         eHynO6s7O4/9yjQQc5xtyTVZKp9VmZQxy9275kDl4iIAuP+VSSwYZgTvxaFj/q7pspef
         FeejRRYMfjjAU2KrlleCFYsI+77Vdwr9f+Ergln/AAQ+8qbEHGlXXdsad2AZ/MsRf8fk
         X7uvh2a3IfnzR53wCadM4NMU6r/Ootwe87naOZE4eiffDjConcJ5EJQzWvpUdiReTJ6X
         4L2zI1OFe/8VRwNNzS80cur5CSX9rKbbZ1fieFZloFiZ2P/Ia8XyoJnguydwjEittcYJ
         eTmA==
X-Forwarded-Encrypted: i=1; AKwUvBzxYMEPWF8+RUFDTDftPHK285Yb/ZtOw19HtaraYG6+EDP4333OHn60MTDivIK1F7Sx+wptqtoSxaKBFBx4+uLZMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cjivDgtO034JxUfviaw4NyShIoW8SztWZS6dM9khEwV2MwIWP
	D6a1Motz26e2BYaxrZFLGoHTh5qdR6hB0K9ZwQ2hnKQTdpiGvOqBOkDB6VCkiu7NfkQ=
X-Gm-Gg: AYBFou3Nw3cvt8qYpiHdEksA0SumHwfYpZYgxAvOTsr1A2+iKfEyhS5uMtDplnC7/6k
	vxCzFW3b4HouEtGlOeaJEUJO8IIFcBidGUDiIA1PzIfp6bkmC0IyjQeJH7i5IBLcnEO5vbaaZXg
	sVE+rnuPj+lBLaJ3A2PtRuJy+G5ql21LtN1rDSis6ki7eOYfywN2MH0gaaE4ZN+ZcTGX2JJpQ18
	ZhEJiMUymqqKOsFQjfBTuETMtpIUuhUO0c7rc/vee7U7Q3Vb97x9I7LcAiSpWvTPoVHCslcjo/E
	yNESlCx97+HhyG/bkjSm2fe1JOlg9XJIHjOpPsmOcTN3wwTK1nSrE73xrBcBjTwNLH/6TvrxL7k
	PWYwsfbR2feyGb+FPYm34PVCkxB/Oe/4KLLJcvt9nBPyPUbUD94wKFyt5ej7bWg0sJfTWOMCb49
	YVwF37GNxIX3q+sCcwhucV1r+l77GKLH5H6QRkua44F9EY/7cfjApr+0PKcxXyqWhdDoN9cMBu5
	elUdabUFqHt0fP71CtpEteJGBvQCG0P+WaD0VD2jslfb0kjkp1a6+S7UBVCbQrd1e66U7FmTB7J
	HDALuWbW/ZcHqHAv7U8W/aCzSIF3yQnPyyjEwyVF3IZBW2+wau37Ef2zxQUjFxiXEhAKAlUHEXn
	+K92rws5JUA==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr373130175e9.29.1793812687472;
        Wed, 04 Nov 2026 09:18:07 -0800 (PST)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm99030535e9.5.2026.11.04.09.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:18:06 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 04 Nov 2026 17:17:58 +0000
Subject: [PATCH v9] arm64: dts: exynos: gs101: Add thermal management unit
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-acpm-tmu-dts-v9-1-e5c53cd8b440@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMVo62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3cTkglzdktxS3ZSSYt201OREi9SkFAtTwxQloJaCotS0zAqwcdG
 xtbUAfAtwa14AAAA=
X-Change-ID: 20261104-acpm-tmu-dts-feca8ebd851d
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793812686; l=8231;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FzMgyf0GkXAyHz8KN3lxfqbJvyM58XZDMZmsVFVF56M=;
 b=VcLAybzUpRdt0QacvThY4kiJAnifS9EwqcYep0QB5ESA/2J7Rlxdlz45MZVYRS2cA2JubWltF
 cvCADLbjES+ChWqPWNh7RaCINiQSKBd1jYJmS8Hh2Qrrd2hE2vlSM92
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the TMU node and thermal zones for the little, mid and big CPU
clusters, and make the CPUs cooling devices.

Trips are ordered by temperature rather than by name, as the
power_allocator governor relies on the order of the passive trips.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Hi,

Add the device tree description of the Thermal Management Unit (TMU)
on the Google GS101 SoC.

The GS101 TMU bindings and driver have been merged in v7.4-rc1 through
the thermal tree. This patch is split off from v8 [1].

Changes since v8 [1]:
- dts: set polling-delay-passive to 250ms so thermal governors (step_wise,
  power_allocator) periodically evaluate and adjust CPU cooling states while a
  passive trip point is violated, place generic #thermal-sensor-cells before
  samsung,acpm-ipc (André), fix tab indentation in cpucl1-thermal
  cooling-maps, and use GPL-2.0-only SPDX identifier.
- dts: order thermal zones by name and place cooling-maps before trips to
  follow the DTS coding style, and keep trip points ordered by temperature
  as power_allocator selects its switch-on and maximum trips by passive
  trip order.
- defconfig: drop the patch. CONFIG_EXYNOS_ACPM_THERMAL defaults to
  ARCH_EXYNOS and is already built as a module in the arm64 defconfig
  via CONFIG_EXYNOS_ACPM_PROTOCOL=m, so savedefconfig removes the line.

[1] https://lore.kernel.org/linux-samsung-soc/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org/

Thanks,
ta
---
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi | 136 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi     |  18 +++
 2 files changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
new file mode 100644
index 000000000000..5ca8360ee97e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google GS101 TMU configurations device tree source
+ *
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		cpucl0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 2>;
+
+			cooling-maps {
+				map0 {
+					trip = <&little_mitigate>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				little_switch_on: little-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				little_mitigate: little-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				little_hot: little-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				little_critical: little-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 1>;
+
+			cooling-maps {
+				map0 {
+					trip = <&mid_mitigate>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				mid_switch_on: mid-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				mid_mitigate: mid-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mid_hot: mid-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mid_critical: mid-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 0>;
+
+			cooling-maps {
+				map0 {
+					trip = <&big_mitigate>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				big_switch_on: big-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				big_mitigate: big-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				big_hot: big-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				big_critical: big-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index b218ff50d228..395e4716f8fd 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -91,6 +91,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -103,6 +104,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -115,6 +117,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -127,6 +130,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -139,6 +143,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -151,6 +156,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -163,6 +169,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -175,6 +182,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -646,6 +654,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		tmu_top: thermal-sensor@100a0000 {
+			compatible = "google,gs101-tmu-top";
+			reg = <0x100a0000 0x800>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+			#thermal-sensor-cells = <1>;
+			samsung,acpm-ipc = <&acpm_ipc>;
+		};
+
 		trng: rng@10141400 {
 			compatible = "google,gs101-trng",
 				     "samsung,exynos850-trng";
@@ -1937,3 +1954,4 @@ timer {
 };
 
 #include "gs101-pinctrl.dtsi"
+#include "gs101-tmu.dtsi"

---
base-commit: 2c222a46655e0191e70ca92258ad3b3ead32787c
change-id: 20261104-acpm-tmu-dts-feca8ebd851d

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

