From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] S3C24XX: remove unneeded "config SMDK2440_CPU2442"
Date: Mon, 25 Mar 2013 10:08:38 +0900
Message-ID: <16e201ce28f5$4870be90$d9523bb0$%kim@samsung.com>
References: <1363778011.1390.96.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1363778011.1390.96.camel@x61.thuisdomein>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Paul Bolle wrote:
> 
> The Kconfig entry for SMDK2440_CPU2442 was moved from one Kconfig file
> to another in commit acf2d41d8595829eb0ac7bf6891f4875a78d4d6e ("ARM:
> S3C24XX: Move mach-s3c2440/ pll into mach-s3c24xx/"). In that move it
> also lost its statement to select CPU_S3C2442. That was not needed
> anymore because it now depended on that same symbol.
> 
> But without its select this entry became a nop: enabling it has no
> effect, as it changes no code. It can safely be removed.
> 
> Fix a related, and trivial, comment typo too.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Untested.
> 
>  arch/arm/mach-s3c24xx/Kconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
> index 37f513d..92c07a2 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -663,10 +663,7 @@ config MACH_RX1950
>  	help
>  	   Say Y here if you're using HP iPAQ rx1950
> 
> -config SMDK2440_CPU2442
> -	bool "SMDM2440 with S3C2442 CPU module"
> -
> -endif	# CPU_S3C2440
> +endif	# CPU_S3C2442
> 
>  if CPU_S3C2443 || CPU_S3C2416
> 
> --
> 1.7.11.7

Looks good to me, applied.

Thanks.

- Kukjin
