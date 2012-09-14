From: kgene@kernel.org
Subject: RE: [PATCH 9/15] arch/arm/mach-s3c24xx/mach-h1940.c: removes
 unnecessary semicolon
Date: Fri, 14 Sep 2012 13:03:58 +0900
Message-ID: <01a301cd922d$f72da600$e588f200$@org>
References: <1347469402-27557-9-git-send-email-peter.senna@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29391 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771Ab2INEEB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 00:04:01 -0400
In-reply-to: <1347469402-27557-9-git-send-email-peter.senna@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Peter Senna Tschudin' <peter.senna@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Peter Senna Tschudin wrote:
> 
> From: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> removes unnecessary semicolon
> 
> Found by Coccinelle: http://coccinelle.lip6.fr/
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> ---
>  arch/arm/mach-s3c24xx/mach-h1940.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-
> s3c24xx/mach-h1940.c
> index bb8d008..02ef7d5 100644
> --- a/arch/arm/mach-s3c24xx/mach-h1940.c
> +++ b/arch/arm/mach-s3c24xx/mach-h1940.c
> @@ -460,7 +460,7 @@ static void h1940_set_mmc_power(unsigned char
> power_mode, unsigned short vdd)
>  		break;
>  	default:
>  		break;
> -	};
> +	}
>  }
> 
>  static struct s3c24xx_mci_pdata h1940_mmc_cfg __initdata = {

Applied, thanks.

K-Gene <kgene@kernel.org>
