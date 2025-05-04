Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEEF1DE2BF;
	Sun,  4 May 2025 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370774; cv=none; b=AAh170irJBmSwLXQzTp4zsvKscKT2oD7cG5cD4raS5Sl2IXkwCAslZTjkVAnAfVLa8Xs/VMc5qW7licjhqXod2pgCoPRbFsEkkG4Jwq6krPdSNdgibECqvMiJ0IO6/zKMVPi0fKBL+zoqM3U0/nBds1CyfysUXA7P3XNztCQX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370774; c=relaxed/simple;
	bh=+YvASwwzabqjyNMmn5qCn7JNVX+Osv3fO5NWiAxpO3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWSXWdVScx6D/Qynun9/pwHcGVYZnmQHSG5+gGGrOTF1KJDQoZeJxgBU1U6NqitjiSssn09B39hiG2yJJVqlQ+jJX3r8CB4CFwvwU84TwCHAIZPOH65ZrN7bnWpIoTKmNaTEpbaOppuquUSRlePRhaseeMKdr78DtBMWmRWk5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQNEurq7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQNEurq7"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2963dc379so517332566b.2;
        Sun, 04 May 2025 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370770; x=1746975570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ0COox7BnAFBRwedHFdLTwOiDM08dKu4aZNx8jIatU=;
        b=ZQNEurq76x3ZYg1KnGRLzEoI9LfMUoZNy7diOHRh29W0DNFaMCjeWfq1qhdHYqkXz0
         yWtjajSEs8eY65SXBsXyn99lT6RcNRrtWlvYad0wSac5n5k/7G7BC6JmhxMOISKHUxdc
         5qPDtUVU7FBvzotiCLXeJGRSbpm7aQLiV3NqB3IFJfyOe8Msk5Da3iQdYGTg8ywlKHro
         w3arUVfGmLHxYJd36yt8ztjQCb4jFGpLck/bQcs9af6dW4sQU3b5KiXXfOvpyqblhdnY
         n//sxBAP1fd1MTHeZ+k4SuY9uCpCkgazvWe8JLLDDLXocwD8+NvPPT6hF5t2nHO3TvVA
         PC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370770; x=1746975570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQ0COox7BnAFBRwedHFdLTwOiDM08dKu4aZNx8jIatU=;
        b=ZtGnLX5rt+Vz1TQ9Bm/W1kmaXZs0qtpaya0WwUQ7to2XwghF/V6ghqC8RMT+3YNUEI
         UiqiSGW4p/KpgT/qRwb61BzrZYgYL4DHDUGiO7bqQ+QvrPL0OKV7qnXoEL2oopwc5ghv
         gIpMLrL5ZsRXX8zDKZbXVht/MV6jGIe8Y1WCSMFpyUtKD+iCmdhRgFDY4NR2RovQ9vs+
         Ai1glR9bwp1DFkCGVYruDZL/yU6T9Oa5h3/v9dFYT8V9wT3Mdyw8S4obd9MvlUIcQNQu
         CTaltLM1WocNBX0GkuyvNFNqbUPdd/4HAbYPbyVbEqt73kRdIifYIFYRZ5oJU8nMEhvB
         xjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkDt5EZX5nf8S2vhW2vfVxyx61Wu5k1bwGhNLXk5A+RoXxsDGX2V+ACCHL7Ob8g+yBwAUTrznefc2i@vger.kernel.org, AJvYcCWrvvZf7tWORTbGov6keGSJ1gdVquhuGL/sHAgGpVZ+CdEtyE4IlNEZ+ScmXCNlFmcXH5qjTOROzQs3Hioq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZpZVz0Tq3idSSrWq48dXb9qVzZsyivbuEwva/2mW1rYuJ/jyv
	pU9za9lk6HB8/1a8b1jzrDtC2WlTzM9+fomdfS+vp5JWmzwDii0+
X-Gm-Gg: ASbGnctm0j+t6k4WEzMq1t5KxO5Z8ChND9gL/U0fFKfWtUV7gOzTJLRO5rOl7NysGJi
	w+EjTK0qdsCWZ3oUjsY4qoOjpUF5d8xhz+a8xDO6kwNCm0tWksuS1A1E50EsJswok1qLP4d+uSE
	zJW7lWFHn+oVuXH7egwF6cRT/VEiGzO19HOqz733YIdJg4u+JaxmlARwp0qcKvXNAwaWT7PgqoM
	Ml6aMVMFizd6Gllk7f4zXvUAgDrTVE8KjYkEHJtOQjNdfxUKGWEVCoHvTi97QfXvqql4/45iRDv
	Q1I6SPVWP4w491wU93QaN3F8vKBqldE4mxdAcT3bz0GVpX3CvyXUDLZ+o8N94deu+AFo3V2rLzo
	ObmADIz2k/8rArwk7
X-Google-Smtp-Source: AGHT+IFWBUo43QQz0YCvDTeSSoY+npdJ6E8Fufvyzx8tt4gl4NKeZxY8ZiHxTcVzaE4FiZxzfTF6oA==
X-Received: by 2002:a17:907:3f91:b0:acb:b5a4:ba35 with SMTP id a640c23a62f3a-ad1a48bc3c9mr415960666b.2.1746370770089;
        Sun, 04 May 2025 07:59:30 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:29 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun,  4 May 2025 17:59:06 +0300
Message-ID: <20250504145907.1728721-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
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
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 169 ++++++++++++++++++
 2 files changed, 170 insertions(+)
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
index 000000000..0e348c5cf
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -0,0 +1,169 @@
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
+/*
+ * cpu2 and cpu3 fail to come up consistently, which leads to a hang later
+ * in the boot process. Disable them until the issue is figured out.
+ */
+&cpu2 {
+	status = "fail";
+};
+
+&cpu3 {
+	status = "fail";
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

