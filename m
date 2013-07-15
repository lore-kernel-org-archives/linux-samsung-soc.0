From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: s3c24xx: fix typo "ARM_S3C24XX"
Date: Mon, 15 Jul 2013 15:01:42 +0530
Message-ID: <CAKohpok1xvsVrssYrNJJZ2GTLJZVnY8SrCzNx+VdXbiMjL6uLw@mail.gmail.com>
References: <1373803339.1370.18.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:55829 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754636Ab3GOJbm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 05:31:42 -0400
Received: by mail-ob0-f176.google.com with SMTP id v19so13736064obq.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jul 2013 02:31:42 -0700 (PDT)
In-Reply-To: <1373803339.1370.18.camel@x61.thuisdomein>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 14 July 2013 17:32, Paul Bolle <pebolle@tiscali.nl> wrote:
> Kconfig symbol S3C24XX_PLL depends on ARM_S3C24XX. But that symbol
> doesn't exist. Commit f023f8dd59bf ("cpufreq: s3c24xx: move cpufreq
> driver to drivers/cpufreq"), which added this typo, makes clear that
> ARM_S3C24XX_CPUFREQ was intended here.
>
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Untested!
>
>  arch/arm/mach-s3c24xx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
> index 6d9252e..7791ac7 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -208,7 +208,7 @@ config S3C24XX_GPIO_EXTRA128
>
>  config S3C24XX_PLL
>         bool "Support CPUfreq changing of PLL frequency (EXPERIMENTAL)"
> -       depends on ARM_S3C24XX
> +       depends on ARM_S3C24XX_CPUFREQ
>         help
>           Compile in support for changing the PLL frequency from the
>           S3C24XX series CPUfreq driver. The PLL takes time to settle

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

@Rafael: I saw you taking other s3c patch directly. Mind taking this
one too?
