From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] watchdog: s3c2410_wdt: parse watchdog dt node to read PMU registers adresses
Date: Fri, 27 Sep 2013 20:14:34 +0200
Message-ID: <2201944.6vg4a9ttux@flatron>
References: <1379414623-26329-1-git-send-email-l.krishna@samsung.com> <2333262.vSzLePxk45@amdc1227> <CAD=FV=WZBrJ5Qhky6VQqfu59LVQcKMTdLa+gJwnnFM85bEzzNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=WZBrJ5Qhky6VQqfu59LVQcKMTdLa+gJwnnFM85bEzzNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 27 of September 2013 08:20:25 Doug Anderson wrote:
> Tomasz
> 
> On Fri, Sep 27, 2013 at 4:25 AM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >> >> Since we already have PMU "driver" in mach-exynos, which already
> >> >> has
> >> >> suspend/resume syscore ops, what about placing such configuration
> >> >> there
> >> >> instead?
> >> > 
> >> > Any opinions on this?
> >> 
> >> In PMU we have control registers for other IPs (like USB, MIPI etc.,)
> >> also and I'm not sure where those registers are getting configured.
> >> If we want to configure WDT register in PMU driver then we have to
> >> consider configuring control regs for other IPs also and the DT node
> >> has to have all these control bit numbers. So instead of that I feel
> >> configuring it in WDT driver looks fine.
> > 
> > I believe this depends on possible use cases, not the IP block itself.
> > If this is just a low level initial (and SoC specific) initialization
> > that doesn't require any co-operation with high level kernel/userspace
> > APIs, then I think there is no need to entangle the driver for
> > watchdog
> > IP with SoC specific details outside the IP itself.
> > 
> > [Adding more people on Cc for further discussion.]
> 
> So isn't the register in the PMU there to save power in the case that
> the watchdog timer isn't being used?  How is the PMU "driver" to know
> whether the watchdog is being used?  Better IMHO that the watchdog
> driver knows to enable and disable itself as needed, right?

How much power can you save on one low frequency counter? Anyway, those 
bits look more like reset signal masks to me, unrelated to any power 
saving and even if, this driver switches them on at probe regardless of 
whether the watchdog is actually used or not.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
