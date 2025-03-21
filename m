Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B13B1DDC1B;
	Fri, 21 Mar 2025 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568970; cv=none; b=R4XOdqfWCkxR9dVLfkRDt0omtvgGzfKI5Hq3m200p3Th8YeFpCffLkdfOxRzSKg++m3rTp8i86Wtn46U0D6+zHOYdjSkV1CFiuSy0CgVUFSMNxjpQlLoQR+q/QN0cZ0lkxCwuifm8WWEejzuc27yEHaO3oWeuJXEqr5qFsHLpAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568970; c=relaxed/simple;
	bh=2NzSua7pgJHb77XJ1UeKZQE1uCH4+QaDAlKRqASH+Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qe44rpS5DILlhewBEaND5rhjU2xqMEd3w3tjTO7gsaf6/msmp+oku3Qwvt4pFkvTEBrH0mUGB1a/aAdgGZAf+9urmW4Zkad7VUhE7rmdm05PaNPTgkx9mIZce6M/vR0wUWQx0zEeviP5yX3faHDOc9ArmyIV9lt39psP7GYs1Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM6gzgK6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM6gzgK6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3996af42857so2103715f8f.0;
        Fri, 21 Mar 2025 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568967; x=1743173767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9XfsEifKar5stXfmQoJSzAmpLJL98s8nZ3fbq9kr7c=;
        b=EM6gzgK6ZgOxB+NWF/n7wkmkisBNOcLbmqPrNNc4IDSDZWF5FjQqDEKGWvUKFNId/C
         B7MVDYS8LUeSXSVusxSp3JFXr6QYcdQdhgkpdEDoGVRIIjKauPhAmTzMxDddqy8NZnGY
         3ReIOAbArfdYJ+SWX7IhbVyTMNuZRbJT15WoJ212aMQT772bJFsokc+7Adb1bW4riJpt
         29/fvChQ3w2vseQNqeAOGQuoFhLh/fAWG/PsInTAFrf0Vs8yPt8omfigXuqLEIYJYTvQ
         ygO77w6gaCl4x+flojbouCq997ebGiryXVndRF+BI3SGb/gwpbXbkwxMvBHNx4MqASM3
         bF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568967; x=1743173767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9XfsEifKar5stXfmQoJSzAmpLJL98s8nZ3fbq9kr7c=;
        b=iLeHw62EkD/CDjQjs8vBgeJnpJnP3AvG7NPpjjs/X+9gCCRdGD/ZnbbKk5CRkFTfL4
         zkHo1UO6/OC+J5UJ6H+mhm3CSKgupohsWgFBgTosylzpLLyoggIxyLpMrkKmMldVLw25
         agK2H632bHpCxJLCrOHqjamB9xORg+LjijoZP022vQLo4KBdnkjKGTktK/kU9Gj/IZZF
         B5mW8lHB7LwRH8KM6NtgTnRWjUGCiJX/iOPyJ1uTUbbtIy4qppq8mW6h2vtX1Acesfu5
         euEqWwZOSpyyZWYrT6TCT+gD/sWG6gN/rVnw0sOh8Ns2luXghgJfdOFGbubime5aMzZq
         M46w==
X-Forwarded-Encrypted: i=1; AJvYcCW4u9/Zqq+nEbmoFIqhCdJLpgBcUGE8kip88RAkuFqrXSjBlEoxNH9bhrME21vVsha7auBNJZ0dazND@vger.kernel.org, AJvYcCWSskDQflzLhRiNNjIRv9VxIJcEvDOR85Tb5uwHV5hIpJniMrtpMIexWGF3sgMcefqIvXLs8qEMFjdSqUuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HIggTNlAQCJKnji5rJ78yFGhEeShq9bzclXoPyt7C/xNlo46
	+D0K79/AtSeG1qHh7rUQqmprRjuuIYXVeVXn+zkYoO7B1LbPdTA0
X-Gm-Gg: ASbGncuKJfZSD3Y6sovvjHP7XWXB/p6FpxQ6RoU9CVLDejofrZjp/SAVoEzPpZvap+M
	WkDurJnIXEZCtW6aNVLkkUOnwb/P/LYLhZFQChOkK0xN/4ZNkoNLl8y5xjAN5pLIj7Kh+r+0x0j
	M5goBCYwKbbHHSUXm3T5tD+2PnrKS0eq21/i1vfm9EUciVAJmzui2sCD9mAJ0AHdxsey+UY/3fa
	kvJyPcAN/Qp5HDHfoz03MHijzU6lkhoyhFDhORMYHhkUvWH7OBtVlPxsYc/56qOVOg6XsC/o1hw
	OuA9imjgWyaSekGzAiGkCJJ5J0lyQOG6REtuRGaWX/wuRsQRAA3fzZmiAMNb2L/zynZ8Fm10Hsl
	s4j6+Fbu33qoAunEVP/qv
X-Google-Smtp-Source: AGHT+IHuET5V68o+QXYjwl8wKg5TISG52U4TYyqRFDEKMfKNf80Uy59vHorwMKHda7N+AxAUg/J3qQ==
X-Received: by 2002:a05:6000:18a6:b0:391:386d:5971 with SMTP id ffacd0b85a97d-399795756c9mr7097733f8f.14.1742568966563;
        Fri, 21 Mar 2025 07:56:06 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Fri, 21 Mar 2025 16:55:55 +0200
Message-ID: <20250321145556.1436201-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
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
index 000000000..6d346fab6
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
+&usb32drd {
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

