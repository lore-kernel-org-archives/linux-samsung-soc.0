From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to exynos5250-arndale.dts
Date: Fri, 10 May 2013 09:33:59 +0200
Message-ID: <1853757.ubr759t9No@flatron>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org> <CAD025yQ+vnNc1RqoqoBw9JqYUp6aAY2wTowhVyV+zoDZq9sJ6g@mail.gmail.com> <CAD025ySx39kOphk3BNrnM+i7-9KHQr607cRYZXKa7uJ6GBXSiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:54852 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893Ab3EJHeF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 May 2013 03:34:05 -0400
Received: by mail-ea0-f173.google.com with SMTP id d10so1980990eaj.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2013 00:34:02 -0700 (PDT)
In-Reply-To: <CAD025ySx39kOphk3BNrnM+i7-9KHQr607cRYZXKa7uJ6GBXSiA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, "kgene.kim" <kgene.kim@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, InKi Dae <inki.dae@samsung.com>

On Friday 10 of May 2013 11:57:34 Vikas Sajjan wrote:
> Hi Olof,
> 
> On 10 May 2013 11:51, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> > Hi Olof,
> > 
> > On 10 May 2013 11:08, Olof Johansson <olof@lixom.net> wrote:
> >> On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan
> >> <vikas.sajjan@linaro.org>
> >> 
> >> wrote:
> >> > Hi Tomasz,
> >> > 
> >> > On 10 May 2013 05:35, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> >> >> Hi Vikas,
> >> >> 
> >> >> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
> >> >> > Adds display timing node for a DP panel to Arndale Board DTS
> >> >> > file
> >> >> > 
> >> >> > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> >> >> > ---
> >> >> > 
> >> >> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16
> >> >> >  ++++++++++++++++
> >> >> >  1 file changed, 16 insertions(+)
> >> >> > 
> >> >> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> >> >> > b/arch/arm/boot/dts/exynos5250-arndale.dts index
> >> >> > f68b820..c831a5c
> >> >> > 100644
> >> >> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> >> >> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> >> >> > @@ -459,4 +459,20 @@
> >> >> > 
> >> >> >               samsung,lane-count = <4>;
> >> >> >       
> >> >> >       };
> >> >> > 
> >> >> > +     display-timings {
> >> >> > +             native-mode = <&timing0>;
> >> >> > +             timing0: timing@0 {
> >> >> > +                     /* 2560x1600 DP panel */
> >> >> > +                     clock-frequency = <50000>;
> >> >> > +                     hactive = <2560>;
> >> >> > +                     vactive = <1600>;
> >> >> > +                     hfront-porch = <48>;
> >> >> > +                     hback-porch = <80>;
> >> >> > +                     hsync-len = <32>;
> >> >> > +                     vback-porch = <16>;
> >> >> > +                     vfront-porch = <8>;
> >> >> > +                     vsync-len = <6>;
> >> >> > +             };
> >> >> > +     };
> >> >> 
> >> >> What display are those timings used for? Shouldn't they be placed
> >> 
> >> inside
> >> 
> >> >> node of that display?
> >> > 
> >> > This timing information will be used parsed by the FIMD probe with
> >> > the
> >> 
> >> help
> >> 
> >> > of "Video Helper function"  as done in this link
> >> 
> >> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/c
> >> ommit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0
> >> 
> >> That function passes in a device node pointer to the FIMD device
> >> node,
> >> and only looks for a display-timings node under there. Tomasz is
> >> right, as far as I can tell.
> >> 
> >> Placing display timings at the root of the device tree seems
> >> completely
> >> wrong.
> >> 
> >>         I referred this "
> 
> Documentation/devicetree/bindings/video/display-timing.txt" for example
> 
>             here it dosen't mention about whether display timings node
> can be placed at the root of the device tree or NOT.
>  Not sure how we should be placing the node then.

I think this is pretty obvious.

Imagine a bit more complex case: a board has two video outputs (let's say 
FIMD0 and FIMD1), each connected to a completely different display. This 
means that each display needs different timings.

How would you know which timings to use if all of them were be placed 
under the root node?

Best regards,
Tomasz
