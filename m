From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/4] Samsung devel-dma for v3.4
Date: Sat, 10 Mar 2012 10:21:49 -0800
Message-ID: <20120310182149.GA656@quad.lixom.net>
References: <4F5B7CA7.2010604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:41967 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075Ab2CJSVt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 13:21:49 -0500
Received: by iagz16 with SMTP id z16so4133360iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 10:21:49 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <4F5B7CA7.2010604@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, Mar 10, 2012 at 08:09:11AM -0800, Kukjin Kim wrote:
> Hi Arnd, Olof,
> 
> This is for Samsung dma stuff for v3.4 and depends on following:
>   next/cleanup-use-static
>   next/cleanup-exynos-clock
> 
> Please pull from:

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/devel-samsung-dma
> 
> And conflicts will be happened in clock part. Here is my preferred
> resolution. The mach-exynos/clock.c can be removed with following:
> 
> arch/arm/mach-exynos/exynos-clock4.c

Hi,

given my feedback on the cleanup-exynos-clock pull request, I'm holding off on
this one waiting on you to do the resolution of the conflicts. :-)


Thanks,

-Olof
