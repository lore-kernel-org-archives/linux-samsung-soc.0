From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 2/3] ARM: EXYNOS4: Add support for secondary MMC port on
	ORIGEN
Date: Wed, 31 Aug 2011 09:53:11 +0900
Message-ID: <000201cc6778$5bd7d670$13878350$%kim@samsung.com>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
	<1314351524-10942-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: <1314351524-10942-3-git-send-email-tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-language: ko
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: 'Tushar Behera' <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Tushar Behera wrote:
> -----Original Message-----
> From: Tushar Behera [mailto:tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
> Sent: Friday, August 26, 2011 6:39 PM
> To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org; kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> Subject: [PATCH 2/3] ARM: EXYNOS4: Add support for secondary MMC port on
> ORIGEN
> 
> Secondary MMC port on ORIGEN is connected to sdhci instance 0. Support
> for secondary MMC port is extended by registering sdhci instance 0.
> 
> Since sdhci instance 2 can contain a bootable media, sdhci instance 0
> is registered after instance 2.
> 
Would be helpful if above comments could be included in codes :)

> Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/mach-exynos4/Kconfig       |    1 +
>  arch/arm/mach-exynos4/mach-origen.c |    7 +++++++
>  2 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index e6925de..4c14d5e 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -229,6 +229,7 @@ config MACH_ORIGEN
>  	select CPU_EXYNOS4210
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
> +	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC2
>  	select EXYNOS4_SETUP_SDHCI
>  	help
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index e280270..ae18812 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -72,6 +72,11 @@ static struct s3c2410_uartcfg origen_uartcfgs[]
__initdata = {
>  	},
>  };
> 
> +static struct s3c_sdhci_platdata origen_hsmmc0_pdata __initdata = {
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
> +	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> +};
> +
>  static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
>  	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> @@ -79,6 +84,7 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata
> __initdata = {
> 
>  static struct platform_device *origen_devices[] __initdata = {
>  	&s3c_device_hsmmc2,
> +	&s3c_device_hsmmc0,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
>  };
> @@ -93,6 +99,7 @@ static void __init origen_map_io(void)
>  static void __init origen_machine_init(void)
>  {
>  	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
> +	s3c_sdhci0_set_platdata(&origen_hsmmc0_pdata);
>  	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
>  }
> 
> --
> 1.7.4.1

OK, will apply.
If you don't mind, I will add comments the reason of the ordering when I
apply this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
