From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 5/5] ARM: Exynos4: Migrate clock support to common clock
 framework
Date: Wed, 14 Nov 2012 14:25:09 +0900
Message-ID: <03a401cdc228$69f5a8c0$3de0fa40$%kim@samsung.com>
References: <1349629855-4962-1-git-send-email-thomas.abraham@linaro.org>
 <1349629855-4962-6-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9454 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239Ab2KNFZM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 00:25:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDG001OPPP0DZG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Nov 2012 14:25:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDG008FGPPX6M70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Nov 2012 14:25:09 +0900 (KST)
In-reply-to: <1349629855-4962-6-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com, mturquette@ti.com, mturquette@linaro.org

Thomas Abraham wrote:
> 
> Remove Samsung specific clock support in Exynos4 and migrate to using
> common clock framework.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos/Kconfig               |    1 +
>  arch/arm/mach-exynos/Makefile              |    3 -
>  arch/arm/mach-exynos/clock-exynos4.c       | 1603
-------------------------
> ---
>  arch/arm/mach-exynos/clock-exynos4.h       |   35 -
>  arch/arm/mach-exynos/clock-exynos4210.c    |  188 ----
>  arch/arm/mach-exynos/clock-exynos4212.c    |  192 ----
>  arch/arm/mach-exynos/common.c              |   22 +-
>  arch/arm/mach-exynos/common.h              |    3 +
>  arch/arm/mach-exynos/mach-armlex4210.c     |    1 -
>  arch/arm/mach-exynos/mach-exynos4-dt.c     |    1 -
>  arch/arm/mach-exynos/mach-nuri.c           |    1 -
>  arch/arm/mach-exynos/mach-origen.c         |    1 -
>  arch/arm/mach-exynos/mach-smdk4x12.c       |    1 -
>  arch/arm/mach-exynos/mach-smdkv310.c       |    1 -
>  arch/arm/mach-exynos/mach-universal_c210.c |    1 -
>  arch/arm/mach-exynos/mct.c                 |   11 +-
>  arch/arm/plat-samsung/Kconfig              |    4 +-
>  17 files changed, 18 insertions(+), 2051 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/clock-exynos4.c
>  delete mode 100644 arch/arm/mach-exynos/clock-exynos4.h
>  delete mode 100644 arch/arm/mach-exynos/clock-exynos4210.c
>  delete mode 100644 arch/arm/mach-exynos/clock-exynos4212.c

I think, would be better to us if we could keep this clock stuff with common
clock for a moment, e.g. 3.8. In addition, the clock stuff is still updating
at this moment so we need some time to move on common clock framework
entirely. Of course, I have no objection to support common clock on new SoC
such as exynos5440 :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
