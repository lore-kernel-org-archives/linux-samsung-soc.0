From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Wed, 14 May 2014 08:17:39 +0200
Message-ID: <20140514081739.0b66587e@amdc2363>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
 <1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
 <CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34971 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbaENGRu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 02:17:50 -0400
In-reply-to: <CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Thomas P Abraham <thomas.ab@samsung.com>
Cc: Thomas Abraham <ta.omasab@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>

Hi Viresh, Tomas,

> On 14 May 2014 06:41, Thomas Abraham <ta.omasab@gmail.com> wrote:
> > From: Thomas Abraham <thomas.ab@samsung.com>
> >
> > Lookup for the optional boost-frequency property in cpu0 node and if
> > available, enable support for boost mode frequencies. The
> > frequencies usable in boost mode are determined while preparing the
> > cpufreq table from the list of operating points available.
> >
> > Cc: Shawn Guo <shawn.guo@linaro.org>
> > Cc: Lukasz Majewski <l.majewski@samsung.com>
> > Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> > ---
> >  .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    2 ++
> >  drivers/cpufreq/Kconfig                            |   11
> > +++++++++++ drivers/cpufreq/cpufreq-cpu0.c                     |
> > 5 +++++ 3 files changed, 18 insertions(+), 0 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
> > b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt index
> > f055515..60f321a 100644 ---
> > a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt +++
> > b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt @@
> > -19,6 +19,8 @@ Optional properties:
> >  - cooling-min-level:
> >  - cooling-max-level:
> >       Please refer to
> > Documentation/devicetree/bindings/thermal/thermal.txt. +-
> > boost-frequency:
> > +     Please refer to
> > Documentation/devicetree/bindings/cpufreq/cpufreq-boost.txt
> >
> >  Examples:
> >
> > diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> > index 1fbe11f..0ca4485 100644
> > --- a/drivers/cpufreq/Kconfig
> > +++ b/drivers/cpufreq/Kconfig
> > @@ -194,6 +194,17 @@ config GENERIC_CPUFREQ_CPU0
> >
> >           If in doubt, say N.
> >
> > +config GENERIC_CPUFREQ_CPU0_BOOST
> 
> Get rid of this.. just not required.

I think that you can rely solely on the CPU_FREQ_BOOST_SW flag if the
original author of cpufreq-cpu0.c don't mind.

> 
> > +       bool "Boost frequency support for generic CPU0 cpufreq
> > driver"
> > +       depends on GENERIC_CPUFREQ_CPU0
> > +       select CPU_FREQ_BOOST_SW
> > +       help
> > +         This enables support for software managed overclocking
> > (BOOST). It
> > +         allows usage of special frequencies (those beyond the
> > normal operating
> > +         frequencies).
> > +
> > +         If in doubt, say N.
> > +
> >  menu "x86 CPU frequency scaling drivers"
> >  depends on X86
> >  source "drivers/cpufreq/Kconfig.x86"
> > diff --git a/drivers/cpufreq/cpufreq-cpu0.c
> > b/drivers/cpufreq/cpufreq-cpu0.c index 1bf6bba..e6c21a8 100644
> > --- a/drivers/cpufreq/cpufreq-cpu0.c
> > +++ b/drivers/cpufreq/cpufreq-cpu0.c
> > @@ -194,6 +194,11 @@ static int cpu0_cpufreq_probe(struct
> > platform_device *pdev) transition_latency += ret * 1000;
> >         }
> >
> > +#ifdef CONFIG_GENERIC_CPUFREQ_CPU0_BOOST
> > +       if (of_find_property(cpu_dev->of_node, "boost-frequency",
> > NULL))
> 
> Lets see what happens to the other thread for this.
> 
> > +               cpu0_cpufreq_driver.boost_supported = true;
> > +#endif
> > +
> >         ret = cpufreq_register_driver(&cpu0_cpufreq_driver);
> >         if (ret) {
> >                 pr_err("failed register driver: %d\n", ret);
> > --
> > 1.7.4.4
> >



-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
