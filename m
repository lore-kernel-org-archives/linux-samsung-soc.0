Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15467C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 08:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0F2022202
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603786677;
	bh=/AJC4lLRswaF4xYZSllaru4z1+qC52wFZuHuPktSAtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XQjXPXewfcggkNkGowDb3dY3jmqY4zpeoH/Za29hVpyJ5TCPloGbNOHcW1wHNZ96u
	 jk1fFqHI0LDbVYcl1kI6U5rqg6EJglgJkGhe67h1GupEBP1mWA7EGMb76M8LPkWmEo
	 9xtsb1avyVUFzlIhFQe2Mxh4DuHe9GvXBOYv4Bnc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894544AbgJ0IR5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 04:17:57 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38210 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894543AbgJ0IR5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 04:17:57 -0400
Received: by mail-ej1-f68.google.com with SMTP id ce10so937264ejc.5;
        Tue, 27 Oct 2020 01:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gZhJQU9AXWO7bAv9zldTM4MBhF13/BQtRijPQKkDGcU=;
        b=i8C5qOx5f+Pi4+9sdhc7RdyMoEsXe/rec+q78mejOytr4BB5qUyqX+6hYX9SEoM+cq
         RQBHaqNGm79d2fJgFgdzTB6ncZlKzvvuzMLDjFhUMECg9TNziq7kAP7Oi+PtSuxYsfLV
         B2JirNGWtBJVyfyoRtKNgcvOwd9R1LN21cXWlWW1enR/HabB4d4idsY33ldjCnZvxiY/
         HH1eI7X2wvm4Fo+E2CUUPA5bchwmgDiONwGw14Vjxk1j0AHIceUbA89SFBIZdu61JzI7
         efSTrfM5d0TVGwBLBWkK92i2r3UaeUxF4quKDTP9V6nxxXYZLKL2/ZvXxUdzJSgwTKOI
         EP6A==
X-Gm-Message-State: AOAM532zw+kvVKg2ERex/tJUG9FXyOZCzyBglL5h0m4tm7F0n5YQOXd2
        6IEHGUnFPNq/s5o4vt8rbHU=
X-Google-Smtp-Source: ABdhPJziQ7W8UthFwnBjdvpIQ3Nt33THL1KcgpZwQ3NWCMDCeSTpKaQnxb3zzoIpZCANMIGgeQ4MlA==
X-Received: by 2002:a17:906:aad5:: with SMTP id kt21mr1205808ejb.5.1603786673959;
        Tue, 27 Oct 2020 01:17:53 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id e5sm517491ejb.26.2020.10.27.01.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 01:17:53 -0700 (PDT)
Date:   Tue, 27 Oct 2020 09:17:51 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin Juecker <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201027081751.GA4244@kozik-lap>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
 <20201024144421.34435-3-martin.juecker@gmail.com>
 <20201026144830.GA76312@kozik-lap>
 <20201026232709.GA2723@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201026232709.GA2723@adroid>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 12:27:09AM +0100, Martin Juecker wrote:
> Hello Krzysztof,
> 
> thank you for the feedback.
> 
> On Mon, Oct 26, 2020 at 03:48:30PM +0100, Krzysztof Kozlowski wrote:
> > On Sat, Oct 24, 2020 at 04:44:18PM +0200, Martin Jücker wrote:
> 
> (...)
> 
> > > +/dts-v1/;
> > > +#include "exynos4412-p4note.dtsi"
> > > +
> > > +/ {
> > > +	model = "Samsung Galaxy Note 10.1 (GT-N8010/N8013) based on Exynos4412";
> > > +	compatible = "samsung,n801x", "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
> > 
> > Compatible without the wildcard, so samsung,n8010.
> 
> I went with the n710x style compatible but I'm fine with this, too.
> 
> > 
> > > +
> > > +	/* this is the base variant without any kind of modem */
> > > +};
> > > diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > > new file mode 100644
> > > index 000000000000..6d7e84f40e92
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > > @@ -0,0 +1,1057 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Samsung's Exynos4412 based p4note device family base DT
> > > + *
> > > + * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "exynos4412.dtsi"
> > > +#include "exynos4412-ppmu-common.dtsi"
> > > +
> > > +#include <dt-bindings/input/input.h>
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/gpio-keys.h>
> > 
> > Looks unused.
> 
> Indeed, a leftover while trying things.
> 
> (...)
> 
> >
> > > +	tsp_reg_1: voltage-regulator-1 {
> > 
> > All labels are not used.
> >
> 
> Removed the labels.
> 
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "TSP_FIXED_VOLTAGES_1";
> > 
> > Would be better to have a real name matching either schematics (which I
> > guess you do not have) or vendor sources.
> > 
> 
> You are right, there is no schematics, the old vendor sources only have
> gpio calls with the names TSP_LDO_ON, TSP_LDO_ON1 and TSP_LDO_ON2. Those
> regulators are for the Atmel 1664S touchscreen which has a public data
> sheet. My best guess would be that those are VDD, AVDD and XVDD but I
> have no idea how to match them or whether this is actually an accurate
> observation. My electronics knowledge is rather limited.

Then how about TSP_LDO1, TSP_LDO2, TSP_LDO3?

> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&tsp_reg_gpio_1>;
> > > +		gpios = <&gpm4 5 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +		regulator-always-on;
> > > +	};
> > > +
> > > +	tsp_reg_2: voltage-regulator-2 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "TSP_FIXED_VOLTAGES_2";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&tsp_reg_gpio_2>;
> > > +		gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +		regulator-always-on;
> > > +	};
> > > +
> > > +	tsp_reg_3: voltage-regulator-3 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "TSP_FIXED_VOLTAGES_3";
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
> > > +	i2c-gpio-10 {
> > 
> > Numbering should start from 1 unless there is a reason for 10/14/19?
> > 
> 
> I used the numbers from the vendor sources but it shouldn't really
> matter, changed it.
> 
> > > +		compatible = "i2c-gpio";
> > > +		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		i2c-gpio,delay-us = <2>;
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		ak8975@c {
> > 
> > Node name: magnetometer
> > 
> 
> Done.
> 
> > > +			compatible = "asahi-kasei,ak8975";
> > > +			reg = <0x0c>;
> > > +			interrupt-parent = <&gpm4>;
> > > +			interrupts = <7 IRQ_TYPE_EDGE_RISING>;
> > > +			pinctrl-names = "default";
> > > +			pinctrl-0 = <&ak8975_irq>;
> > > +		};
> > > +	};
> > > +
> > > +	i2c-gpio-14 {
> > > +		compatible = "i2c-gpio";
> > > +		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		i2c-gpio,delay-us = <2>;
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		max17042@36 {
> > 
> > Node name: fuel-gauge
> > 
> 
> Done.
> 
> > > +			compatible = "maxim,max17042";
> > > +			reg = <0x36>;
> > > +			interrupt-parent = <&gpx2>;
> > > +			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> > 
> > You might need to disable the pull-down on the pin, whcih is usually the
> > default.
> > 
> 
> Found the configuration for this in the vendor sources, it was in a
> different place than the rest.
> 
> > > +			maxim,rsns-microohm = <10000>;
> > > +			maxim,over-heat-temp = <600>;
> > > +			maxim,over-volt = <4300>;
> > > +		};
> > > +	};
> > > +
> > > +	i2c-gpio-19 {
> > > +		compatible = "i2c-gpio";
> > > +		sda-gpios = <&gpm4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		scl-gpios = <&gpm4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +		i2c-gpio,delay-us = <5>;
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		stmpe_mfd@41 {
> > 
> > Node name: touchscreen?
> > Although you already have a touchscreen later, so what is it?
> > 
> 
> The stmpe 811 is a mfd but the p4note is actually only using the adc
> part of it for checking the accessory type of the usb cable and what was
> connected to the headphone jack. I renamed it to adc@41
> 
> > > +			compatible = "st,stmpe811";
> > > +			reg = <0x41>;
> > > +			interrupt-parent = <&gpx0>;
> > > +			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> > 
> > Disable the pull-down of interrupt pin?
> > 
> 
> Same as above.
> 
> > > +			interrupt-controller;
> > > +			irq-trigger = <0x1>;
> > > +			st,adc-freq = <3>;
> > > +			st,mod-12b = <1>;
> > > +			st,ref-sel = <0>;
> > > +			st,sample-time = <3>;
> > > +
> > > +			stmpe_adc: stmpe_adc {
> > 
> > Node name: adc
> > Label seems unused, so remove it.
> > 
> 
> I removed the label but I cannot rename the node as the name is used by
> the driver to find and load the driver for the subcomponent.

Ok.

> 
> > > +				compatible = "st,stmpe-adc";
> > > +				#io-channel-cells = <1>;
> > > +				st,norequest-mask = <0x2F>;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&adc {
> > > +	status = "okay";
> > 
> > Missing vdd-supply
> > 
> 
> I'm not sure about the supply here, it's not actually in the vendor
> sources. It seems the bootloader is setting this up. The regulator
> naming suggests, that it would be LDO23. What should I do here?
> Currently no driver is using it but it's needed for the backlight
> dimming which I currently still have some trouble with.

The LDO23 is most likely for the touch panel ADC, not for the SoC one.
Here it could be LDO3. You have to put something otherwise dtschema will
complain.

Go with the LDO3 and maybe a comment like: "TBD, not confirmed".

> 
> > > +};
> 
> (...)
> 
> > > +
> > > +&i2c_7 {
> > > +	samsung,i2c-sda-delay = <100>;
> > > +	samsung,i2c-slave-addr = <0x10>;
> > > +	samsung,i2c-max-bus-freq = <400000>;
> > > +	pinctrl-0 = <&i2c7_bus>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +
> > > +	max77686: max77686_pmic@9 {
> > > +		compatible = "maxim,max77686";
> > > +		interrupt-parent = <&gpx0>;
> > > +		interrupts = <7 IRQ_TYPE_NONE>;
> > > +		pinctrl-0 = <&max77686_irq>;
> > > +		pinctrl-names = "default";
> > > +		reg = <0x09>;
> > > +		#clock-cells = <1>;
> > > +
> > > +		voltage-regulators {
> > 
> > Just "regulators" and no empty line after this.
> > 
> > You should define all regulators here. If some are unknown, keep the
> > min-max the same as in driver.
> > 
> 
> I used the driver to read all the voltages, it also reads values for
> the LDOs that are not defined in the DT, so I have values for all of
> them setup by the bootloader. What I don't know is their name and what
> they are used for. Interestingly apart from two LDOs, the voltages did
> match exactly with those from the midas DT, so it could be very
> similar. The two non-matching were only off by 0.1V. How should I go
> about this?

Actually, let's skip the constraints (min-max) for unknown regulators.
Just add the entries with generic names, like:
arch/arm/boot/dts/exynos5410-odroidxu.dts

I would not put here min-max constraints from bootloader because pretty
often it has only an initial setup for specific frequency - just to make
it booting.

If you have the constraints (min-max, always on) from vendor sources,
you could add them.

Best regards,
Krzysztof
