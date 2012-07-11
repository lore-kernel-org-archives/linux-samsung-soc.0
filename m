From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 0/7] Add device tree based discovery support for drm-fimd
Date: Wed, 11 Jul 2012 19:11:11 +0900
Message-ID: <001b01cd5f4d$7f7c5e70$7e751b50$%han@samsung.com>
References: <1341999741-15578-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28740 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752683Ab2GKKLN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 06:11:13 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z00F60QYG4SB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 19:11:12 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z008LSQYNQA50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 19:11:12 +0900 (KST)
In-reply-to: <1341999741-15578-1-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, olofj@google.com, thomas.ab@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On July 11, 2012 6:11 PM, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> 
> From: Leela Krishna <l.krishna@samsung.com>
> 
> The patches are created against "for-next" branch of Kukjin Kim's tree at:
>  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
> This patch set adds Backlight, LCD support and device tree based discovery
> support for drm-fimd

Your patchset seems FB-FIMD, not DRM-FIMD.

FIMD IP can be used by FB or DRM framework.
Please, use the term clearly.

If your patches use ./drivers/video/s3c-fb.c, please use the term 'FB'.
If your patches use ./drivers/gpu/drm/exynos/*, please use the term 'DRM'.

Best regards,
Jingoo Han

> 
> Leela Krishna (3):
>   ARM: EXYNOS5: add device tree based discovery support for FIMD
>   ARM: EXYNOS5: Add the bus clock for FIMD
>   ARM: EXYNOS5: Set parent clock to fimd
> 
> Leela Krishna Amudala (4):
>   ARM: SAMSUNG: add additional registers and SFR definitions for
>     writeback
>   ARM: EXYNOS5: add machine specific support for backlight
>   ARM: EXYNOS5: add machine specific support for LCD
>   ARM: EXYNOS: Adding DRM platform device
> 
>  arch/arm/boot/dts/exynos5250-smdk5250.dts       |   16 +++
>  arch/arm/boot/dts/exynos5250.dtsi               |    7 ++
>  arch/arm/mach-exynos/Kconfig                    |    1 +
>  arch/arm/mach-exynos/clock-exynos5.c            |   30 ++++--
>  arch/arm/mach-exynos/include/mach/map.h         |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c          |  125 +++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/clock.h      |    2 +
>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h |   10 ++
>  arch/arm/plat-samsung/include/plat/regs-fb.h    |   51 +++++++++
>  drivers/video/Kconfig                           |    6 +
>  10 files changed, 239 insertions(+), 10 deletions(-)
