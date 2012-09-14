From: kgene@kernel.org
Subject: RE: [PATCH] arch/arm/mach-s3c24xx/mach-h1940.c: delete double
 assignment
Date: Fri, 14 Sep 2012 13:03:12 +0900
Message-ID: <01a201cd922d$dc49a550$94dceff0$@org>
References: <1347478135-744-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29269 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab2INEDO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 00:03:14 -0400
In-reply-to: <1347478135-744-1-git-send-email-Julia.Lawall@lip6.fr>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Julia Lawall' <Julia.Lawall@lip6.fr>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: kernel-janitors@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall wrote:
> 
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Delete successive assignments to the same location.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression i;
> @@
> 
> *i = ...;
>  i = ...;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> Not compiled, and this may change the behavior of the code.  Without this
> change, check_gpio2 could possibly be used uninitialized later.
> 
>  arch/arm/mach-s3c24xx/mach-h1940.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-
> s3c24xx/mach-h1940.c
> index bb8d008..477778c 100644
> --- a/arch/arm/mach-s3c24xx/mach-h1940.c
> +++ b/arch/arm/mach-s3c24xx/mach-h1940.c
> @@ -380,7 +380,7 @@ int h1940_led_blink_set(unsigned gpio, int state,
>  	default:
>  		blink_gpio = S3C2410_GPA(3);
>  		check_gpio1 = S3C2410_GPA(1);
> -		check_gpio1 = S3C2410_GPA(7);
> +		check_gpio2 = S3C2410_GPA(7);
>  		break;
>  	}
> 
Applied, thanks.

K-Gene <kgene@kernel.org>
