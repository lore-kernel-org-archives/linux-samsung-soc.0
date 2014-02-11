From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and
 SSDK-GH7 board
Date: Tue, 11 Feb 2014 15:36:27 -0800
Message-ID: <CAOesGMjE=zOStKoZQhYLhYtL_aWD73DcF4w6STboZPMfHkLtxA@mail.gmail.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
	<1392100183-30930-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:43969 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788AbaBKXg2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 18:36:28 -0500
Received: by mail-qc0-f177.google.com with SMTP id i8so13970130qcq.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2014 15:36:27 -0800 (PST)
In-Reply-To: <1392100183-30930-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <marc.zyngier@arm.com>

Hi,

Besides what Mark Rutland already commented on:

On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> +/ {
> +       model = "SAMSUNG GH7";
> +       compatible = "samsung,gh7";

Model and compatible in the dtsi should probably always be overridden
by a dts that includes it, so there's little use in having it here.

> +       interrupt-parent = <&gic>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       cpus {
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +
> +               cpu@000 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x0 0x000>;

No need to zero-pad cpu numbers in unit address or reg.

> +                       enable-method = "spin-table";
> +                       cpu-release-addr = <0x0 0x8000fff8>;
> +               };
> +               cpu@001 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x0 0x001>;
> +                       enable-method = "spin-table";
> +                       cpu-release-addr = <0x0 0x8000fff8>;
> +               };
> +               cpu@002 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x0 0x002>;
> +                       enable-method = "spin-table";
> +                       cpu-release-addr = <0x0 0x8000fff8>;
> +               };
> +               cpu@003 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x0 0x003>;
> +                       enable-method = "spin-table";
> +                       cpu-release-addr = <0x0 0x8000fff8>;
> +               };
> +       };
> +
> +       gic: interrupt-controller@1C000000 {
> +               compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";

This looks incorrect -- you should at the very least have a more
specific one than a15-gic? Marc?

> +               #interrupt-cells = <3>;
> +               #address-cells = <0>;
> +               interrupt-controller;
> +               reg = <0x0 0x1C001000 0 0x1000>,        /* GIC Dist */
> +                     <0x0 0x1C002000 0 0x1000>,        /* GIC CPU */
> +                     <0x0 0x1C004000 0 0x2000>,        /* GIC VCPU Control */
> +                     <0x0 0x1C006000 0 0x2000>;        /* GIC VCPU */
> +               interrupts = <1 9 0xf04>;       /* GIC Maintenence IRQ */
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupts = <1 13 0xff01>,     /* Secure Phys IRQ */
> +                            <1 14 0xff01>,     /* Non-secure Phys IRQ */
> +                            <1 11 0xff01>,     /* Virt IRQ */
> +                            <1 10 0xff01>;     /* Hyp IRQ */
> +               clock-frequency = <100000000>;
> +       };
> +
> +       pmu {
> +               compatible = "arm,armv8-pmuv3";
> +               interrupts = <0 294 8>,
> +                            <0 295 8>,
> +                            <0 296 8>,
> +                            <0 297 8>,
> +                            <0 298 8>,
> +                            <0 299 8>,
> +                            <0 300 8>,
> +                            <0 301 8>;
> +       };
> +
> +       amba {
> +               compatible = "arm,amba-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               serial@12c00000 {
> +                       compatible = "arm,pl011", "arm,primecell";
> +                       reg = <0x12c00000 0x10000>;
> +                       interrupts = <418>;
> +               };
> +
> +               serial@12c20000 {
> +                       compatible = "arm,pl011", "arm,primecell";
> +                       reg = <0x12c20000 0x10000>;
> +                       interrupts = <420>;
> +               };
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/samsung-ssdk-gh7.dts b/arch/arm64/boot/dts/samsung-ssdk-gh7.dts
> new file mode 100644
> index 0000000..47afbc4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/samsung-ssdk-gh7.dts
> @@ -0,0 +1,26 @@
> +/*
> + * SAMSUNG SSDK-GH7 board device tree source
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + *             http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +#include "samsung-gh7.dtsi"
> +
> +/ {
> +       model = "SAMSUNG SSDK-GH7 board based on GH7 SoC";
> +       compatible = "samsung,ssdk-gh7", "samsung,gh7";
> +
> +       chosen {
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x00000000 0x80000000 0 0x80000000>;
> +       };
> +};
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
