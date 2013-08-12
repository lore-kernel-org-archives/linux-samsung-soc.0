From: Chanho Park <chanho61.park@samsusng.com>
Subject: RE: [PATCHv2 2/5] ARM: dts: Add rotator node for exynos4210
Date: Mon, 12 Aug 2013 11:51:11 +0900
Message-ID: <000401ce9706$ce12f570$6a38e050$@samsusng.com>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
 <1376034053-31910-3-git-send-email-chanho61.park@samsung.com>
 <1559260.ljnrQXSjF1@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27671 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755511Ab3HLCvS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Aug 2013 22:51:18 -0400
In-reply-to: <1559260.ljnrQXSjF1@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Chanho Park' <chanho61.park@samsung.com>
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Hi Tomasz,

> -----Original Message-----
> From: Tomasz Figa [mailto:t.figa@samsung.com]
> Sent: Friday, August 09, 2013 9:57 PM
> To: Chanho Park
> Cc: inki.dae@samsung.com; kgene.kim@samsung.com; dri-
> devel@lists.freedesktop.org; kyungmin.park@samsung.com;
> mark.rutland@arm.com; l.stach@pengutronix.de; s.nawrocki@samsung.com;
> tomasz.figa@gmail.com; linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; Thomas Abraham
> Subject: Re: [PATCHv2 2/5] ARM: dts: Add rotator node for exynos4210
> 
> On Friday 09 of August 2013 16:40:50 Chanho Park wrote:
> > This patch adds a rotator node for exynos4210. The exynos4210 has
> > different limitation of image size compared with later chips.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4.dtsi |    9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi
> > b/arch/arm/boot/dts/exynos4.dtsi index 597cfcf..002b2b8 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -243,6 +243,15 @@
> >  		status = "disabled";
> >  	};
> >
> > +	rotator: rotator@12810000 {
> > +		compatible = "samsung,exynos4210-rotator";
> > +		reg = <0x12810000 0x1000>;
> > +		interrupts = <0 83 0>;
> > +		clocks = <&clock 278>;
> > +		clock-names = "rotator";
> > +		status = "disabled";
> 
> Does the rotator need any board-specific information to work? If no, it
> should not be disabled by default. Same comment goes to patch 4/5.

It does not have any board-specific information. I'll remove the status
node.
Thanks.

Best Regards,
Chanho Park
