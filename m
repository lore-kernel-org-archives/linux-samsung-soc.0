From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/7] ARM: exynos: add missing properties for combiner IRQs
Date: Mon, 15 Apr 2013 14:20:35 +0200
Message-ID: <201304151420.35843.arnd@arndb.de>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de> <201304151041.44805.arnd@arndb.de> <CAK9yfHwXYRqo2yG1moWvMnEmNWXCVL7a9eKzi2we=QmdpVsz-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:52989 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752607Ab3DOMUp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 08:20:45 -0400
In-Reply-To: <CAK9yfHwXYRqo2yG1moWvMnEmNWXCVL7a9eKzi2we=QmdpVsz-w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Monday 15 April 2013, Sachin Kamat wrote:
> >> > diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
> >> > index 36d4299..f83c3c1 100644
> >> > --- a/arch/arm/boot/dts/exynos4212.dtsi
> >> > +++ b/arch/arm/boot/dts/exynos4212.dtsi
> >> > @@ -26,6 +26,15 @@
> >> >                 cpu-offset = <0x8000>;
> >> >         };
> >> >
> >> > +       interrupt-controller@10440000 {
> >>
> >> Don't we need a node name here (combiner:interrupt-controller@10440000)?
> >
> > Why?
> 
> Since it is being referenced as "&combiner" by other bindings, i
> thought that was required.

The original definition actually comes from exynos4.dtsi. It's enough
to have the label in one place.

> >> We have a combiner node defined in exynos4x12.dtsi. With the bindings
> >> now defined separately in 4212 and 4412 dtsi files, probably the one
> >> in 4x12 could be dropped?
> >
> > I did not see that one, but it seems to have the wrong numbers in the last
> > four interrupt specifiers. I think it would be better to just fix that one
> > and keep using it.
> 
> OK. Do you want me to fix it and send as a patch or would you like to do it?

If you have a patch that works, you could just send it out, oetherwise I'd
do it.

	ARnd
