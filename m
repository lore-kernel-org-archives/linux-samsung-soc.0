From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: drop "select MACH_NEO1973"
Date: Mon, 11 Mar 2013 16:09:24 +0900
Message-ID: <052301ce1e27$5cc9cd10$165d6730$%kim@samsung.com>
References: <1362856081.3137.19.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1362856081.3137.19.camel@x61.thuisdomein>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Paul Bolle wrote:
> 
> The Kconfig entry for the Openmoko GTA02 / Freerunner phone selects
> MACH_NEO1973. But there is no Kconfig symbol MACH_NEO1973. The select
> statement for that symbol is a nop. It can safely be dropped.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> 0) Tested with "git grep".
> 
> 1) There appear to be repositories that carry a "config MACH_NEO1973" in
> their tree. I guess it is used to collect functionality common to the
> GTA01 and the GTA02. But except for this select statement, MACH_NEO1973
> was never used in mainline. So if the GTA01 code ever gets merged into
> mainline, this select statement might be added once more (if it is
> actually needed then).
> 
>  arch/arm/mach-s3c24xx/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
> index 7361b9d..bec43fe 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -641,7 +641,6 @@ comment "S3C2442 Boards"
>  config MACH_NEO1973_GTA02
>  	bool "Openmoko GTA02 / Freerunner phone"
>  	select I2C
> -	select MACH_NEO1973
>  	select MFD_PCF50633
>  	select PCF50633_GPIO
>  	select POWER_SUPPLY
> --
> 1.7.11.7

Yeah, we don't need it.

Applied, thanks.

- Kukjin
