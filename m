From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/7] ARM: exynos: add missing properties for combiner IRQs
Date: Mon, 15 Apr 2013 10:36:35 +0200
Message-ID: <201304151036.35228.arnd@arndb.de>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de> <1365775405-115297-4-git-send-email-arnd@arndb.de> <CAJuYYwSJyDt7aBLyY0S8LUaGf9-VwuSeM_n3V1UuBzgTyDyTUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:56636 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933777Ab3DOIgk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 04:36:40 -0400
In-Reply-To: <CAJuYYwSJyDt7aBLyY0S8LUaGf9-VwuSeM_n3V1UuBzgTyDyTUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Monday 15 April 2013, Thomas Abraham wrote:
> On 12 April 2013 19:33, Arnd Bergmann <arnd@arndb.de> wrote:
> > The exynos combiner irqchip needs to find the parent interrupts
> > and needs to know their number, so add the missing properties
> > for exynos4 as they were already present for exynos5.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/boot/dts/exynos4210.dtsi | 1 +
> >  arch/arm/boot/dts/exynos4212.dtsi | 9 +++++++++
> >  arch/arm/boot/dts/exynos4412.dtsi | 9 +++++++++
> >  3 files changed, 19 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
> > index 15143bd..c102869 100644
> > --- a/arch/arm/boot/dts/exynos4210.dtsi
> > +++ b/arch/arm/boot/dts/exynos4210.dtsi
> > @@ -41,6 +41,7 @@
> >         };
> >
> >         combiner:interrupt-controller@10440000 {
> > +               combiner-nr = <16>;
> 
> The default value of the combiner-nr is case it is not specified is
> 16. The default value is documented in the bindings documentation.

Unfortunately, the driver now warns about a missing attribute, which
seems right. I also made the default "20" instead of "16" to cover the
other exynos4 chips. I'd say it's best to keep this one explicitly listed
even if it's optional.

> > +       interrupt-controller@10440000 {
> > +               combiner-nr = <20>;
> > +               interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> > +                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> > +                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> > +                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> > +                            <0 107 0>, <0 108 0>>, <0 48 0>, <0 42 0>;
> 
> Extra '>' for <0 108 0> can be removed.
> 
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org?

Thanks!
