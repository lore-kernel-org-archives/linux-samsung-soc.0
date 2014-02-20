From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Thu, 20 Feb 2014 18:48:25 +0100
Message-ID: <16785833.BhsvfRuRRo@wuerfel>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org> <201402201800.49425.arnd@arndb.de> <53063C9F.4060307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:55817 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752341AbaBTRsl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Feb 2014 12:48:41 -0500
In-Reply-To: <53063C9F.4060307@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tomasz Figa <t.figa@samsung.com>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>

On Thursday 20 February 2014 18:34:23 Tomasz Figa wrote:
> On 20.02.2014 18:00, Arnd Bergmann wrote:
> >> Of course nothing stops you from retaining more specific compatible
> >> strings. In fact, this is probably the most appropriate solution,
> >> because in future you might find out that certain SoCs need some special
> >> differentiation, e.g. same ID value on two SoCs.
> >>
> >> So, to apply this to our case, our Exynos 5250 based Arndale board would
> >> be changed from
> >>
> >> compatible = "insignal,arndale", "samsung,exynos5260";
> >>
> >> to
> >>
> >> compatible = "insignal,arndale", "samsung,exynos5260", "samsung,exynos";
> >
> > Right, this would make sense.
> >
> >> Now, the board file will be able to match simply by "samsung,exynos"
> >> compatible string and SoC-specific code in mach-exynos (hopefully none
> >> after it gets cleaned up fully) will use soc_is_exynos*() macros (what
> >> AFAIK it is already doing at the moment).
> >
> > On principle, I would not take things out of the match list, if that
> > would break booting with old DT file that don't list "samsung,exynos"
> > as compatible. But for new SoCs that would work.
> 
> My proposal was about simply adding a fully generic string, without 
> removing the specific ones. For already supported SoCs this is pretty 
> obvious, as existing DTBs would not have this generic string listed. But 
> the specific strings should be also present in DTSes of new SoCs, even 
> if not recognized by the kernel, to make sure that in future any 
> SoC-specific quirks could be easily handled.

Yes, that's ideal.

> > Using soc_is_exynos*() too much of course also isn't good. A lot of
> > the things tested for should probably be checked from individual DT
> > properties, but again we have to find the right balance. I wouldn't
> > mind getting rid of the soc_is_exynos*() macros completely, because
> > a) we can't use them in device drivers
> > b) all platform code is supposed to be in drivers
> > c) both rules are enforced for arm64
> 
> I fully agree. As I said, after cleaning up mach-exynos/ there should be 
> no more code left using soc_is_*() macros. Ideally, the whole 
> mach-exynos/ should collapse into a single, trivial file, with 
> everything done in dedicated drivers.

Right.


	Arnd
