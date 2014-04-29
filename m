From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH-RESEND] ARM: dts: Add arm-pmu node for exynos4412
Date: Tue, 29 Apr 2014 15:56:45 +0900
Message-ID: <00f501cf6378$2efd6ee0$8cf84ca0$@samsung.com>
References: <1376044914-1759-1-git-send-email-chanho61.park@samsung.com>
 <535F41B1.70404@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34819 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755268AbaD2G4r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 02:56:47 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S00GBE5YL1J00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Apr 2014 15:56:45 +0900 (KST)
In-reply-to: <535F41B1.70404@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hi Tushar,

> -----Original Message-----
> From: Tushar Behera [mailto:tushar.behera@linaro.org]
> Sent: Tuesday, April 29, 2014 3:08 PM
> To: Chanho Park; kgene.kim@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; thomas.abraham@linaro.org; linux-
> arm-kernel@lists.infradead.org; Kyungmin Park
> Subject: Re: [PATCH-RESEND] ARM: dts: Add arm-pmu node for exynos4412
> 
> On 08/09/2013 04:11 PM, Chanho Park wrote:
> > The Exynos4412 has 4 cpus and each has a performance counter.
> > Thus, we should define 4 interrupts which are combined by irq-combiner
> for arm
> > pmu.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4412.dtsi |    6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412.dtsi
> b/arch/arm/boot/dts/exynos4412.dtsi
> > index e743e67..cfad655 100644
> > --- a/arch/arm/boot/dts/exynos4412.dtsi
> > +++ b/arch/arm/boot/dts/exynos4412.dtsi
> > @@ -35,6 +35,12 @@
> >  			     <0 107 0>, <0 108 0>, <0 48 0>, <0 42 0>;
> >  	};
> >
> > +	pmu {
> > +		compatible = "arm,cortex-a9-pmu";
> > +		interrupt-parent = <&combiner>;
> > +		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
> > +	};
> > +
> >  	mct@10050000 {
> >  		compatible = "samsung,exynos4412-mct";
> >  		reg = <0x10050000 0x800>;
> >
> 
> Tested on Exynos4412 based Origen-Quad board. You would required to
> rebase it on latest code though.
> 
> Tested-by: Tushar Behera <tushar.behera@linaro.org>

You took old patch which I cannot remember now:) Actually, arm-pmu support
for exynos4412 was already merged in the latest code.[1]. I sent a clean-up
patch recently[2]. It could be more readable for exynos4412.
Thanks.

[1] : https://lkml.org/lkml/2014/3/12/27
[2] : http://www.spinics.net/linux/lists/arm-kernel/msg325565.html

Best Regards,
Chanho Park
