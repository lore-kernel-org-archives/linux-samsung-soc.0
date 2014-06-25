From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 1/1] i2c: Kconfig: Enable HSI2C for Exynos5 platform
Date: Wed, 25 Jun 2014 19:20:27 +0900
Message-ID: <01d701cf905f$158def70$40a9ce50$@samsung.com>
References: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1403690523-1863-1-git-send-email-sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Sachin Kamat' <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 'Doug Anderson' <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> All Exynos5 platforms have HSI2C controllers and are needed by
> various IPs connected to the boards based on these SoCs. Thus
> select this by default for Exynos5 platforms.
> 
Yeah right, even upcoming exynos5 SoCs have only HS-I2C not I2C ;-)

> Signed-off-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks,
Kukjin

> ---
>  drivers/i2c/busses/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 9f7d5859cf65..c7918cffe790 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -465,9 +465,9 @@ config I2C_EG20T
>  config I2C_EXYNOS5
>  	tristate "Exynos5 high-speed I2C driver"
>  	depends on ARCH_EXYNOS5 && OF
> +	default y
>  	help
> -	  Say Y here to include support for high-speed I2C controller in the
> -	  Exynos5 based Samsung SoCs.
> +	  High-speed I2C controller on Exynos5 based Samsung SoCs.
> 
>  config I2C_GPIO
>  	tristate "GPIO-based bitbanging I2C"
> --
> 1.7.9.5
