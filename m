From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 2/7] ARM: SAMSUNG: Add CLK Macro for clkdev support
Date: Wed, 28 Sep 2011 09:55:24 +0530
Message-ID: <CAAgF-Bdf59wBWqj43FhB9m3Oo9ZFyMEA1yfAf7b3_qnbARNLfw@mail.gmail.com>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
	<1316778827-24694-3-git-send-email-padma.v@samsung.com>
	<20110923202606.GT17169@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:33287 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120Ab1I1EZZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 00:25:25 -0400
Received: by wwf22 with SMTP id 22so8275665wwf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2011 21:25:24 -0700 (PDT)
In-Reply-To: <20110923202606.GT17169@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, jassisinghbrar@gmail.com, s.nawrocki@samsung.com, ben-linux@fluff.org

Hi Russell,

On Sat, Sep 24, 2011 at 1:56 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
>
> On Fri, Sep 23, 2011 at 05:23:42PM +0530, Padmavathi Venna wrote:
> > diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/=
plat-samsung/include/plat/clock.h
> > index 73c66d4..c864825 100644
> > --- a/arch/arm/plat-samsung/include/plat/clock.h
> > +++ b/arch/arm/plat-samsung/include/plat/clock.h
> > @@ -17,6 +17,13 @@
> >
> > =A0struct clk;
> >
> > +#define CLK(dev, con, ck) =A0 =A0\
> > + =A0 =A0 { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> > + =A0 =A0 =A0 =A0 =A0 =A0 .dev_id =3D dev, =A0\
> > + =A0 =A0 =A0 =A0 =A0 =A0 .con_id =3D con, =A0\
> > + =A0 =A0 =A0 =A0 =A0 =A0 .clk =3D ck, =A0 =A0 =A0\
> > + =A0 =A0 }
> > +
>
> How about a patch series which moves this to include/linux/clkdev.h,
> preferably called CLKDEV_INIT() ?
>
   Thanks for the review. I am currently working on preparing the patch=
 series
   as per your suggestion.

> There's versions of this already in:
> arch/arm/mach-ux500/clock.h
> arch/arm/mach-tegra/tegra2_clocks.c
> arch/arm/mach-nomadik/clock.c
> arch/arm/mach-davinci/clock.h
>
> so let's have it standardized instead of everyone inventing their own=
=2E
>
> (Remember, that's what we're supposed to already being looking out fo=
r
> since Linus' whinge about how ARM stuff tends to grow out of control.=
=2E.)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html

Best Regards
Padma
