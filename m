From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 03/14] MAINTAINERS: remove arch/arm/plat-s3c24xx/
Date: Mon, 04 Mar 2013 21:57:38 +0900
Message-ID: <007f01ce18d7$d94ab430$8be01c90$%kim@samsung.com>
References: <1362275632-20242-1-git-send-email-cesarb@cesarb.net>
 <1362275632-20242-4-git-send-email-cesarb@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32454 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756930Ab3CDM5k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 07:57:40 -0500
In-reply-to: <1362275632-20242-4-git-send-email-cesarb@cesarb.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Cesar Eduardo Barros' <cesarb@cesarb.net>, 'Andrew Morton' <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, 'Joe Perches' <joe@perches.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Cesar Eduardo Barros wrote:
> 
> This directory was removed by commit 09ec1d7 (ARM: S3C24XX: Remove
> plat-s3c24xx directory in arch/arm/).
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin

> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3c074d5..5af82f9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1119,7 +1119,6 @@ L:	linux-samsung-soc@vger.kernel.org (moderated
> for non-subscribers)
>  W:	http://www.fluff.org/ben/linux/
>  S:	Maintained
>  F:	arch/arm/plat-samsung/
> -F:	arch/arm/plat-s3c24xx/
>  F:	arch/arm/mach-s3c24*/
>  F:	arch/arm/mach-s3c64xx/
>  F:	drivers/*/*s3c2410*
> --
> 1.7.11.7
