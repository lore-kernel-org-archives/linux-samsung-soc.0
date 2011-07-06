From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PC100: Fix for compilation error
Date: Wed, 06 Jul 2011 15:32:59 +0900
Message-ID: <00c201cc3ba6$901a62c0$b04f2840$%kim@samsung.com>
References: <1309801312-27377-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:28833 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093Ab1GFGdH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 02:33:07 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNW0099PFH4Z7I0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Jul 2011 15:33:05 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNW009I5FJ5CK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Jul 2011 15:33:06 +0900 (KST)
In-reply-to: <1309801312-27377-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Padmavathi Venna wrote:
> 
> From: padmavathi venna <padma.v@samsung.com>
> 
> S5PC100 Compilation fails without this patch
> 
> Signed-off-by: padmavathi venna <padma.v@samsung.com>
> ---
>  arch/arm/mach-s5pc100/dev-spi.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/dev-spi.c
b/arch/arm/mach-s5pc100/dev-spi.c
> index 2b58c9a..e5d6c4d 100644
> --- a/arch/arm/mach-s5pc100/dev-spi.c
> +++ b/arch/arm/mach-s5pc100/dev-spi.c
> @@ -15,6 +15,7 @@
>  #include <mach/dma.h>
>  #include <mach/map.h>
>  #include <mach/spi-clocks.h>
> +#include <mach/irqs.h>
> 
>  #include <plat/s3c64xx-spi.h>
>  #include <plat/gpio-cfg.h>
> --
> 1.7.0.4

Ok, will apply in -fix tree.

But, I'm not sure you really need to use your name ' padmavathi venna'
here...you used "Padmavathi Venna" in other patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
