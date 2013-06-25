From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [GIT PULL 2/2] Samsung CLK update for v3.11
Date: Tue, 25 Jun 2013 10:22:20 -0700
Message-ID: <20130625172220.23972.3760@quantum>
References: <51C1C4D3.5050206@samsung.com> <20130625170639.GB10694@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:58253 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab3FYRWY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 13:22:24 -0400
Received: by mail-pb0-f42.google.com with SMTP id un1so12962747pbc.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2013 10:22:24 -0700 (PDT)
In-Reply-To: <20130625170639.GB10694@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arun Kumar K <arun.kk@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

Quoting Olof Johansson (2013-06-25 10:06:39)
> Hi,
> 
> On Wed, Jun 19, 2013 at 11:48:51PM +0900, Kukjin Kim wrote:
> > Hi Arnd, Olof
> > 
> > This is updates for Samsung clks but some of them didn't get Mike's
> > ack but I think, it should be fine and remained in mailing list long
> > time.
> > 
> > Mike, if you have any objection on this branch, please let us know.
> > 
> > Just note, based on tags/exynos-dt-2 to avoid merge conflicts ;)
> > 
> > Thanks,
> > - Kukjin
> > 
> > 
> > The following changes since commit 5f13269130d6798571ffbd9d84dbef0950984c5b:
> > 
> >   ARM: dts: Set BUCK7 as always on for Origen board (2013-06-19
> > 00:41:56 +0900)
> > 
> > are available in the git repository at:
> > 
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-clk-1
> 
> Not pulling these. They are for the clock subsystem and should go through
> Mike Turquette. He might or might not still be taking patches for 3.11,
> but they're mostly cleanup so there should be no harm in holding off
> for 3.12.
> 
> Also, none of the patches were posted to linux-arm-kernel, just to the
> samsung list. Please crosspost to lakml for wider exposure and reviews.

I'm not taking patches for 3.11. Some of the patches I was not Cc'd on
which made it hard to find them. Even if I am not Cc'd I can usually
pick up clock-related patches that land on LAKML, but not all of these
were went to linux-arm-kernel.

I'm happy to take these in towards 3.12 after the merge window.

Regards,
Mike

> 
> 
> -Olof
