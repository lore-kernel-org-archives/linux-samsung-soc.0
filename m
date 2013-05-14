From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to
 exynos5250-arndale.dts
Date: Tue, 14 May 2013 15:25:24 +0200
Message-ID: <20130514132523.GA10292@pengutronix.de>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <CAD025yQ+vnNc1RqoqoBw9JqYUp6aAY2wTowhVyV+zoDZq9sJ6g@mail.gmail.com>
 <CAD025ySx39kOphk3BNrnM+i7-9KHQr607cRYZXKa7uJ6GBXSiA@mail.gmail.com>
 <1853757.ubr759t9No@flatron>
 <CAD025ySqUpGRpx0J61gsjKE_JPa+Mu444ETpd2USyikrNWj71w@mail.gmail.com>
 <CAD025yRyUY4GbFt-Soasj1QBsY4V1=qJZaG4Ww=FrT9UutNRfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:48600 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755848Ab3ENNZg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 09:25:36 -0400
Content-Disposition: inline
In-Reply-To: <CAD025yRyUY4GbFt-Soasj1QBsY4V1=qJZaG4Ww=FrT9UutNRfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Stephen Warren <swarren@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, s.hauer@pengutronix.de, Olof Johansson <olof@lixom.net>, "kgene.kim" <kgene.kim@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, InKi Dae <inki.dae@samsung.com>

Hi!

On Tue, May 14, 2013 at 06:40:00PM +0530, Vikas Sajjan wrote:
> Hi Steffen Trumtrar and Sascha Hauer,
> 
> Olof and Tomasz Figa have a concern in putting "display-timings"  as root
> node in device tree file.
> 
> 
> On 10 May 2013 13:45, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> 
> > HI Tomasz,
> >
> >
> > On 10 May 2013 13:03, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> >
> >> On Friday 10 of May 2013 11:57:34 Vikas Sajjan wrote:
> >> > Hi Olof,
> >> >
> >> > On 10 May 2013 11:51, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> >> > > Hi Olof,
> >> > >
> >> > > On 10 May 2013 11:08, Olof Johansson <olof@lixom.net> wrote:
> >> > >> On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan
> >> > >> <vikas.sajjan@linaro.org>
> >> > >>
> >> > >> wrote:
> >> > >> > Hi Tomasz,
> >> > >> >
> >> > >> > On 10 May 2013 05:35, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> >> > >> >> Hi Vikas,
> >> > >> >>
> >> > >> >> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
> >> > >> >> > Adds display timing node for a DP panel to Arndale Board DTS
> >> > >> >> > file
> >> > >> >> >
> >> > >> >> > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> >> > >> >> > ---
> >> > >> >> >
> >> > >> >> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16
> >> > >> >> >  ++++++++++++++++
> >> > >> >> >  1 file changed, 16 insertions(+)
> >> > >> >> >
> >> > >> >> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> >> > >> >> > b/arch/arm/boot/dts/exynos5250-arndale.dts index
> >> > >> >> > f68b820..c831a5c
> >> > >> >> > 100644
> >> > >> >> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> >> > >> >> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> >> > >> >> > @@ -459,4 +459,20 @@
> >> > >> >> >
> >> > >> >> >               samsung,lane-count = <4>;
> >> > >> >> >
> >> > >> >> >       };
> >> > >> >> >
> >> > >> >> > +     display-timings {
> >> > >> >> > +             native-mode = <&timing0>;
> >> > >> >> > +             timing0: timing@0 {
> >> > >> >> > +                     /* 2560x1600 DP panel */
> >> > >> >> > +                     clock-frequency = <50000>;
> >> > >> >> > +                     hactive = <2560>;
> >> > >> >> > +                     vactive = <1600>;
> >> > >> >> > +                     hfront-porch = <48>;
> >> > >> >> > +                     hback-porch = <80>;
> >> > >> >> > +                     hsync-len = <32>;
> >> > >> >> > +                     vback-porch = <16>;
> >> > >> >> > +                     vfront-porch = <8>;
> >> > >> >> > +                     vsync-len = <6>;
> >> > >> >> > +             };
> >> > >> >> > +     };
> >> > >> >>
> >> > >> >> What display are those timings used for? Shouldn't they be placed
> >> > >>
> >> > >> inside
> >> > >>
> >> > >> >> node of that display?
> >> > >> >
> >> > >> > This timing information will be used parsed by the FIMD probe with
> >> > >> > the
> >> > >>
> >> > >> help
> >> > >>
> >> > >> > of "Video Helper function"  as done in this link
> >> > >>
> >> > >>
> >> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/c
> >> > >> ommit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0
> >> > >>
> >> > >> That function passes in a device node pointer to the FIMD device
> >> > >> node,
> >> > >> and only looks for a display-timings node under there. Tomasz is
> >> > >> right, as far as I can tell.
> >> > >>
> >> > >> Placing display timings at the root of the device tree seems
> >> > >> completely
> >> > >> wrong.
> >> > >>
> >> > >>         I referred this "
> >> >
> >> > Documentation/devicetree/bindings/video/display-timing.txt" for example
> >> >
> >> >             here it dosen't mention about whether display timings node
> >> > can be placed at the root of the device tree or NOT.
> >> >  Not sure how we should be placing the node then.
> >>
> >> I think this is pretty obvious.
> >>
> >> Imagine a bit more complex case: a board has two video outputs (let's say
> >> FIMD0 and FIMD1), each connected to a completely different display. This
> >> means that each display needs different timings.
> >>
> >> How would you know which timings to use if all of them were be placed
> >> under the root node?
> >>
> >>     so what do you think, how  should we modify this patch so that it
> > belongs to a specific video outputs.
> >
> >
> 
>   So what do you think, how should we modify this patch so that it belongs
> to a specific video outputs.
> 
 Something like

	&fimd {
		display-timings {
			timing0: timing@0 {
				/* 2560x1600 DP panel */
				clock-frequency = <50000>;
				hactive = <2560>;
				vactive = <1600>;
				hfront-porch = <48>;
				(...)
			};
		};
	};

Would be correct, if fimd is the output on which the display is connected.
The fimd driver than has to utilize of_get_display_timings, of_get_fb_videomode
or something like that.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
