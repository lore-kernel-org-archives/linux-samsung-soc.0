From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 0/3] Moving xusbxti clock setting in clock.c file.
Date: Fri, 02 Dec 2011 18:15:30 +0900
Message-ID: <001901ccb0d2$f04360b0$d0ca2210$%han@samsung.com>
References: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56648 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753598Ab1LBJPc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 04:15:32 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVK00D56KC4NMW0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 02 Dec 2011 18:15:31 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.153])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVK0035VKDU4C60@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 02 Dec 2011 18:15:30 +0900 (KST)
In-reply-to: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org
Cc: kgene.kim@samsung.com

Pankaj Dubey wrote:
> Subject: [PATCH 0/3] Moving xusbxti clock setting in clock.c file.
> 
> Since there is code duplication in different mach-board.c file it is
> better
> to set default clock rate of xusbxti clock in plat-s5p/clock.c file.
> 
> The patches are based on following commit on Kukjin's for-next branch.
> 
> Pankaj (1):
>   ARM: S5P: Set default rate of xusbxti clock
> 
> Pankaj Dubey (2):
>   ARM: EXYNOS: Removed code for setting clock rate of xusbxti
>   ARM: S5PV210: Removed code for setting clock rate of xusbxti
> 
>  arch/arm/mach-exynos/mach-nuri.c     |    1 -
>  arch/arm/mach-exynos/mach-origen.c   |    1 -
>  arch/arm/mach-exynos/mach-smdk4x12.c |    2 --
>  arch/arm/mach-exynos/mach-smdkv310.c |    1 -
>  arch/arm/mach-s5pv210/mach-goni.c    |    1 -
>  arch/arm/plat-s5p/clock.c            |    1 +
>  6 files changed, 1 insertions(+), 6 deletions(-)
> 
> --
> 1.7.4.1
>
No, clock rate of xusbxti clock can be changeable according to board.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
