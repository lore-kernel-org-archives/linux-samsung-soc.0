From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3 v2] ARM: S5P: Add support for MFC device on S5PV210 and
 EXYNOS4
Date: Sat, 16 Jul 2011 16:06:04 +0900
Message-ID: <037701cc4386$d65ba270$8312e750$%kim@samsung.com>
References: <1308069540-24934-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8826 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821Ab1GPHGK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 03:06:10 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00784ZQ8TC30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:06:09 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE00K6FZQ9ES@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:06:09 +0900 (KST)
In-reply-to: <1308069540-24934-1-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com

Kamil Debski wrote:
> 
> Hello,
> 
> Multi Format Codec is a device present in the S5PV210 and EXYNOS4 SoCs by
> Samsung.
> This patch set adds platform and mach data for MFC. The new version
contains
> memory initialization code for MFC and support for DMA contig allocator.
> 
> The patches have been applied to this branch, it should become available
in a
> couple of hours:
>
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/heads/
mfc-
> for-kgene
> 
> The MFC driver can be found on this branch (it should also sync in a
couple of
> hours):
>
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/heads/
mfc-
> for-mauro
> The driver has been sent today to the linux-media list.
> 
> Best regards,
> Kamil Debski
> 
> Change log:
> 
> =================
>  Changes since v1
> =================
> - support for DMA conitg allocator
> - reserving memory for MFC
> 
> Patch summary:
> 
> Kamil Debski (3):
>   ARM: Add support for MFC device to plat-s5p, mach-s5pv210 and
>     mach-exynos4
>   ARM: S5PV210: Enable MFC on Goni
>   ARM: EXYNOS4: Enable MFC on universal_c210
> 
>  arch/arm/Kconfig                            |    2 +
>  arch/arm/mach-exynos4/Kconfig               |    2 +
>  arch/arm/mach-exynos4/clock.c               |   63 ++++++++++++++
>  arch/arm/mach-exynos4/include/mach/map.h    |    2 +
>  arch/arm/mach-exynos4/mach-universal_c210.c |   13 +++
>  arch/arm/mach-s5pv210/Kconfig               |    1 +
>  arch/arm/mach-s5pv210/clock.c               |    6 ++
>  arch/arm/mach-s5pv210/include/mach/map.h    |    3 +
>  arch/arm/mach-s5pv210/mach-goni.c           |   10 ++
>  arch/arm/plat-s5p/Kconfig                   |    5 +
>  arch/arm/plat-s5p/Makefile                  |    2 +-
>  arch/arm/plat-s5p/dev-mfc.c                 |  125
> +++++++++++++++++++++++++++
>  arch/arm/plat-s5p/include/plat/mfc.h        |   28 ++++++
>  arch/arm/plat-samsung/include/plat/devs.h   |    3 +
>  14 files changed, 264 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/dev-mfc.c
>  create mode 100644 arch/arm/plat-s5p/include/plat/mfc.h

Hi Kamil,

Could you please re-work/re-submit based on current my for-next?
Now, it is needed to update about clkdev and external gic...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
