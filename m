Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEC6C00A89
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 21:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5336A22226
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 21:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tw40gXUT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKBVVZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 16:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBVVY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 16:21:24 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BEDC0617A6;
        Mon,  2 Nov 2020 13:21:23 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id b3so10315516wrx.11;
        Mon, 02 Nov 2020 13:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MB4rf6a0sBGGcKj9Rj42+nDQ3UaxV++uQ3OML792s9I=;
        b=tw40gXUTr8rNp8twgQp6vMYjwjbPGgL6PuxQtGdXyjrdHaReAgWcrExqz8OlmBShEP
         pAN9mEiqANOKhAKwZgc8wDxBBNzGECTvdfSOaXjhXxDQAIJ8yCtuc5D3OQN9KgpiL1my
         xB3rcFMlrZPweguGIWDSiIrSVmsqE5M2D+725af8pAc43guydrTIrzZpd+Q4gDgIcFLT
         eBr8Bik3nNw1IVqdrxC4wnBgD2DbXBHUW5SRBn+d709GrmbFZeCOAudt2bEpvL4/7Fp/
         Hh0syy8lwKxkqIKpYQj4PqdGQZlPYuwopTz6Sjj5ItTWzHbakonzbbRKfkNZhRDubwpU
         902A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MB4rf6a0sBGGcKj9Rj42+nDQ3UaxV++uQ3OML792s9I=;
        b=P4Qna/FRk4CtGJq1v34wNKq+41/OmhVc/bpXZ2MxZc1BwJJZeL1Y06U/llX9jbpLNr
         xw8EFgrwYmRyMOi7gNargFL4PVR3e7bxpiiYVFR1j2ZVcv65IjCwK09IFeCZy2AqxqMq
         OevfxvgjF2ed92vKf9Q2B3aQeX4jynNMZNPn5AhW16PVTRTKDJFwFLibFRISa2S6rX6t
         Scp556QlNVXWMzNZ0Z6AbSHQcnbwbjhn0wk6vqeD72YVkKGfJfKhnyeXyLA53EnvoDRh
         gvmoZAYiAaetyAA0ejzUl1NFKNTuY0xVrAdOlour2WdtsG6ASuzxxL7gn981s8646qGw
         XZhQ==
X-Gm-Message-State: AOAM5324qvsOH+hlWWEDVU6vixDChAeO2t96FXPtVqldzlGOhevcUr6u
        N1qVqA9C/QdbLFx5GYC41Do=
X-Google-Smtp-Source: ABdhPJx29rbOMT2l/FAG5NbQ1+2t90MQNWK83ET5ahNRG8dls4oRJc8U7aUUxNoGcXbJk42Fw+xb1A==
X-Received: by 2002:a5d:67ca:: with SMTP id n10mr22058312wrw.209.1604352081702;
        Mon, 02 Nov 2020 13:21:21 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id c8sm22743196wrv.26.2020.11.02.13.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 13:21:20 -0800 (PST)
Date:   Mon, 2 Nov 2020 22:21:18 +0100
From:   Martin Juecker <martin.juecker@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201102212118.GA2366@adroid>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
 <20201031175836.47745-3-martin.juecker@gmail.com>
 <20201102191845.GA64695@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201102191845.GA64695@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 02, 2020 at 08:18:45PM +0100, Krzysztof Kozlowski wrote:
> On Sat, Oct 31, 2020 at 06:58:34PM +0100, Martin Jücker wrote:
> > The p4note family contains a couple of variants of the Galaxy Note 10.1
> > tablet with mainly different modems. The GT-N8010/GT-N8013 is the wifi
> > only version.
> 
> The subject is v1. Did you send correct patch?

I probably messed up with git send-email here. I need some more time to
get used to it. The patch is indeed v2.

> 
> > 
> > Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |    1 +
> >  arch/arm/boot/dts/exynos4412-p4note-n8010.dts |   16 +
> >  arch/arm/boot/dts/exynos4412-p4note.dtsi      | 1128 +++++++++++++++++
> >  3 files changed, 1145 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> >  create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 4572db3fa5ae..951853e55edb 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -195,6 +195,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
> >  	exynos4412-odroidx.dtb \
> >  	exynos4412-odroidx2.dtb \
> >  	exynos4412-origen.dtb \
> > +	exynos4412-p4note-n8010.dtb \
> >  	exynos4412-smdk4412.dtb \
> >  	exynos4412-tiny4412.dtb \
> >  	exynos4412-trats2.dtb
> > diff --git a/arch/arm/boot/dts/exynos4412-p4note-n8010.dts b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > new file mode 100644
> > index 000000000000..f99358750e01
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
> > @@ -0,0 +1,16 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung's Galaxy Note 10.1 - N801x (wifi only version)
> > + *
> > + * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "exynos4412-p4note.dtsi"
> > +
> > +/ {
> > +	model = "Samsung Galaxy Note 10.1 (GT-N8010/N8013) based on Exynos4412";
> > +	compatible = "samsung,n8010", "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
> > +
> > +	/* this is the base variant without any kind of modem */
> > +};
> > diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > new file mode 100644
> > index 000000000000..15b6acbbecb2
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > @@ -0,0 +1,1128 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung's Exynos4412 based p4note device family base DT
> > + *
> > + * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
> 
> Multiple parts of this file look like copied from the existing ones. Few
> comments are the same. The v1 duplicated even few minor issues like not
> that good naming of nodes.  It looks like it is not only based on
> existing sources, but uses parts of them directly.  If it is true, then
> include the copyright of original work as well.
> https://www.gnu.org/prep/maintain/html_node/Copyright-Notices.html
> 

I had a look through multiple files and ended up with a mix of copying
and writing nodes myself. Most if not all of the copying is from the
midas dt, is it enough to add a note that this file is based on the
midas dt or should I go with the same approach like midas and only add
the samsung copyright here? I don't care too much what's in the header.

> 
> > + */
> > +
> > +/dts-v1/;
> > +#include "exynos4412.dtsi"
> > +#include "exynos4412-ppmu-common.dtsi"
> > +
> > +#include <dt-bindings/clock/maxim,max77686.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/pinctrl/samsung.h>
> > +
> > +/ {
> > +	compatible = "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0x40000000 0x80000000>;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &serial_2;
> > +	};
> > +
> > +	firmware@204f000 {
> > +		compatible = "samsung,secure-firmware";
> > +		reg = <0x0204F000 0x1000>;
> > +	};
> > +
> > +	fixed-rate-clocks {
> > +		xxti {
> > +			compatible = "samsung,clock-xxti";
> > +			clock-frequency = <0>;
> > +		};
> > +
> > +		xusbxti {
> > +			compatible = "samsung,clock-xusbxti";
> > +			clock-frequency = <24000000>;
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&gpio_keys>;
> > +
> > +		key-down {
> > +			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_VOLUMEDOWN>;
> > +			label = "volume down";
> > +			debounce-interval = <10>;
> > +		};
> > +
> > +		key-up {
> > +			gpios = <&gpx3 3 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_VOLUMEUP>;
> > +			label = "volume up";
> > +			debounce-interval = <10>;
> > +		};
> > +
> > +		key-power {
> > +			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_POWER>;
> > +			label = "power";
> > +			debounce-interval = <10>;
> > +			wakeup-source;
> > +		};
> > +	};
> > +
> > +	voltage-regulator-1 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "TSP_LDO1";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&tsp_reg_gpio_1>;
> > +		gpios = <&gpm4 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> > +
> > +	voltage-regulator-2 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "TSP_LDO2";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&tsp_reg_gpio_2>;
> > +		gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> > +
> > +	voltage-regulator-3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "TSP_LDO3";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&tsp_reg_gpio_3>;
> > +		gpios = <&gpb 7 GPIO_ACTIVE_HIGH>;
> > +		startup-delay-us = <20000>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> > +
> > +	wlan_pwrseq: sdhci3-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		reset-gpios = <&gpm3 5 GPIO_ACTIVE_LOW>;
> > +		pinctrl-0 = <&wifi_reset>;
> > +		pinctrl-names = "default";
> > +		clocks = <&max77686 MAX77686_CLK_PMIC>;
> > +		clock-names = "ext_clock";
> > +	};
> > +
> > +	i2c-gpio-1 {
> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <2>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		magnetometer@c {
> > +			compatible = "asahi-kasei,ak8975";
> > +			reg = <0x0c>;
> > +			pinctrl-0 = <&ak8975_irq>;
> > +			pinctrl-names = "default";
> > +			interrupt-parent = <&gpm4>;
> > +			interrupts = <7 IRQ_TYPE_EDGE_RISING>;
> > +		};
> > +	};
> > +
> > +	i2c-gpio-2 {
> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <2>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		fuel-gauge@36 {
> > +			compatible = "maxim,max17042";
> > +			reg = <0x36>;
> > +			pinctrl-0 = <&fuel_alert_irq>;
> > +			pinctrl-names = "default";
> > +			interrupt-parent = <&gpx2>;
> > +			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> > +			maxim,rsns-microohm = <10000>;
> > +			maxim,over-heat-temp = <600>;
> > +			maxim,over-volt = <4300>;
> > +		};
> > +	};
> > +
> > +	i2c-gpio-3 {
> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpm4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpm4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <5>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		adc@41 {
> > +			compatible = "st,stmpe811";
> > +			reg = <0x41>;
> > +			pinctrl-0 = <&stmpe_adc_irq>;
> > +			pinctrl-names = "default";
> > +			interrupt-parent = <&gpx0>;
> > +			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> > +			interrupt-controller;
> > +			irq-trigger = <0x1>;
> > +			st,adc-freq = <3>;
> > +			st,mod-12b = <1>;
> > +			st,ref-sel = <0>;
> > +			st,sample-time = <3>;
> > +
> > +			stmpe_adc {
> > +				compatible = "st,stmpe-adc";
> > +				#io-channel-cells = <1>;
> > +				st,norequest-mask = <0x2F>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&adc {
> > +	vdd-supply = <&ldo3_reg>;
> > +	/* not verified */
> > +	status = "okay";
> > +};
> > +
> > +&bus_dmc {
> > +	devfreq-events = <&ppmu_dmc0_3>, <&ppmu_dmc1_3>;
> > +	vdd-supply = <&buck1_reg>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_acp {
> > +	devfreq = <&bus_dmc>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_c2c {
> > +	devfreq = <&bus_dmc>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_leftbus {
> > +	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
> > +	vdd-supply = <&buck3_reg>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_rightbus {
> > +	devfreq = <&bus_leftbus>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_display {
> > +	devfreq = <&bus_leftbus>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_fsys {
> > +	devfreq = <&bus_leftbus>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_peri {
> > +	devfreq = <&bus_leftbus>;
> > +	status = "okay";
> > +};
> > +
> > +&bus_mfc {
> > +	devfreq = <&bus_leftbus>;
> > +	status = "okay";
> > +};
> > +
> > +&cpu0 {
> > +	cpu0-supply = <&buck2_reg>;
> > +};
> > +
> > +&cpu_thermal {
> > +	cooling-maps {
> > +		map0 {
> > +			/* Corresponds to 800MHz at freq_table */
> > +			cooling-device = <&cpu0 7 7>, <&cpu1 7 7>, <&cpu2 7 7>, <&cpu3 7 7>;
> > +		};
> > +		map1 {
> > +			/* Corresponds to 200MHz at freq_table */
> > +			cooling-device = <&cpu0 13 13>, <&cpu1 13 13>, <&cpu2 13 13>, <&cpu3 13 13>;
> 
> This is too long. Please split it at 80 with indentation of next line
> starting at < from the previous one.
> 

Okay

> 
> > +		};
> > +	};
> > +};
> > +
> > +&exynos_usbphy {
> > +	status = "okay";
> > +};
> > +
> > +&fimd {
> > +	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	display-timings {
> > +		timing0 {
> > +			clock-frequency = <66666666>;
> > +			hactive = <1280>;
> > +			vactive = <800>;
> > +			hfront-porch = <18>;
> > +			hback-porch = <36>;
> > +			hsync-len = <16>;
> > +			vback-porch = <16>;
> > +			vfront-porch = <4>;
> > +			vsync-len = <3>;
> > +			hsync-active = <1>;
> > +		};
> > +	};
> 
> What happened with Marek's comment about this?
> 

Should have mentioned it in the introduction mail. I had a look at the
simple panel driver and it's not enough for the display in the p4note. I
asked Marek in IRC whether it's ok to have this in a separate patch set
to have a fully working display and he agreed.

> Best regards,
> Krzysztof
