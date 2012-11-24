From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 03/24] MAINTAINERS: remove arch/arm/plat-s5p/
Date: Sat, 24 Nov 2012 11:10:08 +0900
Message-ID: <122701cdc9e8$d397d0b0$7ac77210$%kim@samsung.com>
References: <1353716808-16375-1-git-send-email-cesarb@cesarb.net>
 <1353716808-16375-4-git-send-email-cesarb@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55916 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756813Ab2KXCKJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 21:10:09 -0500
In-reply-to: <1353716808-16375-4-git-send-email-cesarb@cesarb.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Cesar Eduardo Barros' <cesarb@cesarb.net>, linux-kernel@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Cesar Eduardo Barros wrote:
> 
> These files were merged into plat-samsung.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 041872a..9bdd5f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1074,7 +1074,6 @@ W:	http://www.fluff.org/ben/linux/
>  S:	Maintained
>  F:	arch/arm/plat-samsung/
>  F:	arch/arm/plat-s3c24xx/
> -F:	arch/arm/plat-s5p/
>  F:	arch/arm/mach-s3c24*/
>  F:	arch/arm/mach-s3c64xx/
>  F:	drivers/*/*s3c2410*
> @@ -1105,7 +1104,6 @@ M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	arch/arm/plat-s5p/dev-fimc*
>  F:	arch/arm/plat-samsung/include/plat/*fimc*
>  F:	drivers/media/platform/s5p-fimc/
> 
> @@ -1116,7 +1114,7 @@ M:	Jeongtae Park <jtp.park@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	arch/arm/plat-s5p/dev-mfc.c
> +F:	arch/arm/plat-samsung/s5p-dev-mfc.c
>  F:	drivers/media/platform/s5p-mfc/
> 
>  ARM/SAMSUNG S5P SERIES TV SUBSYSTEM SUPPORT
> --
> 1.7.11.7
