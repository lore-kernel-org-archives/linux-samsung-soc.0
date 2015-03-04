From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 01/10] Input: s3c2410_ts: fix S3C_ADC dependency
Date: Wed, 4 Mar 2015 15:05:29 -0800
Message-ID: <20150304230529.GC38298@dtor-ws>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
 <1425299763-4066822-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:41249 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbbCDXFe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 18:05:34 -0500
Received: by igal13 with SMTP id l13so41349036iga.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2015 15:05:34 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1425299763-4066822-2-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, ch.naveen@samsung.com, a.kesavan@samsung.com, cw00.choi@samsung.com, jic23@kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, padma.v@samsung.com

On Mon, Mar 02, 2015 at 01:35:54PM +0100, Arnd Bergmann wrote:
> S3C_ADC is only available on machines that don't do ARCH_MULTIPLATFORM,
> so changing the 'select' into 'depends on' here helps us move to
> ARCH_MULTIPLATFORM without introducing regressions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/touchscreen/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 58917525126e..3b4cd9ab1af0 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -326,7 +326,7 @@ config TOUCHSCREEN_ILI210X
>  config TOUCHSCREEN_S3C2410
>  	tristate "Samsung S3C2410/generic touchscreen input driver"
>  	depends on ARCH_S3C24XX || SAMSUNG_DEV_TS
> -	select S3C_ADC
> +	depends on S3C_ADC
>  	help
>  	  Say Y here if you have the s3c2410 touchscreen.
>  
> -- 
> 2.1.0.rc2
> 

-- 
Dmitry
