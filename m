From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: S3C2410: Fix on build warning about dependency in
 mach-s3c2440/Kconfig
Date: Fri, 13 Aug 2010 13:57:12 +0400
Message-ID: <4C6516F8.9060202@ru.mvista.com>
References: <1281687307-2421-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:52553 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761390Ab0HMJ6q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Aug 2010 05:58:46 -0400
Received: by eyg5 with SMTP id 5so48005eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2010 02:58:45 -0700 (PDT)
In-Reply-To: <1281687307-2421-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hello.

Kukjin Kim wrote:

> This patch fixes on following build warnings.

> warning: (CPU_S3C2440 && ARCH_S3C2410 && S3C2410_DMA) selects S3C2440_DMA which
>              has unmet direct dependencies (ARCH_S3C2410 && CPU_S3C24405B)
> warning: (CPU_S3C2440 && ARCH_S3C2410 || CPU_S3C2442 && ARCH_S3C2410) selects
>              CPU_S3C244X which has unmet direct dependencies (!ARCH_S3C2410)

> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/arm/mach-s3c2440/Kconfig |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

> diff --git a/arch/arm/mach-s3c2440/Kconfig b/arch/arm/mach-s3c2440/Kconfig
> index cd8e7de..f60a370 100644
> --- a/arch/arm/mach-s3c2440/Kconfig
> +++ b/arch/arm/mach-s3c2440/Kconfig
> @@ -30,7 +30,7 @@ config CPU_S3C2442
>  
>  config CPU_S3C244X
>  	bool
> -	depends on ARCH_S3C2410 && (CPU_S3C2440 || CPU_S3C2442)
> +	depends on (CPU_S3C2440 || CPU_S3C2442)

    Parens not necessary...

>  	help
>  	  Support for S3C2440 and S3C2442 Samsung Mobile CPU based systems.
>  
> @@ -72,7 +72,7 @@ config S3C2440_PLL_16934400
>  
>  config S3C2440_DMA
>  	bool
> -	depends on ARCH_S3C2410 && CPU_S3C24405B
> +	depends on (ARCH_S3C2410 || CPU_S3C24405B)

    Same comment here...

WBR, Sergei
