From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH V3 15/17] ARM: exynos: cpuidle: Disable cpuidle for
 5440
Date: Tue, 8 Apr 2014 15:30:08 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1404081527290.1571@knanqh.ubzr>
References: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org> <1396959579-18268-16-git-send-email-daniel.lezcano@linaro.org> <CAP245DUmBVeZqBYDc3mopvs_h5AkcTgjG2eO7z5VAQnUDJJogQ@mail.gmail.com> <5343F7E9.3010304@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:40831 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756894AbaDHTaO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 15:30:14 -0400
Received: by mail-qg0-f49.google.com with SMTP id e89so1253321qgf.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 12:30:13 -0700 (PDT)
In-Reply-To: <5343F7E9.3010304@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene.kim@samsung.com>, Lists LAKML <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Tue, 8 Apr 2014, Daniel Lezcano wrote:

> On 04/08/2014 02:51 PM, Amit Kucheria wrote:
> > On Tue, Apr 8, 2014 at 5:49 PM, Daniel Lezcano
> > <daniel.lezcano@linaro.org <mailto:daniel.lezcano@linaro.org>> wrote:
> >
> >     There is no point to register the cpuidle driver for the 5440 as it
> >     has only
> >     one WFI state which is the default idle function when the cpuidle
> >     driver is
> >     disabled.
> >
> >     By disabling cpuidle we prevent to enter to the governor computation for
> >     nothing, thus saving a lot of processing time.
> >
> >     The only drawback is the statistic via sysfs on this state which is
> >     lost but
> >     it is meaningless and it could be retrieved from the ftrace easily.
> >
> >
> > So for the future, you'll only merge platform drivers that enable
> > something more than WFI?
> 
> Well, I already picked up a driver with only WFI because I knew the next idle
> states were in preparation. But adding a cpuidle driver just for WFI is no
> sense and if, for a reason I missed, it is really needed, I guess a generic
> WFI cpuidle driver for all platforms would be make much more sense.

Better relegate WFI-only configurations to arch_cpu_idle().


Nicolas
