From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3 1/2] ARM: EXYNOS: Add AUXDATA for DP controller
Date: Tue, 12 Feb 2013 11:09:25 -0800
Message-ID: <1d8701ce0954$7a77af90$6f670eb0$@samsung.com>
References: <00c201cdfe9b$d992b970$8cb82c50$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16892 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933756Ab3BLTJq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 14:09:46 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI400JYXFW90O70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 04:09:45 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI4001V1FW72T90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 04:09:44 +0900 (KST)
In-reply-to: <00c201cdfe9b$d992b970$8cb82c50$%han@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>

Jingoo Han wrote:
> 
> Use AUXDATA to set the device names for DP controller instance
> discovered from device tree.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Tested with SMDK5250 board
> 
> Changes since v2:
> - rebase on linux-samsung for-next branch
> 
> Changes since v1:
> - replace the definition with the value
> 
>  arch/arm/mach-exynos/mach-exynos5-dt.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-
> exynos/mach-exynos5-dt.c
> index e99d3d8..00ee732 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -104,6 +104,7 @@ static const struct of_dev_auxdata
> exynos5250_auxdata_lookup[] __initconst = {
>  	OF_DEV_AUXDATA("samsung,mfc-v6", 0x11000000, "s5p-mfc-v6",
> NULL),
>  	OF_DEV_AUXDATA("samsung,exynos5250-tmu", 0x10060000,
>  				"exynos-tmu", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos5-dp", 0x145B0000, "exynos-
> dp", NULL),
>  	{},
>  };
> 
> --
> 1.7.2.5

OK, applied, this series.

Thanks.

- Kukjin
