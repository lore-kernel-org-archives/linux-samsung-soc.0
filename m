From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Enable multi-platform build support
Date: Tue, 13 May 2014 11:15:45 +0200
Message-ID: <4941260.joVvylkMMC@wuerfel>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org> <201404222156.48432.arnd@arndb.de> <065d01cf6e65$0e903dc0$2bb0b940$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:49558 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759695AbaEMJQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 05:16:20 -0400
In-Reply-To: <065d01cf6e65$0e903dc0$2bb0b940$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tuesday 13 May 2014 13:37:33 Kukjin Kim wrote:
> Arnd Bergmann wrote:
> > 
> > On Tuesday 22 April 2014, Olof Johansson wrote:
> > > I don't think there's a point in keeping this around. A
> > > "single-platform" config is just enabling a single platform in the
> > > config, it's not a specific option. I don't think any of the other
> > > platforms use anything like this today.
> > 
> > The only one doing that is shmobile, but only because they have
> > some SoCs that are multiplatform capable and some that are not.
> > This isn't the case for Exynos, so it should no longer be needed.
> > 
> > When I originally created this patch 18 months ago, there were a
> > number of drivers that broke when multiplatform got enabled.
> > Now the cpufreq driver is the only one left, but it seems that
> > it will make it for 3.16, and I wouldn't wait for it if it doesn't.
> > Let's just do multiplatform-only.
> > 
> In my position in S.LSI, I'd like to keep the current ARCH_EXYNOS4 and
> EXYNOS5 because IMHO selecting each series would be helpful on real product,
> multiplatform is available though. Additionally EXYNOS3 is being added.
> 
> It's true we can support exynos-multiplatform even though above options are
> included...

I think we are talking about different questions here:

What Olof and I mean is we don't want to have an ARCH_EXYNOS_SINGLE option
that is there for building EXYNOS but not allowing any other SoC.

What I think you mean is that you want the individual EXYNOS versions
to be separate Kconfig options, so you can build a kernel that supports
EXYNOS4 but not EXYNOS5 if you want to. This is totally fine as far
as I'm concerned, and it's not directly related to the first point.

Note that if you enable LPAE, you will still only be able to build EXYNOS5
after the patch, but then you can have it in the same kernel as e.g.
Tegra4 and Snapdragon 600.

	Arnd
