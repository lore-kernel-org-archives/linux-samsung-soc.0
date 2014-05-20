From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCHv4 1/4] ARM: dts: exynos4: add PMU syscon node
Date: Tue, 20 May 2014 11:01:18 +0900
Message-ID: <011701cf73cf$63f61590$2be240b0$@samsung.com>
References: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
 <1399004769-31033-2-git-send-email-chanho61.park@samsung.com>
 <5374F447.9030102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57773 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752354AbaETCBV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 22:01:21 -0400
In-reply-to: <5374F447.9030102@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, k.debski@samsung.com

Hi Tomasz,

> -----Original Message-----
> From: Tomasz Figa [mailto:t.figa@samsung.com]
> Sent: Friday, May 16, 2014 2:07 AM
> To: Chanho Park; kgene.kim@samsung.com; linux-samsung-
> soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org; k.debski@samsung.com
> Subject: Re: [PATCHv4 1/4] ARM: dts: exynos4: add PMU syscon node
> 
> Hi Chanho,
> 
> When testing some other patches with this series applied I found one
> more issue. Please see below.
> 
> On 02.05.2014 06:26, Chanho Park wrote:
> > This patch adds a PMU(Power Management Unit) syscon node. This
> > should be required for USB Phy syscon regmap I/F.
> >
> > Cc: Kamil Debski <k.debski@samsung.com>
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > ---
> >  Documentation/devicetree/bindings/arm/samsung/pmu.txt | 3 +++
> >  arch/arm/boot/dts/exynos4.dtsi                        | 5 +++++
> >  arch/arm/boot/dts/exynos4x12.dtsi                     | 4 ++++
> >  3 files changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > index f1f1552..b562634 100644
> > --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > @@ -2,6 +2,9 @@ SAMSUNG Exynos SoC series PMU Registers
> >
> >  Properties:
> >   - compatible : should contain two values. First value must be one
> from following list:
> > +		   - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
> > +		   - "samsung,exynos4212-pmu" - for Exynos4212 SoC,
> > +		   - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
> 
> Here two compatible strings are specified, one for each SoC in 4x12
> family, but...
> 
> >  		   - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
> >  		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
> >  		second value must be always "syscon".
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> > index 2f8bcd0..264066f 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -110,6 +110,11 @@
> >  		reg = <0x10010000 0x400>;
> >  	};
> >
> > +	pmu_system_controller: system-controller@10020000 {
> > +		compatible = "samsung,exynos4210-pmu", "syscon";
> > +		reg = <0x10020000 0x4000>;
> > +	};
> > +
> >  	dsi_0: dsi@11C80000 {
> >  		compatible = "samsung,exynos4210-mipi-dsi";
> >  		reg = <0x11C80000 0x10000>;
> > diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
> b/arch/arm/boot/dts/exynos4x12.dtsi
> > index c4a9306..7f767f7 100644
> > --- a/arch/arm/boot/dts/exynos4x12.dtsi
> > +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> > @@ -119,6 +119,10 @@
> >  		interrupts = <0 72 0>;
> >  	};
> >
> > +	pmu_system_controller: system-controller@10020000 {
> > +		compatible = "samsung,exynos4x12-pmu", "syscon";
> 
> Here one node is added for both using an undocumented compatible string.
> Please fix this according to documentation.

OK. I forgot to change it. I'll update it.
Thanks.

Best Regards,
Chanho Park
