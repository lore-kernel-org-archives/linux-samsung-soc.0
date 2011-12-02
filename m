From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] Moving xusbxti clock setting in clock.c file.
Date: Fri, 02 Dec 2011 17:44:00 +0900
Message-ID: <04f801ccb0ce$89b05cd0$9d111670$%kim@samsung.com>
References: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37670 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753157Ab1LBIoC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 03:44:02 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVK00KR9IX30Y00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 02 Dec 2011 17:44:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVK002M4IXCE180@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 02 Dec 2011 17:44:00 +0900 (KST)
In-reply-to: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org

Pankaj Dubey wrote:
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

'Pankaj' and 'Pankaj Dubey'?

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

No, the clock can be different for each board even though current value is
same. So it should being at the  each board file.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
