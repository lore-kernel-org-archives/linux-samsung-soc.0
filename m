Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1F0C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 23:27:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C860A20878
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 23:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4J26QDD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406056AbgJZX1Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 19:27:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52081 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405905AbgJZX1P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:27:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id v5so13302265wmh.1;
        Mon, 26 Oct 2020 16:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ojUr2g6POlTCcRODOP8laT3BfQLEnPPAtgK+QKL6yxQ=;
        b=S4J26QDDP0NZ08yezxcR5OO7ENVZO9tDW819W2LiCpy4hNmKsLLIiXUTv8HfZKTspD
         iCXHjLlwb/T8KSQnK3YsU4pFyARM2lhBdkUtb+rBlMcpx9emPfjMn/4SvRPbmtIHQ4GF
         pNDxHWPe8AdM4JHt7d76ZWV2O8eLtrTaK5ehm5DKrrvWYtC8/aggTWnN2QBT3gtV7Fn8
         +EvUwyWUNyhiSmZw6eFEd6O9schzfhnff5Se8Z0x8b1hKvIIvqLCOizzaCLy7lQ6VW9g
         FKa8CX3y2LJqyaEbwCHBg65g6Xr/w+qTEM4ji6HT8726e+i6PqL38h4titXNkRvSQFdt
         fu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ojUr2g6POlTCcRODOP8laT3BfQLEnPPAtgK+QKL6yxQ=;
        b=RaPyP0XuMDox+6yTaiFOpO1SpJ9cm66oRzLLojisahgJOWswJEl3XU7q5ABZoRxD77
         uX4GQ9e8wUmuHweHrl1i35bGReUUpW59+bjk4UDftsn00Yz46h7e2X/xSJDMAXHU+s22
         GS5rqIUwS0eFOHNEp5AhIr6tzqxOoVlI13NZUm5JFjAY1jGm+igIHJ9VSng9xFqsfI0E
         Yi+cMeTbmlvlgHcMgklfYw7vSHuv+ON185XbDCEw22PZ8onfHqA6sV73+giEAu3qkjjb
         +wS4Ik4Ku8OJPsXV7bZ5Qyt7O5eC0OmY8n2j5FFBfFyAlcaq0EQDu5JMCGu8kRORvaRD
         9q4g==
X-Gm-Message-State: AOAM530SBH/AX+vYM3pPkYyk7v6IzOp79bI7vOs2/xOk7ENQn9olKtBZ
        CsnbUHXMAQnnzM9LMoLed+4=
X-Google-Smtp-Source: ABdhPJygrDvtxtWL38SQAzCQRZL4hOAcUJajF/TZpKl9WPeQR2YcGODKff/mFBB0mawkGpsvLtpFQw==
X-Received: by 2002:a7b:ce85:: with SMTP id q5mr18036189wmj.35.1603754831946;
        Mon, 26 Oct 2020 16:27:11 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id t5sm27881799wrb.21.2020.10.26.16.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 16:27:11 -0700 (PDT)
Date:   Tue, 27 Oct 2020 00:27:09 +0100
From:   Martin Juecker <martin.juecker@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201026232709.GA2723@adroid>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
 <20201024144421.34435-3-martin.juecker@gmail.com>
 <20201026144830.GA76312@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201026144830.GA76312@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

thank you for the feedback.

On Mon, Oct 26, 2020 at 03:48:30PM +0100, Krzysztof Kozlowski wrote:
> On Sat, Oct 24, 2020 at 04:44:18PM +0200, Martin Jücker wrote:

(...)

> > +/dts-v1/;
> > +#include "exynos4412-p4note.dtsi"
> > +
> > +/ {
> > +	model = "Samsung Galaxy Note 10.1 (GT-N8010/N8013) based on Exynos4412";
> > +	compatible = "samsung,n801x", "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
> 
> Compatible without the wildcard, so samsung,n8010.

I went with the n710x style compatible but I'm fine with this, too.

> 
> > +
> > +	/* this is the base variant without any kind of modem */
> > +};
> > diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > new file mode 100644
> > index 000000000000..6d7e84f40e92
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> > @@ -0,0 +1,1057 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung's Exynos4412 based p4note device family base DT
> > + *
> > + * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "exynos4412.dtsi"
> > +#include "exynos4412-ppmu-common.dtsi"
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/gpio-keys.h>
> 
> Looks unused.

Indeed, a leftover while trying things.

(...)

>
> > +	tsp_reg_1: voltage-regulator-1 {
> 
> All labels are not used.
>

Removed the labels.

> > +		compatible = "regulator-fixed";
> > +		regulator-name = "TSP_FIXED_VOLTAGES_1";
> 
> Would be better to have a real name matching either schematics (which I
> guess you do not have) or vendor sources.
> 

You are right, there is no schematics, the old vendor sources only have
gpio calls with the names TSP_LDO_ON, TSP_LDO_ON1 and TSP_LDO_ON2. Those
regulators are for the Atmel 1664S touchscreen which has a public data
sheet. My best guess would be that those are VDD, AVDD and XVDD but I
have no idea how to match them or whether this is actually an accurate
observation. My electronics knowledge is rather limited.

> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&tsp_reg_gpio_1>;
> > +		gpios = <&gpm4 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> > +
> > +	tsp_reg_2: voltage-regulator-2 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "TSP_FIXED_VOLTAGES_2";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&tsp_reg_gpio_2>;
> > +		gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> > +
> > +	tsp_reg_3: voltage-regulator-3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "TSP_FIXED_VOLTAGES_3";
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
> > +	i2c-gpio-10 {
> 
> Numbering should start from 1 unless there is a reason for 10/14/19?
> 

I used the numbers from the vendor sources but it shouldn't really
matter, changed it.

> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <2>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ak8975@c {
> 
> Node name: magnetometer
> 

Done.

> > +			compatible = "asahi-kasei,ak8975";
> > +			reg = <0x0c>;
> > +			interrupt-parent = <&gpm4>;
> > +			interrupts = <7 IRQ_TYPE_EDGE_RISING>;
> > +			pinctrl-names = "default";
> > +			pinctrl-0 = <&ak8975_irq>;
> > +		};
> > +	};
> > +
> > +	i2c-gpio-14 {
> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <2>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		max17042@36 {
> 
> Node name: fuel-gauge
> 

Done.

> > +			compatible = "maxim,max17042";
> > +			reg = <0x36>;
> > +			interrupt-parent = <&gpx2>;
> > +			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> 
> You might need to disable the pull-down on the pin, whcih is usually the
> default.
> 

Found the configuration for this in the vendor sources, it was in a
different place than the rest.

> > +			maxim,rsns-microohm = <10000>;
> > +			maxim,over-heat-temp = <600>;
> > +			maxim,over-volt = <4300>;
> > +		};
> > +	};
> > +
> > +	i2c-gpio-19 {
> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpm4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpm4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <5>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		stmpe_mfd@41 {
> 
> Node name: touchscreen?
> Although you already have a touchscreen later, so what is it?
> 

The stmpe 811 is a mfd but the p4note is actually only using the adc
part of it for checking the accessory type of the usb cable and what was
connected to the headphone jack. I renamed it to adc@41

> > +			compatible = "st,stmpe811";
> > +			reg = <0x41>;
> > +			interrupt-parent = <&gpx0>;
> > +			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> 
> Disable the pull-down of interrupt pin?
> 

Same as above.

> > +			interrupt-controller;
> > +			irq-trigger = <0x1>;
> > +			st,adc-freq = <3>;
> > +			st,mod-12b = <1>;
> > +			st,ref-sel = <0>;
> > +			st,sample-time = <3>;
> > +
> > +			stmpe_adc: stmpe_adc {
> 
> Node name: adc
> Label seems unused, so remove it.
> 

I removed the label but I cannot rename the node as the name is used by
the driver to find and load the driver for the subcomponent.

> > +				compatible = "st,stmpe-adc";
> > +				#io-channel-cells = <1>;
> > +				st,norequest-mask = <0x2F>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&adc {
> > +	status = "okay";
> 
> Missing vdd-supply
> 

I'm not sure about the supply here, it's not actually in the vendor
sources. It seems the bootloader is setting this up. The regulator
naming suggests, that it would be LDO23. What should I do here?
Currently no driver is using it but it's needed for the backlight
dimming which I currently still have some trouble with.

> > +};

(...)

> > +
> > +&i2c_7 {
> > +	samsung,i2c-sda-delay = <100>;
> > +	samsung,i2c-slave-addr = <0x10>;
> > +	samsung,i2c-max-bus-freq = <400000>;
> > +	pinctrl-0 = <&i2c7_bus>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	max77686: max77686_pmic@9 {
> > +		compatible = "maxim,max77686";
> > +		interrupt-parent = <&gpx0>;
> > +		interrupts = <7 IRQ_TYPE_NONE>;
> > +		pinctrl-0 = <&max77686_irq>;
> > +		pinctrl-names = "default";
> > +		reg = <0x09>;
> > +		#clock-cells = <1>;
> > +
> > +		voltage-regulators {
> 
> Just "regulators" and no empty line after this.
> 
> You should define all regulators here. If some are unknown, keep the
> min-max the same as in driver.
> 

I used the driver to read all the voltages, it also reads values for
the LDOs that are not defined in the DT, so I have values for all of
them setup by the bootloader. What I don't know is their name and what
they are used for. Interestingly apart from two LDOs, the voltages did
match exactly with those from the midas DT, so it could be very
similar. The two non-matching were only off by 0.1V. How should I go
about this?

> > +
> > +			/* WM8994 audio */
> > +			ldo3_reg: LDO3 {
> > +				regulator-name = "VCC_1.8V_AP";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* Unknown */
> > +			ldo5_reg: LDO5 {
> > +				regulator-name = "VCC_1.8V_IO";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* CSI IP block */
> > +			ldo8_reg: LDO8 {
> > +				regulator-name = "VMIPI_1.0V";
> > +				regulator-min-microvolt = <1000000>;
> > +				regulator-max-microvolt = <1000000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* IR LED on/off */
> > +			ldo9_reg: LDO9 {
> > +				regulator-name = "VLED_IC_1.9V";
> > +				regulator-min-microvolt = <1950000>;
> > +				regulator-max-microvolt = <1950000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* CSI IP block */
> > +			ldo10_reg: LDO10 {
> > +				regulator-name = "VMIPI_1.8V";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* Unknown */
> > +			ldo11_reg: LDO11 {
> > +				regulator-name = "VABB1_1.9V";
> > +				regulator-min-microvolt = <1950000>;
> > +				regulator-max-microvolt = <1950000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* USB OTG */
> > +			ldo12_reg: LDO12 {
> > +				regulator-name = "VUOTG_3.0V";
> > +				regulator-min-microvolt = <3000000>;
> > +				regulator-max-microvolt = <3000000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* Unknown */
> > +			ldo14_reg: LDO14 {
> > +				regulator-name = "VABB2_1.9V";
> > +				regulator-min-microvolt = <1950000>;
> > +				regulator-max-microvolt = <1950000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* Camera ISX012 */
> > +			ldo18_reg: LDO18 {
> > +				regulator-name = "CAM_IO_1.8V";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* Camera S5K6A3 */
> > +			ldo19_reg: LDO19 {
> > +				regulator-name = "VT_CORE_1.8V";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* MMC2 */
> > +			ldo21_reg: LDO21 {
> > +				regulator-name = "VTF_2.8V";
> > +				regulator-min-microvolt = <2800000>;
> > +				regulator-max-microvolt = <2800000>;
> > +				maxim,ena-gpios = <&gpy2 0 GPIO_ACTIVE_HIGH>;
> > +			};
> > +
> > +			/* ADC */
> > +			ldo23_reg: LDO23 {
> > +				regulator-name = "VDD_ADC_3.3V";
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* Camera S5K6A3 */
> > +			ldo24_reg: LDO24 {
> > +				regulator-name = "CAM_A2.8V";
> > +				regulator-min-microvolt = <2800000>;
> > +				regulator-max-microvolt = <2800000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* IR LED sending */
> > +			ldo25_reg: LDO25 {
> > +				regulator-name = "VLED_3.3V";
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			/* Camera ISX012 */
> > +			ldo26_reg: LDO26 {
> > +				regulator-name = "3MP_AF_2.8V";
> > +				regulator-min-microvolt = <2800000>;
> > +				regulator-max-microvolt = <2800000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			buck1_reg: BUCK1 {
> > +				regulator-name = "VDD_MIF";
> > +				regulator-min-microvolt = <850000>;
> > +				regulator-max-microvolt = <1050000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +			};
> > +
> > +			buck2_reg: BUCK2 {
> > +				regulator-name = "VDD_ARM";
> > +				regulator-min-microvolt = <850000>;
> > +				regulator-max-microvolt = <1500000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +			};
> > +
> > +			buck3_reg: BUCK3 {
> > +				regulator-name = "VDD_INT";
> > +				regulator-min-microvolt = <850000>;
> > +				regulator-max-microvolt = <1100000>;
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +			};
> > +
> > +			buck4_reg: BUCK4 {
> > +				regulator-name = "VDD_G3D";
> > +				regulator-min-microvolt = <850000>;
> > +				regulator-max-microvolt = <1075000>;
> > +				regulator-boot-on;
> > +			};
> > +
> > +			buck9_reg: BUCK9 {
> > +				regulator-name = "3MP_CORE_1.2V";
> > +				regulator-min-microvolt = <1200000>;
> > +				regulator-max-microvolt = <1200000>;
> 
> Empty line to match the other nodes.
> 

Done.

> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +

(...)

> > +
> > +&pinctrl_1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&sleep1>;
> > +
> > +	uart_sel: uart-sel {
> > +		samsung,pins = "gpl2-7";
> > +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> > +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> > +		samsung,pin-val = <1>;
> > +		/* 0 = CP, 1 = AP (serial output) */
> > +	};
> > +
> > +	gpio_keys: gpio-keys {
> > +		samsung,pins = "gpx2-2", "gpx2-7", "gpx3-3";
> > +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> > +	};
> > +
> > +	wifi_host_wake: wifi-host-wake {
> > +		samsung,pins = "gpx2-5";
> > +		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
> > +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> > +	};
> > +
> > +	bt_shutdown: bt-shutdown {
> > +		samsung,pins = "gpl0-6";
> > +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> > +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> > +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> > +		samsung,pin-val = <1>;
> > +	};
> > +
> > +	bt_device_wakeup: bt-device-wakeup {
> > +		samsung,pins = "gpx3-1";
> 
> Please order the nodes in pinctrl by pins (first entry), so:
> 
> sd3-wifi {
> 	samsung,pins = "gpk3-3",  ...
> }
> ...
> bt-shutdown {
> 	samsung,pins = "gpl0-6";
> }
> ...
> gpx0
> gpx2
> gpx3
> 
> etc.
> 

Done.

> 
> Best regards,
> Krzysztof

Cheers
Martin
