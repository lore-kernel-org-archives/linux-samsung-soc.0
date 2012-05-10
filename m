From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 0/3] Add support for DRM display subsystem
Date: Thu, 10 May 2012 18:36:05 +0900
Message-ID: <037301cd2e90$529112e0$f7b338a0$%kim@samsung.com>
References: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31604 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757870Ab2EJJgI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 05:36:08 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3S00BGNW06U3Q0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 18:36:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3S00GFWW054540@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 18:36:06 +0900 (KST)
In-reply-to: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>

Marek Szyprowski wrote:
> 
> Hello,
> 
> This patch set adds support for Exynos DRM display subsystem for
> Universal C210 and NURI boards. Exynos DRM driver has been merged to 3.3
> kernel tree and provides unified and more powerful alternative for
> s3c-fb and s5p-tv drivers. V2 includes update for the latest changes in
> platform data structure (added 'panel' entry).
> 
> Best regards
> 
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> Patch summary:
> 
> Marek Szyprowski (3):
>   ARM: Exynos: add platform device for core DRM subsystem
>   ARM: Exynos: Add DRM core device support for Universal C210 board
>   ARM: Exynos: Add DRM core support for NURI board
> 
>  arch/arm/mach-exynos/Kconfig               |    7 ++++++
>  arch/arm/mach-exynos/Makefile              |    1 +
>  arch/arm/mach-exynos/dev-drm.c             |   29
++++++++++++++++++++++++
>  arch/arm/mach-exynos/mach-nuri.c           |   33
> ++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/mach-universal_c210.c |   33
> ++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h  |    2 +
>  6 files changed, 105 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/dev-drm.c
> 
> --
> 1.7.1.569.g6f426

Well, 2nd and 3rd patches can break multi-platform for EXYNOS SoCs with one
kernel image.

And I won't apply new feature for non-dt board file from now on. I think, we
need to support DT in mach-exynos/ instead of non-DT and DT together, so
please consider to move on dt supporting for Samsung mobile boards.

Note that I have a plan to replace board files with DT supporting in
mach-exynos/ next time.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
