From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v5 00/12] clk: exynos4: migrate to common clock framework
Date: Wed, 2 Jan 2013 11:35:33 -0800
Message-ID: <20130102193533.GB6583@quad.lixom.net>
References: <1356827621-27617-1-git-send-email-thomas.abraham@linaro.org>
 <20121230052953.GB20903@quad.lixom.net>
 <02f701cde6f7$5abbcc60$10336520$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f43.google.com ([209.85.210.43]:50144 "EHLO
	mail-da0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752697Ab3ABTfY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 14:35:24 -0500
Received: by mail-da0-f43.google.com with SMTP id u36so6644129dak.30
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jan 2013 11:35:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <02f701cde6f7$5abbcc60$10336520$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

On Sun, Dec 30, 2012 at 05:37:08PM -0800, Kukjin Kim wrote:
> Olof Johansson wrote:
> > 
> > On Sat, Dec 29, 2012 at 04:33:29PM -0800, Thomas Abraham wrote:
> > > Changes since v4:
> > > - Rebased to linux-3.8-rc1.
> > >
> > > Changes since v3:
> > > - Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>
> > >
> > > This patch series migrates the Samsung Exynos4 SoC clock code to adopt
> > the
> > > common clock framework. The use of Samsung specific clock structures has
> > > been removed and all board support code has been updated. imx-style of
> > > clock registration and lookup has been adopted for device tree based
> > > exynos4 platforms.
> > 
> > I'd prefer to see if exynos4 and 5 were kept common here, and both
> > transitioned
> > at the same time. Especially since there are no legacy boards for exynos5,
> it
> > would mean you could have a very clean transition there. What's the plan
> to
> > follow up with 5?
> > 
> Yeah, I'm working on EXYNOS5250 common clk stuff and Thomas is working on
> EXYNOS5440. So I think, we can move on exynos4 and 5 both common clk at the
> same time. Note, EXYNOS5 common clk stuff will be submitted in the beginning
> of Jan.

As per the other reply, that sounds good -- it doesn't make sense to merge one
without the other but it sounds like maybe they can both be ready in time for
3.9.

> > What are the plans to remove legacy board files on exynos4 at this time
> > and switch them to DT-only? You could do it gradually like Stephen Warren
> > did on Tegra, with hooks that call out to some of the legacy code, but
> > configure the board through device tree and do away with the classic
> > machine descriptors, etc.
> > 
> I had a plan to remove non-DT support on EXYNOS4 for v3.10, but if possible,
> I will try to do it for v3.9. If any updates, let you know.

There's no hurry, 3.10 is ok as a target as long as it's taking place. The main
reason for why I was asking was that there was still some legacy board file
updates posted, and that I hadn't seen much patches lately that made it obvious
that there was an effort in that direction. 3.10 sounds like a good target.

> Happy New Year!

Thanks, you too.


-Olof
