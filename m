From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and
 SSDK-GH7 board
Date: Wed, 12 Mar 2014 13:31:56 +0900
Message-ID: <01c501cf3dac$022879b0$06796d10$@samsung.com>
References: <1394491879-5320-1-git-send-email-kgene.kim@samsung.com>
 <1394491879-5320-2-git-send-email-kgene.kim@samsung.com>
 <20140311182922.GD3263@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43478 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866AbaCLEcC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Mar 2014 00:32:02 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2B00MEM39BMX10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Mar 2014 13:32:00 +0900 (KST)
In-reply-to: <20140311182922.GD3263@e106331-lin.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Rutland' <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Catalin Marinas' <Catalin.Marinas@arm.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Ilho Lee' <ilho215.lee@samsung.com>

Mark Rutland wrote:
> 
Hi Mark,

> On Mon, Mar 10, 2014 at 10:51:17PM +0000, Kukjin Kim wrote:
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > ---
> >  arch/arm64/boot/dts/samsung-gh7.dtsi     | 106
> +++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/samsung-ssdk-gh7.dts |  26 ++++++++
> >  2 files changed, 132 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/samsung-gh7.dtsi
> >  create mode 100644 arch/arm64/boot/dts/samsung-ssdk-gh7.dts
> >
> > diff --git a/arch/arm64/boot/dts/samsung-gh7.dtsi
> b/arch/arm64/boot/dts/samsung-gh7.dtsi
> > new file mode 100644
> > index 0000000..b5e8488
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/samsung-gh7.dtsi
> > @@ -0,0 +1,106 @@
> > +/*
> > + * SAMSUNG GH7 SoC device tree source
> > + *
> > + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> > + *		http://www.samsung.com
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > +*/
> > +
> > +/memreserve/ 0x80000000 0x0C400000;
> 
> Please have a comment as to what this memreserve is intended to protect.
> This is very large, and we don't want pointless memreserves.
> 
Well, you mean I need to comment about each reserved memory area?

We need the reserved memory for EL3 monitor, UEFI services, secure
interpreter, hypervisor and Scan-chain for debug...BTW isn't it depending on
each hardware platform and usage model?

Just note, I will change the reserve memory area and size. From at
0xf8000000 and size is 128MB(0x8000000).

> What address does the kernel end up getting loaded at on this board?
> 
We load the kernel image from at 0x80080000 after changing the reserve
memory area.

> > +
> > +/ {
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	aliases {
> > +		serial0 = "/amba/uart@12c00000";
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <2>;
> > +		#size-cells = <0>;
> > +
> > +		cpu@000 {
> > +			device_type = "cpu";
> > +			compatible = "arm,armv8";
> 
> The "arm,armv8" should be a fallback rather than the only entry. The
> precise core should be first (see arch/arm64/boot/dts/apm-storm.dtsi for
> an example).
> 
Well, do I really need another name if GH7 has just 'ARMv8 core' exactly?

> > +			reg = <0x0 0x000>;
> 
> Any reason for padding these to three hexadecimal digits (in both the
> reg and unit-address)?
> 
Yes, I already commented on Olof's question before, other cores will be
added and it should be separated from this.

> > +			enable-method = "spin-table";
> > +			cpu-release-addr = <0x0 0x8000fff8>;
> > +		};
> > +		cpu@001 {
> > +			device_type = "cpu";
> > +			compatible = "arm,armv8";
> > +			reg = <0x0 0x001>;
> > +			enable-method = "spin-table";
> > +			cpu-release-addr = <0x0 0x8000fff8>;
> > +		};
> > +		cpu@002 {
> > +			device_type = "cpu";
> > +			compatible = "arm,armv8";
> > +			reg = <0x0 0x002>;
> > +			enable-method = "spin-table";
> > +			cpu-release-addr = <0x0 0x8000fff8>;
> > +		};
> > +		cpu@003 {
> > +			device_type = "cpu";
> > +			compatible = "arm,armv8";
> > +			reg = <0x0 0x003>;
> > +			enable-method = "spin-table";
> > +			cpu-release-addr = <0x0 0x8000fff8>;
> > +		};
> > +	};
> > +
> > +	gic: interrupt-controller@1C000000 {
> > +		compatible = "arm,cortex-a15-gic";
> 
> We should have a more specific compatible string early in the list here
> too.
> 
Well, I think more specific compatible string is not required for gic, there
were discussion about using another compatible string for gic-v2. And
cortex-a15-gic should be fine at this moment and if another name is required
as per previous discussion, we will then.

> > +		#interrupt-cells = <3>;
> > +		interrupt-controller;
> > +		reg = <0x0 0x1C001000 0 0x1000>,	/* GIC Dist */
> > +		      <0x0 0x1C002000 0 0x1000>,	/* GIC CPU */
> > +		      <0x0 0x1C004000 0 0x2000>,	/* GIC VCPU Control
*/
> > +		      <0x0 0x1C006000 0 0x2000>;	/* GIC VCPU */
> > +		interrupts = <1 9 0xf04>;	/* GIC Maintenence IRQ */
> > +	};
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts = <1 13 0xff01>,	/* Secure Phys IRQ */
> > +			     <1 14 0xff01>,	/* Non-secure Phys IRQ */
> > +			     <1 11 0xff01>,	/* Virt IRQ */
> > +			     <1 10 0xff01>;	/* Hyp IRQ */
> > +	};
> > +
> > +	pmu {
> > +		compatible = "arm,armv8-pmuv3";
> 
> This is missing a specific compatible string.
> 
I don't know why I need another specific compatible string here because I
thought the 'armv8-pmuv3' is enough.

> > +		interrupts = <0 294 0>,
> > +			     <0 295 0>,
> > +			     <0 296 0>,
> > +			     <0 297 0>,
> > +			     <0 298 0>,
> > +			     <0 299 0>,
> > +			     <0 300 0>,
> > +			     <0 301 0>;
> > +	};
> 
> There are four CPUs described, yet eight interrupts here. There should
> be one per CPU.
> 
Yes right. I added them here by mistake, the other four interrupts will be
used for other 4 cores will be added later though.

> > +
> > +	amba {
> > +		compatible = "arm,amba-bus";
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		serial@12c00000 {
> > +			compatible = "arm,pl011", "arm,primecell";
> > +			reg = <0 0x12c00000 0 0x10000>;
> > +			interrupts = <0 418 0>;
> > +		};
> > +
> > +		serial@12c20000 {
> > +			compatible = "arm,pl011", "arm,primecell";
> > +			reg = <0 0x12c20000 0 0x10000>;
> > +			interrupts = <0 420 0>;
> > +		};
> 
> These are both missing required clocks.
> 
Yes right.

> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/samsung-ssdk-gh7.dts
> b/arch/arm64/boot/dts/samsung-ssdk-gh7.dts
> > new file mode 100644
> > index 0000000..47afbc4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/samsung-ssdk-gh7.dts
> > @@ -0,0 +1,26 @@
> > +/*
> > + * SAMSUNG SSDK-GH7 board device tree source
> > + *
> > + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> > + *		http://www.samsung.com
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > +*/
> > +
> > +/dts-v1/;
> > +#include "samsung-gh7.dtsi"
> > +
> > +/ {
> > +	model = "SAMSUNG SSDK-GH7 board based on GH7 SoC";
> 
> Is the "based on GH7 SoC" part necessary? Does the "SSDK-GH7" not give
> that away?
> 
In this case, yes, SSDK-GH7 is enough but I though, in case of different
board adding what SoC is used on the board in that is useful. Anyway, OK.

Thanks,
Kukjin
