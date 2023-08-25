Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F887EE49B4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Aug 2023 21:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjHYVzA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Aug 2023 17:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjHYVyv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 17:54:51 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5D0EC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:54:48 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a850f07fadso981443b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693000488; x=1693605288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUB0c4DZYSd7UHceLzlYwxM/QQKvpF3crbJF9Mw+h+4=;
        b=Bp1JMR3nDBXAuSdiGS/TTvtwjpmApNJ5gBzyXM2ziSpIGezW9zX0vSjd/CBtlI83AP
         NvO/Z7swz7c4yTJZs2K143fw+1Odzrk9eGZBcKNfXz2ntov8ZvMj53M7MQdXKedie3Yj
         YD88TA4xGYzSaq7rJJC5gnAJG19881oUiNJRWnaV8Wf5xB6t8difUAGSeOiGrPyzQwyO
         GQOgvXB0BDB2eICErJqP1DmJMpr5XUxrzZtAFZYawNtsjM7uoa6QufH3cim71I7MX16h
         SDE2CsCsEirON5bZeUf2uJUJ4KKNqKJp6/cftpIq3T/weqXOUfySW5bT6f/+Uzy4LOPK
         Gt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000488; x=1693605288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUB0c4DZYSd7UHceLzlYwxM/QQKvpF3crbJF9Mw+h+4=;
        b=YJEWRCutWiGoUyy6L2QIiUBS/er66ndu8eG0CubRVj0rJgkx7HTSdVU6eYhA8Vw2Eb
         7zs57j1lQMM1rvhF+BuCw4QOXgSWdD4v0BKRQ82aWeTvQKvPiKV6zfzecjerDkcSRljH
         sbdRjfN3JmEw6k5+tRWd+uZLyhdgB+Zld5jQw7EhpExO/nJPC9atkCru35/2hk5bCs7X
         rtIsCrySPz7vi7U2eT0kSNrgXLaGadTbqtMlLTyEuJsm45ojbCWGRRn5xf6xkBkvunvQ
         tokaj81QKTEEwN8io2JvvU0oFOfBEk8ugFPpa97zyQUviYtWr1JkmTAp/L5LCVlMyeG7
         mJ1A==
X-Gm-Message-State: AOJu0YxkgxqHuhldBfZxjRhlm5ouFV6eI9cQeBafcOlQOGQiiVfyFz4u
        Y6JG6APrcreaOxbTky5ht6QO5G8pajuj4cAf61M=
X-Google-Smtp-Source: AGHT+IFCzTAp+l4L9lrapiEro99Zwxcom5GGO8P4cVIZvvSLm/6u3PAR9sRa7TC9syvDW3BDOcLGbA==
X-Received: by 2002:a05:6808:1a92:b0:3a7:2690:94d5 with SMTP id bm18-20020a0568081a9200b003a7269094d5mr3592060oib.8.1693000488295;
        Fri, 25 Aug 2023 14:54:48 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id x11-20020a056808144b00b003a1ec14d8c6sm1191645oiv.23.2023.08.25.14.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:54:47 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        JaeHun Jung <jh0801.jung@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: exynos: Enable USB support on E850-96 board
Date:   Fri, 25 Aug 2023 16:54:45 -0500
Message-Id: <20230825215445.28309-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825215445.28309-1-semen.protsenko@linaro.org>
References: <20230825215445.28309-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The E850-96 board has a micro-USB socket and two USB 2.0 host sockets.
The USB role (host or peripheral) is selected automatically depending on
micro-USB cable attachment state:
  - micro-USB cable is attached: USB device role
  - micro-USB cable is detached: USB host role

USB can't act simultaneously as a device and a host, because Exynos850
SoC has only one USB controller and there are no external USB
controllers on the E850-96 board. So the USB switch chip (specifically
TS3USB221A) connects SoC USB lines either to micro-USB connector or to
USB hub chip (LAN9514), w.r.t. micro-USB cable attachment state.

When USB works in the host role, Ethernet capability becomes available
too, as the LAN9514 chip (providing USB hub) also enables Ethernet PHY
and Ethernet MAC.

Dynamic role switching is done in gpio-usb-b-connector, using current
micro-USB VBUS line level as a trigger:
  - VBUS=high: SoC USB lines are wired to micro-USB socket
  - VBUS=low: SoC USB lines are wired to USB hub chip

In order to make USB host functional when the board was booted with
micro-USB cable disconnected, role-switch-default-mode = "host" is used.

One can use E850-96 board schematics [1] to figure out how exactly all
related USB hardware connections and lines reflect into corresponding
device tree definitions.

As PMIC regulators are not implemented yet, we rely on USB LDOs being
already enabled in the bootloader. A dummy regulator is provided to
"usbdrd" vdd nodes for now.

[1] https://www.96boards.org/documentation/consumer/e850-96b/hardware-docs/

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - none

 .../boot/dts/exynos/exynos850-e850-96.dts     | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index 6ed38912507f..8d733361ef82 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -29,6 +29,22 @@ chosen {
 		stdout-path = &serial_0;
 	};
 
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		vbus-supply = <&reg_usb_host_vbus>;
+		id-gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&micro_usb_det_pins>;
+
+		port {
+			usb_dr_connector: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+	};
+
 	/*
 	 * RAM: 4 GiB (eMCP):
 	 *   - 2 GiB at 0x80000000
@@ -111,6 +127,20 @@ bt_active_led: led-5 {
 		};
 	};
 
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
+	reg_usb_host_vbus: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_host_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpa3 5 GPIO_ACTIVE_LOW>;
+	};
+
 	/*
 	 * RTC clock (XrtcXTI); external, must be 32.768 kHz.
 	 *
@@ -172,6 +202,12 @@ key_volup_pins: key-volup-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
+
+	micro_usb_det_pins: micro-usb-det-pins {
+		samsung,pins = "gpa0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
 };
 
 &rtc {
@@ -186,6 +222,28 @@ &serial_0 {
 	pinctrl-0 = <&uart1_pins>;
 };
 
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "host";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&usb_dr_connector>;
+		};
+	};
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
+
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
 	status = "okay";
-- 
2.39.2

