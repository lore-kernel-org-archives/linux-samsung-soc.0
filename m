From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: remove duplicated header include
Date: Wed, 07 Dec 2011 16:26:28 +0900
Message-ID: <03e801ccb4b1$88dd0920$9a971b60$%kim@samsung.com>
References: <8253234.59601322014756201.JavaMail.weblogic@epv6ml03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14844 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976Ab1LGH0b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 02:26:31 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVT00ILGOO6PVR0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 16:26:30 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVT003RZOO4UU61@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 16:26:30 +0900 (KST)
In-reply-to: <8253234.59601322014756201.JavaMail.weblogic@epv6ml03>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: banajit.g@samsung.com

Jingoo Han wrote:
> 
> This patch removes duplicated slab header for pwm backlight.
> arch/arm/plat-samsung/dev-backlight.c: slab.h is included
> more than once.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/plat-samsung/dev-backlight.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/dev-backlight.c b/arch/arm/plat-
> samsung/dev-backlight.c
> index e657305..a976c02 100644
> --- a/arch/arm/plat-samsung/dev-backlight.c
> +++ b/arch/arm/plat-samsung/dev-backlight.c
> @@ -15,7 +15,6 @@
>  #include <linux/slab.h>
>  #include <linux/io.h>
>  #include <linux/pwm_backlight.h>
> -#include <linux/slab.h>
> 
>  #include <plat/devs.h>
>  #include <plat/gpio-cfg.h>
> --
> 1.7.1

Oops, ok. Will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
