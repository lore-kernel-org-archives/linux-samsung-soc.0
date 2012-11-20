From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: S3C2443: SPI clock channel setup is fixed
Date: Tue, 20 Nov 2012 20:46:15 +0900
Message-ID: <0c8901cdc714$a567f7a0$f037e6e0$@org>
References: <50AAAABE.8090607@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60034 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753100Ab2KTLqR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 06:46:17 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS00J6CBBO4101@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 20:46:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS000HTBD3KJ20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 20:46:15 +0900 (KST)
In-reply-to: <50AAAABE.8090607@mail.ru>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexander Varnin' <fenixk19@mail.ru>, linux-samsung-soc@vger.kernel.org

Alexander Varnin wrote:
> 
> Actually, SPI channel 0 on 2443 is mapped to HS SPI controller,
> and to enable s3c2410-spi controller, we should power on channel
> 1 in PCLKCON. There is no channel 0 SPI on s3c2443, so delete its
> clock.
> 
> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c24xx/clock-s3c2443.c |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/clock-s3c2443.c
> b/arch/arm/mach-s3c24xx/clock-s3c2443.c
> index 7f689ce..bdaba59 100644
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
> --
> 1.7.2.5

Applied, thanks.

K-Gene <kgene@kernel.org>
