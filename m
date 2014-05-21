From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
Date: Wed, 21 May 2014 16:56:46 +0200
Message-ID: <5367019.Bht3ZqI0ij@wuerfel>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org> <11675203.TylGKV1VBZ@wuerfel> <537C6BA5.5080909@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:64789 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298AbaEUO5V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 10:57:21 -0400
In-Reply-To: <537C6BA5.5080909@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linaro-kernel@lists.linaro.org, Mark Rutland <Mark.Rutland@arm.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, rjw@rjwysocki.net, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wednesday 21 May 2014 11:02:29 Daniel Lezcano wrote:
> On 05/21/2014 10:10 AM, Arnd Bergmann wrote:
> > On Wednesday 21 May 2014 09:15:34 Daniel Lezcano wrote:
> >> On 05/15/2014 10:40 PM, Kukjin Kim wrote:
> >>
> >> [ ... ]
> >>
> >>>>>> Exynos cpuidle is not a device on the SoC, so I don't think there is
> >>>>>> any
> >>>>>> way to represent it in DT. The only thing I could see this is matching
> >>>>>> root node with a central SoC driver that instantiates specific
> >>>>>> subdevices, such as cpufreq and cpuidle, but I don't see any available
> >>>>>> infrastructure for this.
> >>>>>
> >>>>> There is a RFC for defining generic idle states [1].
> >>>>>
> >>>>> The idea behind using the platform driver framework is to unify the code
> >>>>> across the different drivers and separate the PM / cpuidle code.
> >>>>>
> >>>>> By this way, we can move the different drivers to drivers/cpuidle and
> >>>>> store them in a single place. That make easier the tracking, the review
> >>>>> and the maintenance.
> >
> > Yes, that would be great. I only looked briefly at the series now, doesn't
> > that require the use of psci?
> 
> No, because PSCI is for some specific platform (eg. calxeda), all the 
> other drivers are legacy and manually handling the PM via some low level 
> callbacks. This is why all drivers were implemented all over the place 
> making so difficult to maintain them. Little by little, we split the PM 
> callbacks from the idle algorithm so reducing the platform dependency 
> with the generic code.
>
> The PSCI implements such PM callbacks in the firmware directly and are 
> accessed through an API. PSCI is, let's say some kindof nextgen cpuidle. 
> It is similar than mwait on Intel. But if a new platform does not have 
> such firmware, then the cpuidle driver will have the legacy format.

Ok, thanks for the exlanation.

	Arnd
