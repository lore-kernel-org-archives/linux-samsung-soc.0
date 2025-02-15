Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E451D5151;
	Sat, 15 Feb 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624714; cv=none; b=Eu2k/9jjrNhyfM6NY2aF8Rm1CvmCQn2NO9t0w/4cqBIvABakgImBsa5ovLkQsqZXZu+xOgVhxAx8ONPnbwWC+qhxZ9zeWW9gm2jBoYNYg5dCjKQuUTEK1vX41inSb3KMmrDwns8xBXoOLoOqkXuFL+kqarWAn9azpzwDFaxrwzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624714; c=relaxed/simple;
	bh=Z/0spWnws3BEuFlcbdMcSODDRhGNrfPXyzHu5exQhto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbXafZjgHNPvvKayZijZqqKOnbIEKatcUZjvoiHlq/rVrgbN+wjCzaxgiElxZwx8HKixorBLmh8FBuAFQ33j78tjZRvUWJpy+ptrhKvnOYWLqIh+OTwlqj4zqVE9rUAG3lF0BGhjfeslIC3YDhrZz/yUlzFd3jnjYYmw6oo+cMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl/1x7b5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl/1x7b5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4395dddb07dso30909585e9.2;
        Sat, 15 Feb 2025 05:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624711; x=1740229511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+ZWEwseGHWff/rdHEerKDPxaC6ZLWGEKuNbMgNyfns=;
        b=cl/1x7b5Ko5j1lOjIC7t4Z4JMtF3pJfkKShm7W+Ib6XCHFpijAKrNt1+tovBIZ3TRt
         01AQcavo9K8QBjqoA8DPUYoSljJA6V/9jiggYh22EB7kcOguiyKpXbg4rbbe+8D2aOQ4
         9H9TCFtNUt/EdQPfZ0wjotiADb0u/Z8+wsX+KNfV8zO89rM6uzOtw99k1kdY/Mjz6fLK
         bHRi5MXQRmUGrtOFH1jGDXX58bw8U8gOuy/fIsKiuvhYTg3zvBT2liJbtlvOaaiLGEcU
         Xd8sqJFtHHm61dnLGTExPlvQrF/KjW9e/O+pMM7l4vKxHKXkXbpE9mdh0idlx3Yk/Zw1
         D0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624711; x=1740229511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+ZWEwseGHWff/rdHEerKDPxaC6ZLWGEKuNbMgNyfns=;
        b=UcRcRGOzAkRbVF/7XSMM0zk9eLFlTOrWD7ZT2Uj1/ZBYRVKhqVvwfNFpkZXvMB9BEu
         sdtVGZAS9znUmwIo8ypodADekHIQb0mw2KTSy3gBvyWDLNrT8oiyG0rWKPoBECRltrrs
         pOs2vrPk1per/8J5tpY/5ASuisUt/8WlY42FE5uRZMy1cU+f4nmQr/WtRsVlicJ2/i70
         RUGSWzqmzyNf6d10ySaFjpVt3nvTI1/gDZXbdrnad+GuuMfVTRXu2D4Htg7nrzrapJWA
         9cOGicFMOXjIACvD1+6rssn05u4FVOpNkyAIG2A3oDvLJVEv2LbszXdhS0Ve6rl496PX
         dzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVliU+iXyTGMsxE/5mIE1vtg8YjjuozQ3v+Lt+ocLmBODUPqcqa1KGiftDpIwPY3VwNVSKgN7BC4/b5DT6u@vger.kernel.org, AJvYcCXCseeN4EAViaxBBF9won8e5dGH6xtK1V4rLTxr6SmSj+UmsITzR9MJiy2M3I1yIgqW/SJAcjkK8Ial@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIFIVymM4sPr0BQ6E5apwYdhhHYfyh7WVN8tWL5TV0a3QaXBN
	pv6vhQplLxi1HtxWyraAH4eDHdtJXZmV/1iihil7Pp/ygTWbQMFVvW184w==
X-Gm-Gg: ASbGncsCte3zR4lV6/6sjLMM1yiLogqBYHeuLwKiYN4VzWfCgO50ZFUUl0uq1mGwsbS
	qkZLpKlstfz84P9Xtji9Lt9bA8pM4H2dIeIjXph96ZVpdzA5HyTzAjHLuFW6rNNrGfMqA1kb7+M
	kvoJ8xefxGQ3hSpuQ3QDlT5XTnjUZUfB39ediDIdGh2JeBKBgWaaNa9ipHQsN/XOqdaZx44tjcF
	Xxy5I+J/UQ0TcoAKHe5toJPAozaTNagVrpLbp2SOTII3TMfX02zKLjm7fFBalfzbGzFJGx5hDcv
	dKVRZO4VjuoFE3BKJojgKLDn+5/EVFH/yV2ellvVZbOSfFWzJuVeDThSUIdtk4xVTZE=
X-Google-Smtp-Source: AGHT+IGbnUcOwybP3VJYcAbYRQ1V03EpL/4uIL2y4X7XRbXmjiYxSkt/oPRGBZ7+y8O4Sa4/uhHofg==
X-Received: by 2002:a5d:6d8c:0:b0:38f:394f:d81 with SMTP id ffacd0b85a97d-38f394f9c67mr879423f8f.2.1739624711183;
        Sat, 15 Feb 2025 05:05:11 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm7091418f8f.1.2025.02.15.05.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:05:10 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sat, 15 Feb 2025 15:05:00 +0200
Message-ID: <20250215130500.170738-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
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
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 178 ++++++++++++++++++
 2 files changed, 179 insertions(+)
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
index 000000000..c0e48f672
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -0,0 +1,178 @@
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
+			reg = <0 0xf6200000 0 (1080 * 2340 * 4)>;
+			no-map;
+		};
+
+		debug_kinfo_reserved: debug-kinfo-reserved@fcfff000 {
+			reg = <0 0xfcfff000 0 0x1000>;
+			no-map;
+		};
+
+		log_itmon: log-itmon@fffe0000 {
+			reg = <0 0xfffe0000 0 0x20000>;
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
+&usb_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	maximum-speed = "high-speed";
+};
+
+&usb_con_phy {
+	/* TODO: Replace these once PMIC is implemented  */
+	vdd1p9-supply = <&reg_dummy>;
+	vdd3-supply = <&reg_dummy>;
+	status = "okay";
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

