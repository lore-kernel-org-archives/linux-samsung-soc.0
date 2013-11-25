From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] thermal: offer Samsung thermal support only when
 ARCH_EXYNOS is defined
Date: Mon, 25 Nov 2013 16:14:32 +0100
Message-ID: <6304764.ZpvNMfgtqL@amdc1032>
References: <2958660.aJeCDrTTOe@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <2958660.aJeCDrTTOe@amdc1032>
Sender: linux-pm-owner@vger.kernel.org
To: Eduardo Valentin <eduardo.valentin@ti.com>
Cc: Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Amit Daniel Kachhap <amit.daniel@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

Could you please apply this patch?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

On Friday, October 04, 2013 02:36:42 PM Bartlomiej Zolnierkiewicz wrote:
> Menu for Samsung thermal support is visible on all Samsung
> platforms while thermal drivers are currently available only
> for EXYNOS SoCs. Fix it by replacing PLAT_SAMSUNG dependency
> with ARCH_EXYNOS one.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/thermal/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index a709c63..05cf95c 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -198,7 +198,7 @@ source "drivers/thermal/ti-soc-thermal/Kconfig"
>  endmenu
>  
>  menu "Samsung thermal drivers"
> -depends on PLAT_SAMSUNG
> +depends on ARCH_EXYNOS
>  source "drivers/thermal/samsung/Kconfig"
>  endmenu

