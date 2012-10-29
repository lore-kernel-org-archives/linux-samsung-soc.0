From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: Exynos5: Remove static io-remapping for gic and
 combiner
Date: Mon, 29 Oct 2012 20:23:39 +0900
Message-ID: <508E673B.30106@samsung.com>
References: <1351516573-393-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:47299 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714Ab2J2OjN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Oct 2012 10:39:13 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so2011175bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Oct 2012 07:39:12 -0700 (PDT)
In-Reply-To: <1351516573-393-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

On 10/29/12 22:16, Thomas Abraham wrote:
> The physical base address of GIC and Interrupt Combiner is obtained from
> device tree and then remapped during initialization. So remove the
> static io-remapping for GIC and combiner.
>
> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
> ---
>   arch/arm/mach-exynos/common.c |   15 ---------------
>   1 files changed, 0 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 5a305f0..5c75815 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -256,25 +256,10 @@ static struct map_desc exynos5_iodesc[] __initdata = {
>   		.length		= SZ_64K,
>   		.type		= MT_DEVICE,
>   	}, {
> -		.virtual	= (unsigned long)S5P_VA_COMBINER_BASE,
> -		.pfn		= __phys_to_pfn(EXYNOS5_PA_COMBINER),
> -		.length		= SZ_4K,
> -		.type		= MT_DEVICE,
> -	}, {
>   		.virtual	= (unsigned long)S3C_VA_UART,
>   		.pfn		= __phys_to_pfn(EXYNOS5_PA_UART),
>   		.length		= SZ_512K,
>   		.type		= MT_DEVICE,
> -	}, {
> -		.virtual	= (unsigned long)S5P_VA_GIC_CPU,
> -		.pfn		= __phys_to_pfn(EXYNOS5_PA_GIC_CPU),
> -		.length		= SZ_8K,
> -		.type		= MT_DEVICE,
> -	}, {
> -		.virtual	= (unsigned long)S5P_VA_GIC_DIST,
> -		.pfn		= __phys_to_pfn(EXYNOS5_PA_GIC_DIST),
> -		.length		= SZ_4K,
> -		.type		= MT_DEVICE,
>   	},
>   };
>

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
