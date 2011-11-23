From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung fixes for v3.2
Date: Wed, 23 Nov 2011 21:15:17 +0000
Message-ID: <201111232115.18048.arnd@arndb.de>
References: <03e501cca837$d893e320$89bba960$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:63362 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752594Ab1KWVPU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Nov 2011 16:15:20 -0500
In-Reply-To: <03e501cca837$d893e320$89bba960$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Kyungmin Park <kmpark@infradead.org>

On Monday 21 November 2011, Kukjin Kim wrote:
> Please pull samsung-fixes for v3.2 from:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> samsung-fixes
> 
> This includes fix of inclusion header.
> If any problems, please let me know.
> 

Pulled, thanks!

On Monday 21 November 2011, Kyungmin Park wrote:
> Don't you fix the mct compiler error if LOCAL_TIMERS are not defined?
> 
> arch/arm/mach-exynos/mct.c: In function 'exynos4_timer_resources':
> arch/arm/mach-exynos/mct.c:451: error: 'exynos4_mct_tick_isr'
> undeclared (first use in this function)
> arch/arm/mach-exynos/mct.c:451: error: (Each undeclared identifier is
> reported only once
> arch/arm/mach-exynos/mct.c:451: error: for each function it appears in.)
> make[1]: *** [arch/arm/mach-exynos/mct.o] Error 1

Has a patch been posted for this?

	Arnd
