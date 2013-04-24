From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Exynos regressions w.r.t. config and debuggability due to multiplatform
Date: Wed, 24 Apr 2013 17:03:49 +0200
Message-ID: <201304241703.49864.arnd@arndb.de>
References: <CAOesGMgRsa-AvbEZCc1=_ovaZMaG0S-CDok2MDp_zu5yderAYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:49883 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755927Ab3DXPD4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Apr 2013 11:03:56 -0400
In-Reply-To: <CAOesGMgRsa-AvbEZCc1=_ovaZMaG0S-CDok2MDp_zu5yderAYw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On Wednesday 24 April 2013, Olof Johansson wrote:
> I think we should hold off on multiplatform for exynos until it works
> better, i.e. 3.11.
> 
> First, the defconfig we have in our out-of-tree build system now
> builds a broken kernel since it doesn't set ARCH_EXYNOS_SINGLE. As a
> result, exynos gets turned off. It's quite awkward to switch between
> pre- and post-multiplatform configs, which makes bisecting and other
> error finding hard. I'm sure this will hit other downstream users too.

Hmm, good. point. The idea of the naming was that you actually
/can/ go back and forth across that commit since ARCH_EXYNOS exists
at all times, either as a standalone symbol or as part of multiplatform.

Unfortunately, I did not consider that this stops working for
bisection if we do the change and only make ARCH_EXYNOS_SINGLE
work correctly but leave ARCH_EXYNOS as "depends on BROKEN"
initially. I think you are right that we need to revert bd51de53e1b
"ARM: exynos: enable multiplatform support" in the next/multiplatform
branch, although I don't see a problem with the other commits there.

> What's even more frustrating is that I can't turn on DEBUG_LL, since
> serial drivers depend on PLAT_SAMSUNG, and that is no longer set.

Are you sure? I don't see that problem. PLAT_SAMSUNG should still
get set in both single- and multiplatform configurations, along with
PLAT_SAMSUNG_SINGLE in the case of single-platform exynos.
I've testing DEBUG_LL both in single and multi configurations on
linux-next.

> Seems like we'll have a really broken 3.10 if we merge what we have
> now. More bake time is definitely needed. :(

I think the problems with exynos are elsewhere at the moment, and
Kukjin, Thomas, Tomasz and others have worked hard on getting those
problems fixed. I would suggest we leave the "samsung/exynos-multiplatform"
preparation series scheduled for the first set of pull requests in
next/multiplatform but revert the bd51de53e1b commit in it.

Once the dust settles in the merge window and the exynos multiplatform
patches that are queued up in other trees (serial, spi, video, ...)
have made it upstream, we can decide if the late/multiplatform
series still looks scary or not. If you feel strongly about it and know
that you don't want to merge it then, we can also drop the first part now.

	Arnd
