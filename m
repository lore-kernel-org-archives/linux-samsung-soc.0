From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: Update arch timer node with clock frequency
Date: Sat, 12 Oct 2013 15:26:59 -0700
Message-ID: <20131012222659.GA20879@quad.lixom.net>
References: <1379499113-20342-1-git-send-email-yuvaraj.cd@samsung.com>
 <3887347.Oxs1qQnt5k@flatron>
 <20130923141504.GD16069@e106331-lin.cambridge.arm.com>
 <CAOesGMgaDB0ZK7LU+vZmXkpTXaMKbuNgT+vuaRbzypwtZ9eouA@mail.gmail.com>
 <CAL_JsqK5C6N6vYMp=yR-Qi3oKZZrp07SYZaWmv4c23gsq-zxnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:43113 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752892Ab3JLW1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Oct 2013 18:27:30 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb1so5978225pad.37
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Oct 2013 15:27:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAL_JsqK5C6N6vYMp=yR-Qi3oKZZrp07SYZaWmv4c23gsq-zxnA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "t.figa@samsung.com" <t.figa@samsung.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Marc Zyngier <marc.zyngier@arm.com>, Tony Lindgren <tony@atomide.com>, Sean Paul <seanpaul@chromium.org>

On Wed, Oct 09, 2013 at 04:48:32PM -0500, Rob Herring wrote:
> On Tue, Oct 8, 2013 at 5:15 PM, Olof Johansson <olof@lixom.net> wrote:
> > [Adding Tony, who reported a mainline booting issue, and Sean who
> > helped me track this down]
> >
> > On Mon, Sep 23, 2013 at 7:15 AM, Mark Rutland <mark.rutland@arm.com> wrote:
> >> On Sat, Sep 21, 2013 at 04:24:59PM +0100, Tomasz Figa wrote:
> >>> Hi Yuvaraj,
> >>>
> >>> On Wednesday 18 of September 2013 15:41:53 Yuvaraj Kumar C D wrote:
> >>> > Without the "clock-frequency" property in arch timer node, could able
> >>> > to see the below crash dump.
> >>> [snip]
> >>> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> >>> > b/arch/arm/boot/dts/exynos5250.dtsi index 7d7cc77..668ce5d 100644
> >>> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> >>> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >>> > @@ -96,6 +96,7 @@
> >>> >                          <1 14 0xf08>,
> >>> >                          <1 11 0xf08>,
> >>> >                          <1 10 0xf08>;
> >>> > +           clock-frequency = <24000000>;
> >>>
> >>> Shouldn't it rather come from some clock provided by some clock controller
> >>> instead?
> >>>
> >>> The frequency would be then retrieved using clk_get_rate() on a clock
> >>> received by clk_get(), specified in device tree using generic clock
> >>> bindings.
> >>
> >> If the bootloader has initialised the generic timer correctly, the
> >> CNTFRQ register should contain the clock frequency, independent of any
> >> external clock.
> >
> > So, we just sat here to bisect a problem on the Samsung Chromebook
> > where we hit exactly this problem. The read-only firmware on the
> > device does not set CNTFRQ at boot, so this fails.
> >
> > Apparantly the u-boot that comes with Arndale sets it, so I haven't
> > seen this error on that platform.
> >
> >> Having the bootloader set CNTFRQ is by far the preferable solution, it
> >> is architected for this purpose.
> >
> > Unfortunately there is now real hardware out there that needs this due
> > to firmware bugs / missing features, so there's little other choice.
> > :(
> >
> > I'll pick this patch up in the fixes branch for 3.12, unless someone
> > complains loudly.
> 
> Perhaps the subject should say something about this only applying to exynos.

Definitely, and I'll add a comment as Mark requested.


-Olof
