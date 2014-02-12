From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: S3C24XX: Fix typo "CONFIG_CPUS_3C2443"
Date: Wed, 12 Feb 2014 15:17:28 +0530
Message-ID: <CAK9yfHyXmY52KmKPj6=te829-R83dfM7wB813h=+=zCpzzxobA@mail.gmail.com>
References: <1392198068.23759.7.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:54255 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbaBLJr3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 04:47:29 -0500
Received: by mail-lb0-f181.google.com with SMTP id z11so5790053lbi.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 01:47:28 -0800 (PST)
In-Reply-To: <1392198068.23759.7.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Richard Weinberger <richard@nod.at>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 12 February 2014 15:11, Paul Bolle <pebolle@tiscali.nl> wrote:
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Untested. This needs testing by people with access to knowledge,
> compilers, and/or hardware related to CPU_S3C2443. I'm not one of them.
>
>  arch/arm/mach-s3c24xx/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
> index 4adaa4b..1d77d70 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -484,7 +484,7 @@ struct platform_device s3c2440_device_dma = {
>  };
>  #endif
>
> -#if defined(CONFIG_CPUS_3C2443) || defined(CONFIG_CPU_S3C2416)
> +#if defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)

This is definitely a typo and the current fix looks good.

Reviewed-by: Sachin Kamat <sachin.kamat@linaro.org>

-- 
With warm regards,
Sachin
