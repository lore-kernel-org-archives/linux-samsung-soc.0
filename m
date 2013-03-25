From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Remove useless Samsung GPIO related CONFIG
Date: Mon, 25 Mar 2013 10:08:32 +0900
Message-ID: <16e101ce28f5$44aead80$ce0c0880$%kim@samsung.com>
References: <1363865141.1390.120.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1363865141.1390.120.camel@x61.thuisdomein>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Paul Bolle wrote:
> 
> The Kconfig entry for S3C_GPIO_CFG_S3C64XX was missed by commit
> 5ec7414494ed1204c9e2ed0b8232b29860d0986f ("ARM: SAMSUNG: Remove useless
> Samsung GPIO related CONFIGs"). Remove it now.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Untested.
> 
>  arch/arm/plat-samsung/Kconfig | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 663c54f..91c2d72 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -117,12 +117,6 @@ config SAMSUNG_GPIOLIB_4BIT
>  	  configuration. GPIOlib shall be compiled only for S3C64XX and S5P
>  	  series of processors.
> 
> -config S3C_GPIO_CFG_S3C64XX
> -	bool
> -	help
> -	  Internal configuration to enable S3C64XX style GPIO configuration
> -	  functions.
> -
>  config S5P_GPIO_DRVSTR
>  	bool
>  	help
> --
> 1.7.11.7

Applied, thanks.

- Kukjin
