From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Update config file of NURI to enable RTC
Date: Fri, 12 Aug 2011 17:26:06 +0900
Message-ID: <006201cc58c9$7c7b7c00$75727400$%kim@samsung.com>
References: <4E27FEBC.7050302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <4E27FEBC.7050302@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'linux-kernel' <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Chanwoo Choi wrote:
> 
> This patch update config file of NURI board to enable RTC
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index b735705..bb675fb 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -184,6 +184,7 @@ config MACH_NURI
>  	bool "Mobile NURI Board"
>  	select CPU_EXYNOS4210
>  	select S3C_DEV_WDT
> +	select S3C_DEV_RTC
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC2
>  	select S3C_DEV_HSMMC3
> --
> 1.7.0.4

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
