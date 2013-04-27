From: Olof Johansson <olof@lixom.net>
Subject: Re: Exynos regressions w.r.t. config and debuggability due to
 multiplatform
Date: Fri, 26 Apr 2013 17:37:17 -0700
Message-ID: <20130427003717.GC2350@quad.lixom.net>
References: <CAOesGMgRsa-AvbEZCc1=_ovaZMaG0S-CDok2MDp_zu5yderAYw@mail.gmail.com>
 <201304241703.49864.arnd@arndb.de>
 <51794CD3.4080807@samsung.com>
 <201304251931.25028.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:45030 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752675Ab3D0AhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 20:37:22 -0400
Received: by mail-pb0-f47.google.com with SMTP id uo1so401397pbc.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2013 17:37:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201304251931.25028.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Apr 25, 2013 at 07:31:24PM +0200, Arnd Bergmann wrote:
> On Thursday 25 April 2013, Kukjin Kim wrote:
> > 
> > On 04/25/13 00:03, Arnd Bergmann wrote:
> > > On Wednesday 24 April 2013, Olof Johansson wrote:
> > >> I think we should hold off on multiplatform for exynos until it works
> > >> better, i.e. 3.11.
> > >>
> > I think, this would be better choice for now if it's not urgent...
> > 
> 
> I spent a lot of time on it because it's a priority for Linaro, but
> that means I'm biased in the question of whether to merge it or not.
> It should only get in if you and Olof think it's a good idea.

I've reverted the commit you pointed out as the problematic one now,
and with that I get a working setup. That means most of the base patches are
in, just not the final Kconfig shuffling. 3.11 seems more realistic for that.


-Olof
