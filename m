From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH for 2.6.38] ARM: S5PC110: update max8998_platform_data
Date: Fri, 18 Feb 2011 18:18:58 +0900
Message-ID: <020f01cbcf4c$df47f450$9dd7dcf0$%kim@samsung.com>
References: <1297760464-7639-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52136 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756736Ab1BRJS7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Feb 2011 04:18:59 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGT002ZY37MJHD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Feb 2011 18:18:58 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGT00D6M37MKE@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Feb 2011 18:18:58 +0900 (KST)
In-reply-to: <1297760464-7639-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com

Marek Szyprowski wrote:
> 
> Max8998 PMIC driver's platform data has been changed once again in
> commit 735a3d9efdc. This patch fixes build break caused by that commit.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-aquila.c |    9 ++++++---
>  arch/arm/mach-s5pv210/mach-goni.c   |    9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-
> s5pv210/mach-aquila.c
> index 461aa035..1236e19 100644
> --- a/arch/arm/mach-s5pv210/mach-aquila.c
> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
> @@ -381,9 +381,12 @@ static struct max8998_platform_data
aquila_max8998_pdata
> = {
>  	.buck1_set1	= S5PV210_GPH0(3),
>  	.buck1_set2	= S5PV210_GPH0(4),
>  	.buck2_set3	= S5PV210_GPH0(5),
> -	.buck1_max_voltage1 = 1200000,
> -	.buck1_max_voltage2 = 1200000,
> -	.buck2_max_voltage = 1200000,
> +	.buck1_voltage1	= 1200000,
> +	.buck1_voltage2	= 1200000,
> +	.buck1_voltage3	= 1200000,
> +	.buck1_voltage4	= 1200000,
> +	.buck2_voltage1	= 1200000,
> +	.buck2_voltage2	= 1200000,
>  };
>  #endif
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index e22d511..2beeb66 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -521,9 +521,12 @@ static struct max8998_platform_data
goni_max8998_pdata =
> {
>  	.buck1_set1	= S5PV210_GPH0(3),
>  	.buck1_set2	= S5PV210_GPH0(4),
>  	.buck2_set3	= S5PV210_GPH0(5),
> -	.buck1_max_voltage1 = 1200000,
> -	.buck1_max_voltage2 = 1200000,
> -	.buck2_max_voltage = 1200000,
> +	.buck1_voltage1	= 1200000,
> +	.buck1_voltage2	= 1200000,
> +	.buck1_voltage3	= 1200000,
> +	.buck1_voltage4	= 1200000,
> +	.buck2_voltage1	= 1200000,
> +	.buck2_voltage2	= 1200000,
>  };
>  #endif
> 
> --

Ok, applied into s5p-fixes-for-linus for 38.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
