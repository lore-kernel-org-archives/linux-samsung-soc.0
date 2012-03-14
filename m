From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 11/12] ARM: EXYNOS: add support device tree enabled
 board file for EXYNOS5
Date: Wed, 14 Mar 2012 15:37:15 -0700
Message-ID: <20120314223715.GA13872@quad.lixom.net>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
 <1331736138-28964-12-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47199 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752606Ab2CNWhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 18:37:22 -0400
Received: by pbcun15 with SMTP id un15so4706pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 15:37:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1331736138-28964-12-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@secretlab.ca>

On Wed, Mar 14, 2012 at 07:42:17AM -0700, Kukjin Kim wrote:
> This patch adds a new EXYNOS5 compatible device tree enabled board
> When using this, a corresponding device tree blob which describes the
> board's properties should be supplied at boot time to the kernel.

Hi,

Sorry, missed this last time around:

> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index a2ed05c..ac24386 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -362,7 +362,18 @@ config MACH_SMDK4412
>  	  Machine support for Samsung SMDK4412
>  endif
>  
> -comment "Flattened Device Tree based board for Exynos4 based SoC"
> +if ARCH_EXYNOS5
> +
> +comment "EXYNOS5250 Boards"
> +
> +config MACH_SMDK5250
> +	bool "SMDK5250"
> +	select SOC_EXYNOS5250
> +	help
> +	  Machine support for Samsung SMDK5250
> +endif


There's no board file for SMDK5250 in this series (and there shouldn't be since
it should all be covered by MACH_EXYNOS5_DT. So the above config option can go
away.


-Olof
