From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: mach-s3c24xx/common.c: fix uninitialized variable
 warning
Date: Thu, 17 Jan 2013 19:57:39 -0800
Message-ID: <00bf01cdf52f$f7c7d8f0$e7578ad0$@samsung.com>
References: <1358185860-5425-1-git-send-email-dinggnu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28896 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752798Ab3ARD5z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 22:57:55 -0500
In-reply-to: <1358185860-5425-1-git-send-email-dinggnu@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Cong Ding' <dinggnu@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Cong Ding wrote:
> 
> the use of variable tmp is uninitialized, so we fix it.
> 
> Signed-off-by: Cong Ding <dinggnu@gmail.com>
> ---
>  arch/arm/mach-s3c24xx/common.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-
> s3c24xx/common.c
> index 0c9e9a7..6bcf87f 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -197,7 +197,7 @@ static unsigned long s3c24xx_read_idcode_v4(void)
> 
>  static void s3c24xx_default_idle(void)
>  {
> -	unsigned long tmp;
> +	unsigned long tmp = 0;
>  	int i;
> 
>  	/* idle the system by using the idle mode which will wait for an
> --
> 1.7.9.5

Yes, correct. Applied.

Thanks.

- Kukjin
