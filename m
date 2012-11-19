From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C2443: SPI clock channel setup is fixed
Date: Mon, 19 Nov 2012 22:32:25 +0100
Message-ID: <201211192232.25304.heiko@sntech.de>
References: <1353335637-29879-1-git-send-email-fenixk19@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58731 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752114Ab2KSVc2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 16:32:28 -0500
In-Reply-To: <1353335637-29879-1-git-send-email-fenixk19@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org

Am Montag, 19. November 2012, 15:33:57 schrieb Alexander Varnin:
> Actually, SPI channel 0 on 2443 is mapped to HS SPI controller,
> and to enable s3c2410-spi controller, we should power on channel
> 1 in PCLKCON. There is no channel 0 SPI on s3c2443, so delete its
> clock.
> 
> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>

You're right of course. The second spi channel (pclkcon_spi1) even uses the 
registers for the first s3c24xx-spi channel.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


But you might want to resend your patch and include 

	Kukjin Kim <kgene.kim@samsung.com>

(the maintainer of Samsung code) as recipient, because I don't know if he'll 
see it otherwise.


> ---
>  arch/arm/mach-s3c24xx/clock-s3c2443.c |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/clock-s3c2443.c
> b/arch/arm/mach-s3c24xx/clock-s3c2443.c index 7f689ce..bdaba59 100644
> --- a/arch/arm/mach-s3c24xx/clock-s3c2443.c
> +++ b/arch/arm/mach-s3c24xx/clock-s3c2443.c
> @@ -158,12 +158,6 @@ static struct clk init_clocks_off[] = {
>  		.devname	= "s3c2410-spi.0",
>  		.parent		= &clk_p,
>  		.enable		= s3c2443_clkcon_enable_p,
> -		.ctrlbit	= S3C2443_PCLKCON_SPI0,
> -	}, {
> -		.name		= "spi",
> -		.devname	= "s3c2410-spi.1",
> -		.parent		= &clk_p,
> -		.enable		= s3c2443_clkcon_enable_p,
>  		.ctrlbit	= S3C2443_PCLKCON_SPI1,
>  	}
>  };
