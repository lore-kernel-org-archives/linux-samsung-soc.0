From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: drop "select MACH_N35"
Date: Thu, 07 Mar 2013 09:02:33 +0900
Message-ID: <013a01ce1ac7$11b287d0$35179770$%kim@samsung.com>
References: <1362609234.28137.2.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36661 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754864Ab3CGACf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 19:02:35 -0500
In-reply-to: <1362609234.28137.2.camel@x61.thuisdomein>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Paul Bolle wrote:
> 
> The unused Kconfig symbol MACH_N35 was removed in commit
> 85fd6d63bf2927b9da7ab1b0d46723bfdb13808c ("ARM: S3C2410: move
> mach-s3c2410/* into mach-s3c24xx/"). But there is still one (pointless)
> select statement for that symbol. Drop it.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
>  arch/arm/mach-s3c24xx/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
> index 37f513d..7361b9d 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -320,7 +320,6 @@ config PM_H1940
> 
>  config MACH_N30
>  	bool "Acer N30 family"
> -	select MACH_N35
>  	select S3C_DEV_NAND
>  	select S3C_DEV_USB_HOST
>  	help
> --
> 1.7.11.7

Yes, right. Applied, thanks.

BTW, so the machine type can be removed at arch/arm/tools/mach-types as well.

- Kukjin
