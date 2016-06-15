From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 4/5] clk: max77686: Add support for MAX77620 clocks
Date: Wed, 15 Jun 2016 11:27:47 -0400
Message-ID: <ba35a3a4-91f9-a9d8-16c9-0cdd409da48d@osg.samsung.com>
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com>
 <1466000018-16784-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466000018-16784-5-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Laxman,

On 06/15/2016 10:13 AM, Laxman Dewangan wrote:
> Maxim Max77620 has one 32KHz clock output and the clock HW
> IP used on this PMIC is same as what it is there in the MAX77686.
> 
> Add clock driver support for MAX77620 on the MAX77686 driver.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> CC: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> CC: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/clk/Kconfig        |  7 ++++---
>  drivers/clk/clk-max77686.c | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 6afad74..d75f4c5 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -32,10 +32,11 @@ config COMMON_CLK_WM831X
>  source "drivers/clk/versatile/Kconfig"
>  
>  config COMMON_CLK_MAX77686
> -	tristate "Clock driver for Maxim 77686/77802 MFD"
> -	depends on MFD_MAX77686
> +	tristate "Clock driver for Maxim 77686/77802/MAX77620 MFD"
> +	depends on MFD_MAX77686 || MFD_MAX77620
>  	---help---
> -	  This driver supports Maxim 77686/77802 crystal oscillator clock.
> +	  This driver supports Maxim 77686/77802/MAX77620 crystal oscillator

s/MAX77620/77620

Besides this minor nit, the patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
