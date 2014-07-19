From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] Samsung exynos_mct update for v3.17
Date: Sat, 19 Jul 2014 15:06:23 -0700
Message-ID: <20140719220623.GF15676@quad.lixom.net>
References: <53C9C164.9030404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:32842 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299AbaGSWF6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jul 2014 18:05:58 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so6928500pdj.14
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Jul 2014 15:05:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53C9C164.9030404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, daniel.lezcano@linaro.org, tglx@linutronix.de

On Sat, Jul 19, 2014 at 09:52:52AM +0900, Kukjin Kim wrote:
> Note that this is also based on 3.16-rc5 because of dependency with
> previous samsung fixes including exynos_mct already merged in
> mainline during -rc.
> 
> The following changes since commit 1795cd9b3a91d4b5473c97f491d63892442212ab:
> 
>   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/exynos-mct
> 
> for you to fetch changes up to 1a631118c1d085fe162f3b6d44f710c72206ef2d:
> 
>   clocksource: exynos_mct: Only use 32-bits where possible
> (2014-07-19 03:07:52 +0900)
> 
> ----------------------------------------------------------------
> exynos_mct update for v3.17
> - only use 32-bit access for performance benefits on exynos
>   32-bit system and this means ARCH timer should be supported
>   on exynos 64-bit system instead of current MCT.
> - use readl_relaxed/writel_relaxed to consistently use the
>   proper functions in exynos_mct.

There's no reason for these to go through arm-soc, is there? They should
go through the clocksource tree (Daniel Lezcano / Thomas Gleixner). They
also lack acks from them if they for some reason need to go through arm-soc.


-Olof
