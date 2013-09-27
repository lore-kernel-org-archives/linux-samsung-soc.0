From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4] watchdog: s3c2410_wdt: parse watchdog dt node to read
 PMU registers adresses
Date: Fri, 27 Sep 2013 13:25:21 +0200
Message-ID: <2333262.vSzLePxk45@amdc1227>
References: <1379414623-26329-1-git-send-email-l.krishna@samsung.com>
 <9721965.AJ5fjDQ1RM@amdc1227>
 <CAL1wa8cDAui8AJXvmYPpPEWtUum-ZNpW2hQWjwKLpzXBFLv=eA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAL1wa8cDAui8AJXvmYPpPEWtUum-ZNpW2hQWjwKLpzXBFLv=eA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 27 of September 2013 16:48:34 Leela Krishna Amudala wrote:
> Tomasz,
> 
> On Fri, Sep 27, 2013 at 3:42 PM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Monday 23 of September 2013 19:11:11 Tomasz Figa wrote:
> >> On Monday 23 of September 2013 19:03:10 Bartlomiej Zolnierkiewicz wrote:
> >> >
> >> > Hi,
> >> >
> >> > On Wednesday, September 18, 2013 12:20:31 PM Leela Krishna Amudala wrote:
> >> > > Tomasz,
> >> > >
> >> > > On Wed, Sep 18, 2013 at 10:04 AM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >> > > > Tomasz,
> >> > > >
> >> > > > On Tue, Sep 17, 2013 at 6:30 AM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >> > > >> I believe this is mandatory on Exynos 5420 and unused on previous SoCs. It
> >> > > >> should be handled depending on compatible value.
> >> > > >
> >> > > > I think at least 5250 needs something similar.  I believe we got away
> >> > > > with it in the past since other (non-WDT) code was tweaking with this
> >> > > > bit, but that was a little bit gross.  Leela Krishna can correct me if
> >> > > > I'm wrong.
> >> > > >
> >> > >
> >> > > Yes, 5250 also needs this reset-mask-bit, but not required by SoCs
> >> > > other than Exynos5xxx.
> >> > > Hence I kept it as optional parameter.
> >> > >
> >> > > I took care of this code such that it won't break on older SoCs.
> >> > >
> >> > > If you notice the code in probe function, I used the check condition
> >> > >
> >> > > if (!IS_ERR(wdt->pmu_disable_reg) && !IS_ERR(wdt->pmu_mask_reset_reg)) {
> >> > > }
> >> > >
> >> > > i.e., if any of the PMU register address is not mentioned in the DT
> >> > > node it simply skips reading reset-mask-bit
> >> > > and continues execution (which may happen in older SoC DT node).
> >> > >
> >> > > ..also, in s3c2410wdt_mask_and_disable_reset() function, below
> >> > > condition check is happening
> >> > >
> >> > > if (IS_ERR(wdt->pmu_disable_reg) || IS_ERR(wdt->pmu_mask_reset_reg)
> >> > >                                 || (wdt->pmu_mask_bit < 0))
> >> > >         return;
> >> > >
> >> > > i.e., if any of the registers is not specified in DT node simply
> >> > > return without programming
> >> > > PMU registers(which is true in case of older SoCs).
> >> > >
> >> > > If you think this doesn't sounds good way of handling older SoCs.
> >> > > I'll add new compatible string for Exynos5xxx and do like what you said. :)
> >> >
> >> > Yes, please re-do the code per Tomasz's suggestions.
> >> >
> >> > This would also allow you to check return values of devm_ioremap_resource()
> >> > calls in the probe method and require them to succeed in order to register
> >> > watchdog device (which is unfortunately not what happens currently).
> >>
> >> Now as I think of it, the driver doesn't seem to reconfigure those PMU
> >> registers in any watchdog API callback, only in probe, remove, suspend
> >> and resume.
> >>
> >> Since we already have PMU "driver" in mach-exynos, which already has
> >> suspend/resume syscore ops, what about placing such configuration there
> >> instead?
> >
> > Any opinions on this?
> >
> 
> In PMU we have control registers for other IPs (like USB, MIPI etc.,)
> also and I'm not sure where those registers are getting configured.
> If we want to configure WDT register in PMU driver then we have to
> consider configuring control regs for other IPs also and the DT node
> has to have all these control bit numbers. So instead of that I feel
> configuring it in WDT driver looks fine.

I believe this depends on possible use cases, not the IP block itself.
If this is just a low level initial (and SoC specific) initialization
that doesn't require any co-operation with high level kernel/userspace
APIs, then I think there is no need to entangle the driver for watchdog
IP with SoC specific details outside the IP itself.

[Adding more people on Cc for further discussion.]

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
