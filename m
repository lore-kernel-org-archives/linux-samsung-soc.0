From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 1/2] PM / devfreq: exynos-nocp: Select REGMAP_MMIO
Date: Wed, 12 Oct 2016 22:08:28 +0200
Message-ID: <4986321.Rq86MiW5qg@vostro.rjw.lan>
References: <1474805638-30407-1-git-send-email-axel.lin@ingics.com> <9785239.FWYofzirS3@vostro.rjw.lan> <CAJ0PZbRCBeqbixQikCbc1F_AwGRHsCWEnh7MTYP3=zZ2LWEZBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:57064 "HELO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with SMTP id S1756013AbcJLUBn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Oct 2016 16:01:43 -0400
In-Reply-To: <CAJ0PZbRCBeqbixQikCbc1F_AwGRHsCWEnh7MTYP3=zZ2LWEZBA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@gmail.com
Cc: Axel Lin <axel.lin@ingics.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linux PM list <linux-pm@vger.kernel.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

On Friday, September 30, 2016 10:46:04 PM MyungJoo Ham wrote:
> On Thu, Sep 29, 2016 at 9:29 PM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > On Sunday, September 25, 2016 08:13:57 PM Axel Lin wrote:
> >> This driver uses devm_regmap_init_mmio(), so select REGMAP_MMIO to avoid
> >> build failure.
> >>
> >> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> >> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> >> ---
> >> v2: fix typo in commit log and also add Chanwoo's Ack.
> >> This one is a build fix, I think it should be for v4.8.
> >>  drivers/devfreq/event/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/devfreq/event/Kconfig b/drivers/devfreq/event/Kconfig
> >> index 0fdae86..cd94980 100644
> >> --- a/drivers/devfreq/event/Kconfig
> >> +++ b/drivers/devfreq/event/Kconfig
> >> @@ -17,6 +17,7 @@ config DEVFREQ_EVENT_EXYNOS_NOCP
> >>       tristate "EXYNOS NoC (Network On Chip) Probe DEVFREQ event Driver"
> >>       depends on ARCH_EXYNOS || COMPILE_TEST
> >>       select PM_OPP
> >> +     select REGMAP_MMIO
> >>       help
> >>         This add the devfreq-event driver for Exynos SoC. It provides NoC
> >>         (Network on Chip) Probe counters to measure the bandwidth of AXI bus.
> >>
> >
> > MyungJoo, I can apply this one and the [2/2] directly.  Should I do that?
> >
> > Thanks,
> > Rafael
> 
> 
> Yes, sure. Those two fixes look good. Thanks.

OK, applied.

Thanks,
Rafael
