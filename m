From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 3/3] ARM: S3C24XX: update uart addresses in s3c2416-dt
 auxdata
Date: Wed, 19 Jun 2013 02:39:10 +0900
Message-ID: <51C09B3E.2040002@samsung.com>
References: <201306140044.15568.heiko@sntech.de> <201306140046.25954.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:60239 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755152Ab3FRRjO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 13:39:14 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj3so4241353pad.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 10:39:14 -0700 (PDT)
In-Reply-To: <201306140046.25954.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linus.walleij@linaro.org

On 06/14/13 07:46, Heiko St=C3=BCbner wrote:
> Commit 9ee51f01eee8 (tty: serial/samsung: make register definitions g=
lobal)
> removed the S3C2410_PA_UARTX defines that the newly merged s3c2416 dt
> support still expected.
>
> So update mach-s3c2416-dt.c to use the S3C24XX_PA_UART constant
> until we have support for the common clock framework the the s3c2416-=
dt.
>
OK, applied.

Thanks,
- Kukjin

> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> ---
>   arch/arm/mach-s3c24xx/mach-s3c2416-dt.c |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c b/arch/arm/mach-=
s3c24xx/mach-s3c2416-dt.c
> index f5c9072..f50454a 100644
> --- a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> +++ b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> @@ -43,13 +43,13 @@
>    * data from the device tree.
>    */
>   static const struct of_dev_auxdata s3c2416_auxdata_lookup[] __initc=
onst =3D {
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C2410_PA_UART0,
> +	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART,
>   				"s3c2440-uart.0", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C2410_PA_UART1,
> +	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART + 0x4000,
>   				"s3c2440-uart.1", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C2410_PA_UART2,
> +	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART + 0x8000,
>   				"s3c2440-uart.2", NULL),
> -	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C2443_PA_UART3,
> +	OF_DEV_AUXDATA("samsung,s3c2440-uart", S3C24XX_PA_UART + 0xC000,
>   				"s3c2440-uart.3", NULL),
>   	OF_DEV_AUXDATA("samsung,s3c6410-sdhci", S3C_PA_HSMMC0,
>   				"s3c-sdhci.0", NULL),
