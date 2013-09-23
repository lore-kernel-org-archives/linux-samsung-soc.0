From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Update arch timer node with clock frequency
Date: Mon, 23 Sep 2013 15:15:04 +0100
Message-ID: <20130923141504.GD16069@e106331-lin.cambridge.arm.com>
References: <1379499113-20342-1-git-send-email-yuvaraj.cd@samsung.com>
 <3887347.Oxs1qQnt5k@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3887347.Oxs1qQnt5k@flatron>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Sep 21, 2013 at 04:24:59PM +0100, Tomasz Figa wrote:
> Hi Yuvaraj,
> 
> On Wednesday 18 of September 2013 15:41:53 Yuvaraj Kumar C D wrote:
> > Without the "clock-frequency" property in arch timer node, could able
> > to see the below crash dump.
> [snip]
> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > b/arch/arm/boot/dts/exynos5250.dtsi index 7d7cc77..668ce5d 100644
> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > @@ -96,6 +96,7 @@
> >  			     <1 14 0xf08>,
> >  			     <1 11 0xf08>,
> >  			     <1 10 0xf08>;
> > +		clock-frequency = <24000000>;
> 
> Shouldn't it rather come from some clock provided by some clock controller 
> instead?
> 
> The frequency would be then retrieved using clk_get_rate() on a clock 
> received by clk_get(), specified in device tree using generic clock 
> bindings.

If the bootloader has initialised the generic timer correctly, the
CNTFRQ register should contain the clock frequency, independent of any
external clock.

Having the bootloader set CNTFRQ is by far the preferable solution, it
is architected for this purpose.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
