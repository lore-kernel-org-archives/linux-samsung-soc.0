From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/8 v2] ARM: EXYNOS5: Add machine data for USB 2.0
Date: Thu, 26 Jul 2012 11:24:49 +0000
Message-ID: <201207261124.50141.arnd@arndb.de>
References: <1342866729-30460-1-git-send-email-gautam.vivek@samsung.com> <1342866729-30460-3-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:61341 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566Ab2GZVov (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jul 2012 17:44:51 -0400
In-Reply-To: <1342866729-30460-3-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vivek Gautam <gautam.vivek@samsung.com>, kgene.kim@samsung.com, l.majewski@samsung.com, kyungmin.park@samsung.com, thomas.abraham@linaro.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, m.szyprowski@samsung.com, yulgon.kim@samsung.com, av.tikhomirov@samsung.com, prashanth.g@samsung.com, boyko.lee@samsung.com, joshi@samsung.com, a.kesavan@samsung.com, olofj@google.com, ajaykumar.rs@samsung.com

On Saturday 21 July 2012, Vivek Gautam wrote:
> From: Ajay Kumar <ajaykumar.rs@samsung.com>
> 
> This patch adds address mapping of USB 2.0 PHY for exynos5
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>  arch/arm/mach-exynos/common.c           |    5 +++++
>  arch/arm/mach-exynos/include/mach/map.h |    2 ++
>  2 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 4eb39cd..92d5e61 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -275,6 +275,11 @@ static struct map_desc exynos5_iodesc[] __initdata = {
>                 .pfn            = __phys_to_pfn(EXYNOS5_PA_GIC_DIST),
>                 .length         = SZ_4K,
>                 .type           = MT_DEVICE,
> +       }, {
> +               .virtual        = (unsigned long)S3C_VA_USB_HSPHY,
> +               .pfn            = __phys_to_pfn(EXYNOS5_PA_USB_PHY),
> +               .length         = SZ_4K,
> +               .type           = MT_DEVICE,
>         },
>  };

Can you pleae explain why this is done in the changelog?

We try hard to do such mappings from the device driver instead,
so I'm surprised that this is necessary fo rthe USB phy.

	Arnd
