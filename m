From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 1/2] clk: samsung: cpu: Prepare for addition for Exynos7
 CPU clocks
Date: Tue, 12 Jul 2016 15:44:03 +0200
Message-ID: <1893441.PNypKdntnt@amdc1976>
References: <1467750561-13957-1-git-send-email-a.kesavan@samsung.com>
 <2318982.ZLuIVQzhgE@amdc1976>
 <CAM4voamm5-upxvwYG0b-WpgO3OpJR+ZswVzjwRO89fjQqovFbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34632 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725AbcGLNpH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 09:45:07 -0400
In-reply-to: <CAM4voamm5-upxvwYG0b-WpgO3OpJR+ZswVzjwRO89fjQqovFbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Krzysztof =?utf-8?B?S296xYJvd3NraQ==?= <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday, July 11, 2016 04:44:30 PM Abhilash Kesavan wrote:
> Hi Bartlomiej,

Hi Abhilash,

> Thanks for the comments.
> 
> On Thu, Jul 7, 2016 at 1:17 PM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> >
> > Hi
> >
> > On Thursday, July 07, 2016 12:45:57 PM Sylwester Nawrocki wrote:
> >> On 07/05/2016 10:29 PM, Abhilash Kesavan wrote:
> >> > Exynos7 has the same CPU clock registers layout as that present
> >
> > Please precise for which Exynos7 SoC this change is needed
> > (all three of them?).
> 
> As mentioned in my recently posted PMU series, the exynos7 is a quad
> core A57 based SoC and not meant to be a SoC family.

I suppose that it will get some more meaningful name once released
officially (I couldn't find anything about this SoC on the net).

> I have reviewed various exynos7xxx UMs in terms of the CPU CMU. Both
> exynos7580 and exynos7420 have a similar CMU register layout along
> with the same mux stat bits as exynos7. Exynos7870 on the other hand
> is quite different.
> 
> Please let me know what naming convention you would prefer that I use
> E7/E7420/E7580 ?

I would prefer using E7420 naming.
 
> >> > in Exynos5433 except for the bits in the MUX_STAT* registers.
> >> > Add a new CLK_CPU_HAS_MODIFIED_MUX_STAT flag to handle this change.
> >>
> >> > --- a/drivers/clk/samsung/clk-cpu.h
> >> > +++ b/drivers/clk/samsung/clk-cpu.h
> >> > @@ -63,6 +63,8 @@ struct exynos_cpuclk {
> >> >  /* The CPU clock registers have Exynos5433-compatible layout */
> >> >  #define CLK_CPU_HAS_E5433_REGS_LAYOUT      (1 << 2)
> >>
> >> > +/* Exynos5433-compatible layout with different MUX_STAT register bits */
> >> > +#define CLK_CPU_HAS_MODIFIED_MUX_STAT      (1 << 3)
> >>
> >> It's getting a bit messy, what if there comes another SoC version
> >> which has some other modification of exynos5433 registers structure?
> >> We would need another variant of HAS_MODIFIED_MUX_STAT flag and we
> >> could easily get lost while trying to determine which modification
> >> is which. How about indicating explicitly it's an exynos7 bits
> >> layout and renaming the flag to something like
> >>
> >> #define CLK_CPU_HAS_E7_MUX_STAT       (1 << 16) ?
> >
> > ditto

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
