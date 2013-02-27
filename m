From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: Add FIMD node to exynos5
Date: Wed, 27 Feb 2013 14:56:37 +0530
Message-ID: <CAL1wa8fuP8Gn2rufCo_85NzGbsWdO3mmNEqSwgvC694-_YTzWA@mail.gmail.com>
References: <1361877940-8559-1-git-send-email-l.krishna@samsung.com>
 <1361877940-8559-2-git-send-email-l.krishna@samsung.com> <CAGm_ybjsuTr-M60B025kjwfbaeRXMkBMqmmLKrfMLRqjpD_2zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:42025 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755344Ab3B0J06 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 04:26:58 -0500
Received: by mail-vc0-f180.google.com with SMTP id fo13so235834vcb.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 01:26:57 -0800 (PST)
In-Reply-To: <CAGm_ybjsuTr-M60B025kjwfbaeRXMkBMqmmLKrfMLRqjpD_2zQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, sunil joshi <joshi@samsung.com>

Hello Vikas,

On Wed, Feb 27, 2013 at 2:15 PM, Vikas Sajjan <sajjan.linux@gmail.com> wrote:
>
> Hi Leela,
>
> On Tue, Feb 26, 2013 at 4:55 PM, Leela Krishna Amudala
> <l.krishna@samsung.com> wrote:
> > This adds common FIMD device node for all Exynos5 SoCs.
> >
> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos5250.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > b/arch/arm/boot/dts/exynos5250.dtsi
> > index 3acf594..0ee4706 100644
> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > @@ -583,4 +583,11 @@
> >                 reg = <0x14450000 0x10000>;
> >                 interrupts = <0 94 0>;
> >         };
> > +
> > +       fimd {
> > +               compatible = "samsung,exynos5-fimd";
> I think we can modify this as "samsung,exynos5250-fimd", please refer
> to the discussion at https://patchwork.kernel.org/patch/2144861/

Then in that case this compatible string has to be modify in driver also.

Best wishes,
Leela Krishna Amudala.

> > +               interrupt-parent = <&combiner>;
> > +               reg = <0x14400000 0x40000>;
> > +               interrupts = <18 5>, <18 4>, <18 6>;
> > +       };
> >  };
> > --
> > 1.8.0
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
