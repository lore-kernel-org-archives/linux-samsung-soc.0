From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 08/14] i2c: exynos5: Add Kconfig dependencies
Date: Wed, 27 Aug 2014 21:03:11 -0700
Message-ID: <20140828040311.GD4972@localhost>
References: <1409132740-1954-1-git-send-email-ch.naveen@samsung.com>
 <1409132740-1954-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409132740-1954-2-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 27, 2014 at 03:15:40PM +0530, Naveen Krishna Chatradhi wrote:
> The i2c-exynos5.c driver can be reused for the HSI2C controller
> on Exynos7 SoCs from Samsung.
> 
> This patch adds the Kconfig dependency to choose i2c-exynos5.c
> for CONFIG_ARCH_EXYNOS7.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> ---
>  drivers/i2c/busses/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 2ac87fa..bd18fa6 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -465,7 +465,7 @@ config I2C_EG20T
>  
>  config I2C_EXYNOS5
>  	tristate "Exynos5 high-speed I2C driver"
> -	depends on ARCH_EXYNOS5 && OF
> +	depends on (ARCH_EXYNOS5 || ARCH_EXYNOS7) && OF

Ick, this will keep growing. Please use ARCH_EXYNOS instead. Yes,
this means you need to add it to the arm64 Kconfig and select it from
ARCH_EXYNOS7.



-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
