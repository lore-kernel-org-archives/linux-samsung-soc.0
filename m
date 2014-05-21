From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
Date: Wed, 21 May 2014 10:10:24 +0200
Message-ID: <11675203.TylGKV1VBZ@wuerfel>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org> <5375262C.10805@samsung.com> <537C5296.7050801@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:64864 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751033AbaEUIKb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 04:10:31 -0400
In-Reply-To: <537C5296.7050801@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linaro-kernel@lists.linaro.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, rjw@rjwysocki.net, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wednesday 21 May 2014 09:15:34 Daniel Lezcano wrote:
> On 05/15/2014 10:40 PM, Kukjin Kim wrote:
> 
> [ ... ]
> 
> >>>> Exynos cpuidle is not a device on the SoC, so I don't think there is
> >>>> any
> >>>> way to represent it in DT. The only thing I could see this is matching
> >>>> root node with a central SoC driver that instantiates specific
> >>>> subdevices, such as cpufreq and cpuidle, but I don't see any available
> >>>> infrastructure for this.
> >>>
> >>> There is a RFC for defining generic idle states [1].
> >>>
> >>> The idea behind using the platform driver framework is to unify the code
> >>> across the different drivers and separate the PM / cpuidle code.
> >>>
> >>> By this way, we can move the different drivers to drivers/cpuidle and
> >>> store them in a single place. That make easier the tracking, the review
> >>> and the maintenance.

Yes, that would be great. I only looked briefly at the series now, doesn't
that require the use of psci? That's not a bad idea of course, but it
doesn't solve the problem I raised here.

> >>> I am ok to by using platform_device_register_resndata() but I would
> >>> prefer to do that a bit later by converting the other drivers too. That
> >>> will be easier if we have them grouped in a single directory (this is
> >>> what does this patchset at the end).
> >>>
> >>> As there are some more work based on this patchset and the link error
> >>> could be fixed as an independent patch, I would recommend to
> >>> re-integrate it in the tree as asked by Bartlomiej.
> >>
> >> In general, it would be nice to have everything done properly, but I'd
> >> consider Daniel's series as a huge improvement already and a nice
> >> intermediate step towards further clean-up.
> >>
> >> So based on the comments quoted above, instead of stalling the
> >> development, I'd suggest to accept this series and then move forward.
> >>
> > I'm fine.
> >
> > Arnd, how about you?
> >
> > - Kukjin
> 
> Arnd ?

Sorry for the delay. Yes, let's do it this way once more, but please
come up with something better for the future that doesn't tie the
cpuidle method to the root compatible string as this does.

	Arnd
