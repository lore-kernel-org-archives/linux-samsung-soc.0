From: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: resolve infinite loop issue on multi-platform
Date: Thu, 06 Nov 2014 13:11:27 +0100
Message-ID: <545B656F.40401@samsung.com>
References: <1415269965-427-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24087 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbaKFMLb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Nov 2014 07:11:31 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEM0056X9ZYAE50@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Nov 2014 12:14:22 +0000 (GMT)
In-reply-to: <1415269965-427-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

On 06.11.2014 11:32, Inki Dae wrote:
> This patch resolves temporarily infinite loop issue incurred
> when Exynos drm driver is enabled and multi-platform kernel
> is used by registering Exynos drm device object only in case
> of Exynos SoC. So this patch will be replaced with more generic
> way later.

Does not help for Rinato board.

On Rinato:
-----------------------
Failed to find PMU node
Registering SWP/SWPB emulation handler
mmc0: BKOPS_EN bit is not set
mmc_host mmc0: Bus speed (slot 0) = 100000000Hz (slot req 100000000Hz,
actual 100000000HZ div = 0)
exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
mmc0: new HS200 MMC card at address 0001
platform exynos-drm: Driver exynos-drm requests probe deferral
mmcblk0: mmc0:0001 F5X5MA 3.64 GiB
mmcblk0boot0: mmc0:0001 F5X5MA partition 1 4.00 MiB
exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
mmcblk0boot1: mmc0:0001 F5X5MA partition 2 4.00 MiB
platform exynos-drm: Driver exynos-drm requests probe deferral
mmcblk0rpmb: mmc0:0001 F5X5MA partition 3 512 KiB
exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
platform exynos-drm: Driver exynos-drm requests probe deferral
 mmcblk0: p1 p2 p3 p4 p5 p6 p7
exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
platform exynos-drm: Driver exynos-drm requests probe deferral
exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
platform exynos-drm: Driver exynos-drm requests probe deferral

and so on...
-----------------------

I do not know whether it is related but Trats2 board cannot boot due to
lockup after:
[drm] Initialized drm 1.1.0 20060810
(with or without the patch)
https://lkml.org/lkml/2014/11/6/125

Best regards,
Krzysztof

> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 443a206..ecc86aa 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -734,6 +734,18 @@ static int exynos_drm_init(void)
>  {
>  	int ret;
>  
> +	/*
> +	 * Register device object only in case of Exynos SoC.
> +	 *
> +	 * Below codes resolves temporarily infinite loop issue incurred
> +	 * by Exynos drm driver when using multi-platform kernel.
> +	 * So these codes will be replaced with more generic way later.
> +	 */
> +	if (!of_machine_is_compatible("samsung,exynos3") &&
> +			!of_machine_is_compatible("samsung,exynos4") &&
> +			!of_machine_is_compatible("samsung,exynos5"))
> +		return -ENODEV;
> +
>  	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
>  								NULL, 0);
>  	if (IS_ERR(exynos_drm_pdev))
> 
