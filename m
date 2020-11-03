Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EF7C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 07:53:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1105F2222B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604390028;
	bh=IcBOJsZTM9IvkZ2UlKKAmsnTdjFjbpiJIHI4UJNzZ6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TKvYa3My9nL533Pc2xOOtRI0VQjDwlIpk4HmALZX7yEzNRMRyqaMXdJYHp48Vb9WS
	 lSsl0iQskqjEQryfRkGoIg/0Diyu1JYnUNTFFanIRdPsWaj+WIiynquditI4F2GXwA
	 U4FpNXqPBKNmBv4zqlhxLk9762jA5SaDgGZQ8e9s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbgKCHxr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 02:53:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39195 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgKCHxr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 02:53:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id y12so17367573wrp.6;
        Mon, 02 Nov 2020 23:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=N9gY5Gecsj+pVHqsKvO/SJ65W0y0uTMLHo/A36xtoSE=;
        b=IGRSLnEgA1fNFA4wmDLcqZUhiRFU71o3xXfSuZDj8MOJvtHA0c66OrNYrstPBD3Jgr
         mUuBWL9gYqhX0aIAijzWwj6pN81cpI19LW0B4kx/Sq1egUOE7FmyqaNXSttnybdUXfkl
         kS0/TqMqkUyrZLbPzwcVtAXh7NiGdWf2m/7uFM6bAv1uy7g/tTEK/xWHnGCy7bcc+83S
         JjRkx8AEhGkCut7kFoRbJCQpiy9tn/ge3ShRBqJ7De9ue8j+XSIU4LlcRw2k1Sd9jNc9
         hiIjN30638avzmy/NyTlndIt40S8gdcuIgS1Rco0h4Iitd605gwKPMnTJ6FynpIneST5
         s6fg==
X-Gm-Message-State: AOAM532F6ZNbH9w8zlqsNsXH0OnGIqof5q7xoNbFi7CG1rGqUpaOIfx5
        IgEjojZy9tbXTERLoaI7saRWWeKzKOsZiA==
X-Google-Smtp-Source: ABdhPJz9sr/1DgPnfkl3B81x1iD1CY7saTYctJN/PkUMql8gBCzydYvCiAL+bQQB7R/3Z32m6F0ehg==
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr24302557wru.110.1604390023333;
        Mon, 02 Nov 2020 23:53:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id m4sm25482667wrr.47.2020.11.02.23.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 23:53:42 -0800 (PST)
Date:   Tue, 3 Nov 2020 08:53:40 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin Juecker <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201103075340.GB3599@kozik-lap>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
 <20201031175836.47745-3-martin.juecker@gmail.com>
 <20201102191845.GA64695@kozik-lap>
 <20201102212118.GA2366@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201102212118.GA2366@adroid>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 02, 2020 at 10:21:18PM +0100, Martin Juecker wrote:
> On Mon, Nov 02, 2020 at 08:18:45PM +0100, Krzysztof Kozlowski wrote:
> > On Sat, Oct 31, 2020 at 06:58:34PM +0100, Martin Jücker wrote:
> > > The p4note family contains a couple of variants of the Galaxy Note 10.1
> > > tablet with mainly different modems. The GT-N8010/GT-N8013 is the wifi
> > > only version.
> > 
> > The subject is v1. Did you send correct patch?
> 
> I probably messed up with git send-email here. I need some more time to
> get used to it. The patch is indeed v2.
> 
> > 
> > > 
> > > Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/Makefile                    |    1 +
> > >  arch/arm/boot/dts/exynos4412-p4note-n8010.dts |   16 +
> > >  arch/arm/boot/dts/exynos4412-p4note.dtsi      | 1128 +++++++++++++++++
> > >  3 files changed, 1145 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi
> > > 
> > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > index 4572db3fa5ae..951853e55edb 100644
> > > --- a/arch/arm/boot/dts/Makefile
> > > +++ b/arch/arm/boot/dts/Makefile
> > > @@ -195,6 +195,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
> > >  	exynos4412-odroidx.dtb \
> > >  	exynos4412-odroidx2.dtb \
> > >  	exynos4412-origen.dtb \
> > > +	exynos4412-p4note-n8010.dtb \
> > >  	exynos4412-smdk4412.dtb \
> > >  	exynos4412-tiny4412.dtb \
> > >  	exynos4412-trats2.dtb
> > > diff --git a/arch/arm/boot/dts/exynos4412-p4note-n8010.dts b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > > new file mode 100644
> > > index 000000000000..f99358750e01
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > > @@ -0,0 +1,16 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Samsung's Galaxy Note 10.1 - N801x (wifi only version)
> > > + *
> > > + * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "exynos4412-p4note.dtsi"
> > > +
> > > +/ {
> > > +	model = "Samsung Galaxy Note 10.1 (GT-N8010/N8013) based on Exynos4412";
> > > +	compatible = "samsung,n8010", "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
> > > +
> > > +	/* this is the base variant without any kind of modem */
> > > +};
> > > diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > > new file mode 100644
> > > index 000000000000..15b6acbbecb2
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > > @@ -0,0 +1,1128 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Samsung's Exynos4412 based p4note device family base DT
> > > + *
> > > + * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
> > 
> > Multiple parts of this file look like copied from the existing ones. Few
> > comments are the same. The v1 duplicated even few minor issues like not
> > that good naming of nodes.  It looks like it is not only based on
> > existing sources, but uses parts of them directly.  If it is true, then
> > include the copyright of original work as well.
> > https://www.gnu.org/prep/maintain/html_node/Copyright-Notices.html
> > 
> 
> I had a look through multiple files and ended up with a mix of copying
> and writing nodes myself. Most if not all of the copying is from the
> midas dt, is it enough to add a note that this file is based on the
> midas dt or should I go with the same approach like midas and only add
> the samsung copyright here? I don't care too much what's in the header.

In such case we mention that works is based on the file, as you
suggest, and usually we keep the copyright of original file.

> > 
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "exynos4412.dtsi"
> > > +#include "exynos4412-ppmu-common.dtsi"
> > > +
> > > +#include <dt-bindings/clock/maxim,max77686.h>
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > +#include <dt-bindings/pinctrl/samsung.h>
> > > +
> > > +/ {
> > > +	compatible = "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
> > > +
> > > +	memory@40000000 {
> > > +		device_type = "memory";
> > > +		reg = <0x40000000 0x80000000>;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = &serial_2;
> > > +	};
> > > +
> > > +	firmware@204f000 {
> > > +		compatible = "samsung,secure-firmware";
> > > +		reg = <0x0204F000 0x1000>;
> > > +	};
> > > +
> > > +	fixed-rate-clocks {
> > > +		xxti {
> > > +			compatible = "samsung,clock-xxti";
> > > +			clock-frequency = <0>;
> > > +		};
> > > +
> > > +		xusbxti {
> > > +			compatible = "samsung,clock-xusbxti";
> > > +			clock-frequency = <24000000>;
> > > +		};
> > > +	};
> > > +
> > > +	gpio-keys {
> > > +		compatible = "gpio-keys";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&gpio_keys>;
> > > +
> > > +		key-down {
> > > +			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
> > > +			linux,code = <KEY_VOLUMEDOWN>;
> > > +			label = "volume down";
> > > +			debounce-interval = <10>;
> > > +		};
> > > +
> > > +		key-up {
> > > +			gpios = <&gpx3 3 GPIO_ACTIVE_LOW>;
> > > +			linux,code = <KEY_VOLUMEUP>;
> > > +			label = "volume up";
> > > +			debounce-interval = <10>;
> > > +		};
> > > +
> > > +		key-power {
> > > +			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
> > > +			linux,code = <KEY_POWER>;
> > > +			label = "power";
> > > +			debounce-interval = <10>;
> > > +			wakeup-source;
> > > +		};
> > > +	};
> > > +
> > > +	voltage-regulator-1 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "TSP_LDO1";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&tsp_reg_gpio_1>;
> > > +		gpios = <&gpm4 5 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +		regulator-always-on;
> > > +	};
> > > +
> > > +	voltage-regulator-2 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "TSP_LDO2";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&tsp_reg_gpio_2>;
> > > +		gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +		regulator-always-on;
> > > +	};
> > > +
> > > +	voltage-regulator-3 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "TSP_LDO3";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&tsp_reg_gpio_3>;
> > > +		gpios = <&gpb 7 GPIO_ACTIVE_HIGH>;
> > > +		startup-delay-us = <20000>;
> > > +		enable-active-high;
> > > +		regulator-always-on;
> > > +	};
> > > +
> > > +	wlan_pwrseq: sdhci3-pwrseq {
> > > +		compatible = "mmc-pwrseq-simple";
> > > +		reset-gpios = <&gpm3 5 GPIO_ACTIVE_LOW>;
> > > +		pinctrl-0 = <&wifi_reset>;
> > > +		pinctrl-names = "default";
> > > +		clocks = <&max77686 MAX77686_CLK_PMIC>;
> > > +		clock-names = "ext_clock";
> > > +	};
> > > +
> > > +	i2c-gpio-1 {
> > > +		compatible = "i2c-gpio";
> > > +		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		i2c-gpio,delay-us = <2>;
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		magnetometer@c {
> > > +			compatible = "asahi-kasei,ak8975";
> > > +			reg = <0x0c>;
> > > +			pinctrl-0 = <&ak8975_irq>;
> > > +			pinctrl-names = "default";
> > > +			interrupt-parent = <&gpm4>;
> > > +			interrupts = <7 IRQ_TYPE_EDGE_RISING>;
> > > +		};
> > > +	};
> > > +
> > > +	i2c-gpio-2 {
> > > +		compatible = "i2c-gpio";
> > > +		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		i2c-gpio,delay-us = <2>;
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		fuel-gauge@36 {
> > > +			compatible = "maxim,max17042";
> > > +			reg = <0x36>;
> > > +			pinctrl-0 = <&fuel_alert_irq>;
> > > +			pinctrl-names = "default";
> > > +			interrupt-parent = <&gpx2>;
> > > +			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> > > +			maxim,rsns-microohm = <10000>;
> > > +			maxim,over-heat-temp = <600>;
> > > +			maxim,over-volt = <4300>;
> > > +		};
> > > +	};
> > > +
> > > +	i2c-gpio-3 {
> > > +		compatible = "i2c-gpio";
> > > +		sda-gpios = <&gpm4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&gpm4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		i2c-gpio,delay-us = <5>;
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		adc@41 {
> > > +			compatible = "st,stmpe811";
> > > +			reg = <0x41>;
> > > +			pinctrl-0 = <&stmpe_adc_irq>;
> > > +			pinctrl-names = "default";
> > > +			interrupt-parent = <&gpx0>;
> > > +			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> > > +			interrupt-controller;
> > > +			irq-trigger = <0x1>;
> > > +			st,adc-freq = <3>;
> > > +			st,mod-12b = <1>;
> > > +			st,ref-sel = <0>;
> > > +			st,sample-time = <3>;
> > > +
> > > +			stmpe_adc {
> > > +				compatible = "st,stmpe-adc";
> > > +				#io-channel-cells = <1>;
> > > +				st,norequest-mask = <0x2F>;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&adc {
> > > +	vdd-supply = <&ldo3_reg>;
> > > +	/* not verified */
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_dmc {
> > > +	devfreq-events = <&ppmu_dmc0_3>, <&ppmu_dmc1_3>;
> > > +	vdd-supply = <&buck1_reg>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_acp {
> > > +	devfreq = <&bus_dmc>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_c2c {
> > > +	devfreq = <&bus_dmc>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_leftbus {
> > > +	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
> > > +	vdd-supply = <&buck3_reg>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_rightbus {
> > > +	devfreq = <&bus_leftbus>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_display {
> > > +	devfreq = <&bus_leftbus>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_fsys {
> > > +	devfreq = <&bus_leftbus>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_peri {
> > > +	devfreq = <&bus_leftbus>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&bus_mfc {
> > > +	devfreq = <&bus_leftbus>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&cpu0 {
> > > +	cpu0-supply = <&buck2_reg>;
> > > +};
> > > +
> > > +&cpu_thermal {
> > > +	cooling-maps {
> > > +		map0 {
> > > +			/* Corresponds to 800MHz at freq_table */
> > > +			cooling-device = <&cpu0 7 7>, <&cpu1 7 7>, <&cpu2 7 7>, <&cpu3 7 7>;
> > > +		};
> > > +		map1 {
> > > +			/* Corresponds to 200MHz at freq_table */
> > > +			cooling-device = <&cpu0 13 13>, <&cpu1 13 13>, <&cpu2 13 13>, <&cpu3 13 13>;
> > 
> > This is too long. Please split it at 80 with indentation of next line
> > starting at < from the previous one.
> > 
> 
> Okay
> 
> > 
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&exynos_usbphy {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&fimd {
> > > +	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +
> > > +	display-timings {
> > > +		timing0 {
> > > +			clock-frequency = <66666666>;
> > > +			hactive = <1280>;
> > > +			vactive = <800>;
> > > +			hfront-porch = <18>;
> > > +			hback-porch = <36>;
> > > +			hsync-len = <16>;
> > > +			vback-porch = <16>;
> > > +			vfront-porch = <4>;
> > > +			vsync-len = <3>;
> > > +			hsync-active = <1>;
> > > +		};
> > > +	};
> > 
> > What happened with Marek's comment about this?
> > 
> 
> Should have mentioned it in the introduction mail. I had a look at the
> simple panel driver and it's not enough for the display in the p4note. I
> asked Marek in IRC whether it's ok to have this in a separate patch set
> to have a fully working display and he agreed.

Ah, ok.

Best regards,
Krzysztof
