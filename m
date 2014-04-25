From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: clean up arm-pmu node
Date: Fri, 25 Apr 2014 11:03:54 +0900
Message-ID: <00e201cf602a$9c8b6df0$d5a249d0$@samsung.com>
References: <1397480584-16195-1-git-send-email-chanho61.park@samsung.com>
 <53594416.4070601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29388 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408AbaDYCEA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 22:04:00 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4K006WUDQJF6D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Apr 2014 11:03:55 +0900 (KST)
In-reply-to: <53594416.4070601@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: 'Chanwoo Choi' <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org

Hi Tomasz,

> -----Original Message-----
> From: linux-arm-kernel [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Tomasz Figa
> Sent: Friday, April 25, 2014 2:04 AM
> To: Chanho Park; kgene.kim@samsung.com; linux-samsung-
> soc@vger.kernel.org
> Cc: Chanwoo Choi; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH] ARM: dts: exynos4: clean up arm-pmu node
> 
> Hi Chanho,
> 
> On 14.04.2014 15:03, Chanho Park wrote:
> > This patch cleans a arm-pmu node up for exynos4. Only exynos4412
> series
> > boards have four pmu interrupts. Rest of exynos4 boards, except 4412,
> have only
> > two pmu interrupts. Thus, we can define two interrupts in the
> > exynos4.dtsi and extends the interrupts only exynos4412.dtsi.
> >
> > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >   arch/arm/boot/dts/exynos4.dtsi    | 6 ++++++
> >   arch/arm/boot/dts/exynos4210.dtsi | 6 ------
> >   arch/arm/boot/dts/exynos4412.dtsi | 6 ++++++
> >   arch/arm/boot/dts/exynos4x12.dtsi | 6 ------
> >   4 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> > index e541ecb..6de978c 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -105,6 +105,12 @@
> >   		reg = <0x10440000 0x1000>;
> >   	};
> >
> > +	pmu {
> > +		compatible = "arm,cortex-a9-pmu";
> > +		interrupt-parent = <&combiner>;
> > +		interrupts = <2 2>, <3 2>;
> > +	};
> > +
> >   	sys_reg: syscon@10010000 {
> >   		compatible = "samsung,exynos4-sysreg", "syscon";
> >   		reg = <0x10010000 0x400>;
> > diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi
> > index cacf614..4e7610f 100644
> > --- a/arch/arm/boot/dts/exynos4210.dtsi
> > +++ b/arch/arm/boot/dts/exynos4210.dtsi
> > @@ -75,12 +75,6 @@
> >   		#clock-cells = <1>;
> >   	};
> >
> > -	pmu {
> > -		compatible = "arm,cortex-a9-pmu";
> > -		interrupt-parent = <&combiner>;
> > -		interrupts = <2 2>, <3 2>;
> > -	};
> > -
> >   	pinctrl_0: pinctrl@11400000 {
> >   		compatible = "samsung,exynos4210-pinctrl";
> >   		reg = <0x11400000 0x1000>;
> > diff --git a/arch/arm/boot/dts/exynos4412.dtsi
> b/arch/arm/boot/dts/exynos4412.dtsi
> > index 15d3c0a..e6af870 100644
> > --- a/arch/arm/boot/dts/exynos4412.dtsi
> > +++ b/arch/arm/boot/dts/exynos4412.dtsi
> > @@ -26,6 +26,12 @@
> >   		samsung,combiner-nr = <20>;
> >   	};
> >
> > +	pmu {
> > +		compatible = "arm,cortex-a9-pmu";
> > +		interrupt-parent = <&combiner>;
> 
> I guess you could omit the two properties above and let them be
> inherited from exynos4.dtsi.

Yes. It can be omitted in the exynos4412.dtsi. Thank you for your review.
I'll send V2 Patch.

Best Regards,
Chanho Park
