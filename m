Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A918206F38;
	Sun, 23 Feb 2025 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313854; cv=none; b=owxV+U8tDOP/l0nwB4B3N/7YKCWTJ7r6uMOP5DRN6W2NTzHGwrYirEUJxwmOgZ1nvEHVd515yJqMCxVEFGI3GH3+cs1Zl7GzzBlhLlgKRPPuT54YqkuGUvvqQn11N+okHmnc68txkuW8pkHNR14xxpKa2lEfjMkhUCB3nqvCSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313854; c=relaxed/simple;
	bh=7fZROFNjlqndA1HSkyLry4QfhTjgpm5+Akww+OZNpgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJ4ZEgGugwbEvc7Y7LQEuTr0wErIVoB1Z6TgbBAOV3dSLyU+VBNhldnYpqKM7wL22Jj5hebGnQRgGvs+bDPYHNW1R3qLpsdaEKCSO8p67SpPt58XSyWGcLMUsRDvrgPmbcLbMIkEZqHaKsATpBUdWuPSxJtZZDbk4RcIq2aknTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDIuXQnX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDIuXQnX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so33977735e9.1;
        Sun, 23 Feb 2025 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313850; x=1740918650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU9uqaoEFw0FWEDNXOGeXJkEIYyjDYrz5952fWijY14=;
        b=ZDIuXQnXnawLJZVRdGPnoKx7KYTzVDnXb7wJE+Q5/hCF3QetGFeUrZVgu0b9C2kz0R
         llRBJVy1WRD967JsZE9JYY2pXBHicBXR/Y6ogIbo42LjZOcfqEJ3mQZsrUcvtCVsXKdl
         51CBX+zB56NNzK9/NhrOfAwzDUgfjfhdMpYez0IvquRiNsl/Uqaigjy63npqMZbC2A+l
         BH9r+d89csH+YExZNJGANJmtQ8aGSWLJhiVEDCjqoyr+wGE8XfRN6Pxh4wOcFpJUhVeE
         ZmDJQSxi1BqWlcbBYAaOJ/fPM2m0Np29FncQAVnOspSgxIsqdw+QeZRdO6KRXlZwcv2N
         EtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313850; x=1740918650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU9uqaoEFw0FWEDNXOGeXJkEIYyjDYrz5952fWijY14=;
        b=RWe7W3S6vYt22NVTgxy2bSI/UH3z8Ni6QaUwnGY/RVk4i0dVuTRYlu4ow9eFnbRUTW
         3ji9jKPdkcQEbxMzGsT3FGCvTUK52Y0MXkvshkWUX/QrfHXw/Ql5I0Ca4mnrQ0mi0TIx
         +8x5oGr2x9C5vCeHEgmcBhz6YFMBWNtdz/r7XJl43LMfwsvnHcmqu+s0dRC5+PmkBSmt
         RQ+A0hQV2ZHLA39KyXVQ1uamQ5Uq8YbM7FkaFc2OU0VNVdcE2NrWuKIZ+5kI1TZpX6jt
         Y3TKfXgEfwqo2e0sv9X0nuFV4gyKLugjwvf4lZAv3E/+FZ79zVH50IFW3ZExpO8Doef1
         wgqw==
X-Forwarded-Encrypted: i=1; AJvYcCUbVdl20b6INfGco/Arhj9ANpgjH+8jcziNN0hrRntSQQKNlSN9plKcDTFA0o4rmm+hKkL8G7EQIXB3@vger.kernel.org, AJvYcCV1/XjtibWE3nWATMAZCzDVuDCFCXe4Ffh8er6x8CsLyMgjJBMEB+lYZ96aJ3dJJFp/xW0TTPIH8DE2UDzR@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCHa6OU6CqrgNwY3WsNyBYxmJQOuCjfE9o17Ry341j0d1WM69
	Q5Xgjv5qMEJ97oO69Ki6lqIEoWLqmU6GSCupwG3TjApeKl0aWMSm
X-Gm-Gg: ASbGncsz3crOLFccrmqvkzN4K1GRrq5RDxJY3FlMrGnqnH2nKouB7f4FPWc32XJeXr0
	jMP8e0+T1M1NUreqQssJHFL4vqCZpzWYfTwzfrtFOIp/YP3bOV3NUqMPb6ksagc0nMketqPMQdm
	ZrzB2LFQbtWLrgQIGMSII2bR91FNwRP3Z4TabNUQjwi1Bx+HrpZ+C8tgAIMJZq1ICnecJR5jdps
	kJQ5t4Mr6E5mkgdpVWLQws8zlYCLgmV7loOtNBeYboSQ7d4gb2Nrt4yKCnfDbhJLc7ZoWIE2Kjl
	sczzZC6Jwli8wwk/uclEXYMdQ12wRybn7K1B3aSaj6hfK6gO1w9ndbSDfBwaR7863+SQIE4wTLu
	1Hg==
X-Google-Smtp-Source: AGHT+IF5Ji5wEELPk8SVxp5aJnK9skC1tAl7cqnVlRnzYt1UM8YbLpaWh+L+VDDh6XzKGzSiA9maDQ==
X-Received: by 2002:a05:600c:1910:b0:439:98f6:8bc8 with SMTP id 5b1f17b1804b1-439aebcf61dmr70897935e9.26.1740313850484;
        Sun, 23 Feb 2025 04:30:50 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun, 23 Feb 2025 14:30:43 +0200
Message-ID: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

This device has an issue where cpu2 and cpu3 fail to come up
consistently, which leads to a hang later in the boot process. Disable
them until the problem is figured out.

This initial device tree configures simple-framebuffer, volume-up key and
usb.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 175 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index f6f4bc650..235b9def4 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -2,6 +2,7 @@
 subdir-y += google
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
+	exynos2200-g0s.dtb		\
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\
 	exynos7-espresso.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
new file mode 100644
index 000000000..06e5a34be
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S22+ (g0s/SM-S906B) device tree source
+ *
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos2200.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy S22+ (SM-S906B)";
+	compatible = "samsung,g0s", "samsung,exynos2200";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	/*
+	 * RTC clock (XrtcXTI); external, must be 32.768 kHz.
+	 *
+	 * TODO: Remove this once RTC clock is implemented properly as part of
+	 *       PMIC driver.
+	 */
+	rtcclk: clock-rtcclk {
+		compatible = "fixed-clock";
+		clock-output-names = "rtcclk";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	/*
+	 * cpu2 and cpu3 fail to come up consistently, which leads
+	 * to a hang later in the boot process.
+	 *
+	 * Disable them until the issue is figured out.
+	 */
+	cpus {
+		/delete-node/ cpu@200;
+		/delete-node/ cpu@300;
+
+		cpu-map {
+			cluster0 {
+				/delete-node/ core2;
+				/delete-node/ core3;
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_volup>;
+		pinctrl-names = "default";
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa3 0 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>,
+		      <0x8 0x80000000 0x1 0x7e000000>;
+	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: framebuffer@f6200000 {
+			reg = <0x0 0xf6200000 0x0 (1080 * 2340 * 4)>;
+			no-map;
+		};
+
+		debug_kinfo_reserved: debug-kinfo-reserved@fcfff000 {
+			reg = <0x0 0xfcfff000 0x0 0x1000>;
+			no-map;
+		};
+
+		log_itmon: log-itmon@fffe0000 {
+			reg = <0x0 0xfffe0000 0x0 0x20000>;
+			no-map;
+		};
+	};
+};
+
+&cmu_hsi0 {
+	clocks = <&xtcxo>,
+		 <&rtcclk>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_NOC>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_DPOSC>,
+		 <&cmu_top CLK_DOUT_CMU_HSI0_USB32DRD>;
+	clock-names = "oscclk", "rtcclk", "noc", "dpgtc", "dposc", "usb";
+};
+
+&ext_26m {
+	clock-frequency = <26000000>;
+};
+
+&ext_200m {
+	clock-frequency = <200000000>;
+};
+
+&mct_peris {
+	status = "okay";
+};
+
+&pinctrl_alive {
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+};
+
+&ppi_cluster0 {
+	affinity = <&cpu0 &cpu1>;
+};
+
+&usb {
+	/* TODO: Replace these once PMIC is implemented  */
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+	status = "okay";
+};
+
+&usb_con_phy {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	maximum-speed = "high-speed";
+};
+
+&usb_hsphy {
+	/* TODO: Replace these once PMIC is implemented  */
+	vdda12-supply = <&reg_dummy>;
+	vdd-supply = <&reg_dummy>;
+	status = "okay";
+};
+
+&xtcxo {
+	clock-frequency = <76800000>;
+};
-- 
2.43.0

