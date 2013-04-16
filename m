From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 5/6] ARM: dts: Add basic dts include files for Samsung
 S3C64xx SoCs
Date: Tue, 16 Apr 2013 15:19 +0200
Message-ID: <1829212.6niSeTsyIU@amdc1227>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
 <1366060483-20342-6-git-send-email-tomasz.figa@gmail.com>
 <516D4D76.2010409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57713 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753783Ab3DPNTZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 09:19:25 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLC00BKONNHQSL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Apr 2013 22:19:23 +0900 (KST)
In-reply-to: <516D4D76.2010409@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Mark Rutland <mark.rutland@arm.com>

On Tuesday 16 of April 2013 08:09:10 Rob Herring wrote:
> On 04/15/2013 04:14 PM, Tomasz Figa wrote:
> > This patch adds basic device tree definitions for Samsung S3C64xx SoCs.
> > 
> > Since all the SoCs in the series are very similar, the files are created
> > hierarchically - one file for the whole series and then separate files
> > for particular SoCs including the common one.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> > 
> >  arch/arm/boot/dts/s3c6400.dtsi         |  33 ++
> >  arch/arm/boot/dts/s3c6410.dtsi         |  33 ++
> >  arch/arm/boot/dts/s3c64xx-pinctrl.dtsi | 683
> >  +++++++++++++++++++++++++++++++++ arch/arm/boot/dts/s3c64xx.dtsi        
> >  | 136 +++++++
> >  4 files changed, 885 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/s3c6400.dtsi
> >  create mode 100644 arch/arm/boot/dts/s3c6410.dtsi
> >  create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi
> >  create mode 100644 arch/arm/boot/dts/s3c64xx.dtsi
> 
> [...]
> 
> > +
> > +	vic0: interrupt-controller@71200000 {
> 
> These nodes should be off a "simple-bus" node.

Hmm, is there any reason behind it?

I thought simple bus was just a convenient helper to represent hierarchical 
bus structures if one has a need to do so.

Best regards,
Tomasz

> Rob
> 
> > +		compatible = "arm,pl192-vic";
> > +		interrupt-controller;
> > +		reg = <0x71200000 0x1000>;
> > +		#interrupt-cells = <1>;
> > +	};
> > +
> > +	vic1: interrupt-controller@71300000 {
> > +		compatible = "arm,pl192-vic";
> > +		interrupt-controller;
> > +		reg = <0x71300000 0x1000>;
> > +		#interrupt-cells = <1>;
> > +	};
> > +
> > +	pinctrl0: pinctrl@7f008000 {
> > +		compatible = "samsung,s3c64xx-pinctrl";
> > +		reg = <0x7f008000 0x1000>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <21>;
> > +
> > +		pctrl_int_map: pinctrl-interrupt-map {
> > +			interrupt-map = <0 &vic0 0>,
> > +					<1 &vic0 1>,
> > +					<2 &vic1 0>,
> > +					<3 &vic1 1>;
> > +			#address-cells = <0>;
> > +			#size-cells = <0>;
> > +			#interrupt-cells = <1>;
> > +		};
> > +
> > +		wakeup-interrupt-controller {
> > +			compatible = "samsung,s3c64xx-wakeup-eint";
> > +			interrupts = <0>, <1>, <2>, <3>;
> > +			interrupt-parent = <&pctrl_int_map>;
> > +		};
> > +	};
> > +
> > +	pwm: pwm@7f006000 {
> > +		compatible = "samsung,s3c6400-pwm";
> > +		reg = <0x7f006000 0x1000>;
> > +		interrupt-parent = <&vic0>;
> > +		interrupts = <23>, <24>, <25>, <27>, <28>;
> > +		samsung,pwm-outputs = <0>, <1>;
> > +		#pwm-cells = <3>;
> > +		status = "disabled";
> > +	};
> > +
> > +	uart0: serial@7f005000 {
> > +		compatible = "samsung,s3c6400-uart";
> > +		reg = <0x7f005000 0x100>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <5>;
> > +		status = "disabled";
> > +	};
> > +
> > +	uart1: serial@7f005400 {
> > +		compatible = "samsung,s3c6400-uart";
> > +		reg = <0x7f005400 0x100>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <6>;
> > +		status = "disabled";
> > +	};
> > +
> > +	uart2: serial@7f005800 {
> > +		compatible = "samsung,s3c6400-uart";
> > +		reg = <0x7f005800 0x100>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <7>;
> > +		status = "disabled";
> > +	};
> > +
> > +	uart3: serial@7f005c00 {
> > +		compatible = "samsung,s3c6400-uart";
> > +		reg = <0x7f005c00 0x100>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <8>;
> > +		status = "disabled";
> > +	};
> > +
> > +	sdhci0: sdhci@7c200000 {
> > +		compatible = "samsung,s3c6410-sdhci";
> > +		reg = <0x7c200000 0x100>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <24>;
> > +		status = "disabled";
> > +	};
> > +
> > +	sdhci1: sdhci@7c300000 {
> > +		compatible = "samsung,s3c6410-sdhci";
> > +		reg = <0x7c300000 0x100>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <25>;
> > +		status = "disabled";
> > +	};
> > +
> > +	sdhci2: sdhci@7c400000 {
> > +		compatible = "samsung,s3c6410-sdhci";
> > +		reg = <0x7c400000 0x100>;
> > +		interrupt-parent = <&vic1>;
> > +		interrupts = <17>;
> > +		status = "disabled";
> > +	};
> > +};
> > +
> > +/include/ "s3c64xx-pinctrl.dtsi"
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
