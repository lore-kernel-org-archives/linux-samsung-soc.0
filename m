From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung fixes-3 for v3.7
Date: Fri, 23 Nov 2012 10:51:40 +0900
Message-ID: <10e701cdc91d$151bf240$3f53d6c0$%kim@samsung.com>
References: <50AB913D.2020604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11058 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756779Ab2KWBvm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Nov 2012 20:51:42 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDX0007Y3TGL3M0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 10:51:41 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDX009803U4KP50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 10:51:40 +0900 (KST)
In-reply-to: <50AB913D.2020604@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> Hi Arnd, Olof
> 
> Here is Samsung fixes for v3.7 and it is for fixing of mdma1 address for
> exynos4210 rev0 SoC.
> 
> Please pull from:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.7-samsung-fixes-3
> 

Probably, missed?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> The following changes since commit
> f4a75d2eb7b1e2206094b901be09adb31ba63681:
> 
>    Linux 3.7-rc6 (2012-11-16 17:42:40 -0800)
> 
> are available in the git repository at:
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.7-samsung-fixes-3
> 
> Bartlomiej Zolnierkiewicz (1):
>        ARM: EXYNOS: PL330 MDMA1 fix for revision 0 of Exynos4210 SOC
> 
>   arch/arm/mach-exynos/dma.c              |    3 +++
>   arch/arm/mach-exynos/include/mach/map.h |    1 +
>   2 files changed, 4 insertions(+), 0 deletions(-)
