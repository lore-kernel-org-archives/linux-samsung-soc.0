From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: dts: Update arch timer node with clock frequency
Date: Wed, 9 Oct 2013 09:25:51 +0100
Message-ID: <20131009082551.GC4981@e106331-lin.cambridge.arm.com>
References: <1379499113-20342-1-git-send-email-yuvaraj.cd@samsung.com>
 <3887347.Oxs1qQnt5k@flatron>
 <20130923141504.GD16069@e106331-lin.cambridge.arm.com>
 <CAOesGMgaDB0ZK7LU+vZmXkpTXaMKbuNgT+vuaRbzypwtZ9eouA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:57966 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752402Ab3JIIZ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Oct 2013 04:25:57 -0400
Content-Disposition: inline
In-Reply-To: <CAOesGMgaDB0ZK7LU+vZmXkpTXaMKbuNgT+vuaRbzypwtZ9eouA@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "t.figa@samsung.com" <t.figa@samsung.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Marc Zyngier <Marc.Zyngier@arm.com>, Tony Lindgren <tony@atomide.com>, Sean Paul <seanpaul@chromium.org>

On Tue, Oct 08, 2013 at 11:15:47PM +0100, Olof Johansson wrote:
> [Adding Tony, who reported a mainline booting issue, and Sean who
> helped me track this down]
> 
> On Mon, Sep 23, 2013 at 7:15 AM, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Sat, Sep 21, 2013 at 04:24:59PM +0100, Tomasz Figa wrote:
> >> Hi Yuvaraj,
> >>
> >> On Wednesday 18 of September 2013 15:41:53 Yuvaraj Kumar C D wrote:
> >> > Without the "clock-frequency" property in arch timer node, could able
> >> > to see the below crash dump.
> >> [snip]
> >> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> >> > b/arch/arm/boot/dts/exynos5250.dtsi index 7d7cc77..668ce5d 100644
> >> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> >> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >> > @@ -96,6 +96,7 @@
> >> >                          <1 14 0xf08>,
> >> >                          <1 11 0xf08>,
> >> >                          <1 10 0xf08>;
> >> > +           clock-frequency = <24000000>;
> >>
> >> Shouldn't it rather come from some clock provided by some clock controller
> >> instead?
> >>
> >> The frequency would be then retrieved using clk_get_rate() on a clock
> >> received by clk_get(), specified in device tree using generic clock
> >> bindings.
> >
> > If the bootloader has initialised the generic timer correctly, the
> > CNTFRQ register should contain the clock frequency, independent of any
> > external clock.
> 
> So, we just sat here to bisect a problem on the Samsung Chromebook
> where we hit exactly this problem. The read-only firmware on the
> device does not set CNTFRQ at boot, so this fails.

Ouch. That's a shame.

A chained bootloader (like the KVM guys are using) should be able to set
CNTFRQ, so as long as any chained loader actually does that this won't
cause that to blow up...

> 
> Apparantly the u-boot that comes with Arndale sets it, so I haven't
> seen this error on that platform.
> 
> > Having the bootloader set CNTFRQ is by far the preferable solution, it
> > is architected for this purpose.
> 
> Unfortunately there is now real hardware out there that needs this due
> to firmware bugs / missing features, so there's little other choice.
> :(

Indeed :(

> 
> I'll pick this patch up in the fixes branch for 3.12, unless someone
> complains loudly.

Could you please add a note to the dts regarding why we actually need
this? It would be nice to maintain the impression that this is not the
preferred way of doing things...

Cheers,
Mark.
