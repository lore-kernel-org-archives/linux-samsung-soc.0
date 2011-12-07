From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH 0/2] Add PM_RUNTIME related fixes for PL330
Date: Wed, 07 Dec 2011 17:58:06 +0900
Message-ID: <000301ccb4be$55cc4ca0$0164e5e0$%kim@samsung.com>
References: <03ed01ccb4b3$714b7ce0$53e276a0$%kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <03ed01ccb4b3$714b7ce0$53e276a0$%kim@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: tushar.behera@linaro.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, vinod.koul@intel.com
List-Id: linux-samsung-soc@vger.kernel.org

Tushar Behera [mailto:tushar.behera@linaro.org] wrote:

> Sent: Tuesday, December 06, 2011 7:46 PM
> To: linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: kgene.kim@samsung.com; vinod.koul@intel.com;
> linaro-dev@lists.linaro.org; patches@linaro.org
> Subject: [PATCH 0/2] Add PM_RUNTIME related fixes for PL330
>
> Hi,
>
> When PM_RUNTIME is enabled, PL330 probe fails because of some
> mismatch in pm_runtime calls. This patchset fixes those issues.
>
> This patch is based on Kukjin's for-next branch and tested on
> EXYNOS4 based Origen board.
>

This patch works well when PM_RUNTIME is enabled.
Looks good to me. Thanks.

> d3d936c "Merge branch 'samsung-fixes-2' into for-next"
>
> Tushar Behera (2):
> To Vinod Koul <vinod.koul@intel.com>:
>   DMA: PL330: Remove pm_runtime_xxx calls from pl330 probe/remove
>
> To Kukjin Kim <kgene.kim@samsung.com>:
>   ARM: EXYNOS: Add apb_pclk clkdev entry for mdma1
>
>  arch/arm/mach-exynos/clock.c |    1 +
>  drivers/dma/pl330.c          |   17 ++---------------
>  2 files changed, 3 insertions(+), 15 deletions(-)
>

> --
> 1.7.4.1
