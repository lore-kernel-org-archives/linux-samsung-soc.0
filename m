From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] Samsung S5P platform modification required for G2D
 driver
Date: Sat, 24 Dec 2011 11:26:15 +0900
Message-ID: <089401ccc1e3$696167f0$3c2437d0$%kim@samsung.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54865 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754728Ab1LXC0S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 21:26:18 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWO00NYFS3T1U30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 11:26:17 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWO009P5S3R9I20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 11:26:17 +0900 (KST)
In-reply-to: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com

Kamil Debski wrote:
> 
> Hi,
> 
> This series of patches contains necessary platform modification required
> by the
> G2D driver. G2D is a 2D-graphics acceleration engine present in the
> S5PC110 and
> Exynos4 Samsung SoCs.
> 
> The patches have been rebased to the newest kgene/for-next branch. The
> driver
> is currently staging for 3.3 in Mauro's repository, so please include
> these
> patches for the next release.
> 
> Best wishes,
> Kamil Debski
> 
> Kamil Debski (3):
>   s5p-g2d: add G2D to plat-s5p and mach-exynos4
>   s5p-g2d: add G2D to mach-nuri
>   s5p-g2d: add G2D to mach-universal
> 
>  arch/arm/mach-exynos/Kconfig               |    2 ++
>  arch/arm/mach-exynos/include/mach/map.h    |    3 +++
>  arch/arm/mach-exynos/mach-nuri.c           |    1 +
>  arch/arm/mach-exynos/mach-universal_c210.c |    1 +
>  arch/arm/plat-s5p/Kconfig                  |    5 +++++
>  arch/arm/plat-samsung/devs.c               |   28
> ++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h  |    1 +
>  7 files changed, 41 insertions(+), 0 deletions(-)

Hi Kamil,

Looks ok to me with small discussion about including some stuff in common or
board file on 2/3 patch.
Anyway, will apply.

And if any problem, let you know.

Merry Christmas.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
