From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos: Remove duplicated SROMC static memory mapping
Date: Wed, 28 Dec 2011 16:59:16 +0900
Message-ID: <01e301ccc536$989e5180$c9daf480$%kim@samsung.com>
References: <1324966343-7560-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45336 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716Ab1L1H7U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 02:59:20 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWW009SDM6OQ8O0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Dec 2011 16:59:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWW00GB1M6SCU40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 28 Dec 2011 16:59:19 +0900 (KST)
In-reply-to: <1324966343-7560-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> 
> SROMC static memory mapping is included in the common s5p initialization
> code. Hence, remove the duplicated SROMC static memory mapping for Exynos.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> This was identified while testing Nicolas Pitre's vmalloc.h removal
> patch series for Exynos. The duplicated static memory mapping caused
> the detection of overlapped memory region (in vm_area_add_early) which
> resulted in boot failure.
> 
>  arch/arm/mach-exynos/cpu.c |    5 -----
>  1 files changed, 0 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
> index 1213027..574f4b9 100644
> --- a/arch/arm/mach-exynos/cpu.c
> +++ b/arch/arm/mach-exynos/cpu.c
> @@ -118,11 +118,6 @@ static struct map_desc exynos4_iodesc[] __initdata =
> {
>  		.length		= SZ_64K,
>  		.type		= MT_DEVICE,
>  	}, {
> -		.virtual	= (unsigned long)S5P_VA_SROMC,
> -		.pfn		= __phys_to_pfn(EXYNOS4_PA_SROMC),
> -		.length		= SZ_4K,
> -		.type		= MT_DEVICE,
> -	}, {
>  		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
>  		.pfn		= __phys_to_pfn(EXYNOS4_PA_HSPHY),
>  		.length		= SZ_4K,
> --
> 1.6.6.rc2

Oops, OK. Let me send this before v3.2.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
