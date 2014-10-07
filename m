From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Specify Odroid X2/U3 audio clock parents and
 rates
Date: Tue, 07 Oct 2014 10:51:44 +0900
Message-ID: <007701cfe1d1$3f4c1940$bde44bc0$@kernel.org>
References: <1410360223-18363-1-git-send-email-s.nawrocki@samsung.com>
 <5432C5C5.7020206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16779 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751482AbaJGBvq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Oct 2014 21:51:46 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0ND100APRX68RF80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Oct 2014 10:51:44 +0900 (KST)
In-reply-to: <5432C5C5.7020206@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com

Sylwester Nawrocki wrote:
> 
> On 10/09/14 16:43, Sylwester Nawrocki wrote:
> > This ensures the core and the audio subsystem clocks are configured
> > properly, as expected by the sound machine driver. These bits are
> > missing to obtain proper audio sample rates in kernel v3.17, where
> > audio support for Odroid X2/U3 was first added.
> >
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > ---
> > It would be good to have it applied as a fix for v3.17.
> 
> Anything happened to this patch ? I can't see it neither in Linus' nor
> -next tree. And we are already at 3.18 merge window.
> 
Hi Sylwester,

Sorry about that. I'll queue this one into fixes for -3.18 and stable maybe
+3.17 only if stable-3.17 is available...

Thanks for your gentle reminder.

- Kukjin

> >  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-
> common.dtsi
> > index adadaf9..b40f766 100644
> > --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> > @@ -45,6 +45,16 @@
> >  		compatible = "samsung,odroidx2-audio";
> >  		samsung,i2s-controller = <&i2s0>;
> >  		samsung,audio-codec = <&max98090>;
> > +		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
> > +				<&clock_audss EXYNOS_MOUT_I2S>,
> > +				<&clock_audss EXYNOS_DOUT_SRP>,
> > +				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
> > +		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
> > +				<&clock_audss EXYNOS_MOUT_AUDSS>;
> > +		assigned-clock-rates = <0>,
> > +				<0>,
> > +				<192000000>,
> > +				<19200000>;
> >  	};
> >
> >  	mmc@12550000 {
> > --
> > 1.7.9.5
