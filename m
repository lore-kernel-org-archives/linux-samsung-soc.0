From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Remove duplicated camera clock
Date: Sat, 10 Nov 2012 16:00:54 +0100
Message-ID: <2289245.SN9NHa7Y7x@flatron>
References: <509e602f.a766980a.0f91.14f4@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:58949 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727Ab2KJPA5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Nov 2012 10:00:57 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so2655698eek.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Nov 2012 07:00:56 -0800 (PST)
In-Reply-To: <509e602f.a766980a.0f91.14f4@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dron0gus@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, sylvester.nawrocki@gmail.com, Andrey Gusakov <dron_gus@mail.ru>

Hi Andrey,

On Saturday 10 of November 2012 18:07:56 dron0gus@gmail.com wrote:
> From: Andrey Gusakov <dron_gus@mail.ru>
> 
> Camera clock defined two times. One in init_clocks_off array with
> "cam" name, second in clksrcs array with "camera" name. Leave
> second definition because clock have divider.
> 
> Signed-off-by: Andrey Gusakov <dron0gus@gmail.com>
> ---
>  arch/arm/mach-s3c64xx/clock.c |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/clock.c
> b/arch/arm/mach-s3c64xx/clock.c index cacbe45..b2d08fa 100644
> --- a/arch/arm/mach-s3c64xx/clock.c
> +++ b/arch/arm/mach-s3c64xx/clock.c
> @@ -319,10 +319,6 @@ static struct clk init_clocks_off[] = {
>  		.enable		= s3c64xx_sclk_ctrl,
>  		.ctrlbit	= S3C_CLKCON_SCLK_MFC,
>  	}, {
> -		.name		= "cam",
> -		.enable		= s3c64xx_sclk_ctrl,
> -		.ctrlbit	= S3C_CLKCON_SCLK_CAM,
> -	}, {
>  		.name		= "sclk_jpeg",
>  		.enable		= s3c64xx_sclk_ctrl,
>  		.ctrlbit	= S3C_CLKCON_SCLK_JPEG,

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz Figa
