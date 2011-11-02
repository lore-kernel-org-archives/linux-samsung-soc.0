From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix compile error due to kfree
Date: Wed, 02 Nov 2011 20:57:20 +0900
Message-ID: <004e01cc9956$93ad7f40$bb087dc0$%kim@samsung.com>
References: <1319838312-8205-1-git-send-email-jhbird.choi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23181 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752630Ab1KBL5W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Nov 2011 07:57:22 -0400
In-reply-to: <1319838312-8205-1-git-send-email-jhbird.choi@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jhbird.choi@gmail.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

jhbird.choi@gmail.com wrote:
> 
> From: Jonghwan Choi <jhbird.choi@gmail.com>
> 
> Fix  implicit declaration of function 'kfree'
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@gmail.com>
> ---
>  arch/arm/plat-samsung/dev-backlight.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/dev-backlight.c
b/arch/arm/plat-samsung/dev-
> backlight.c
> index 3cedd4c..2adbeae 100644
> --- a/arch/arm/plat-samsung/dev-backlight.c
> +++ b/arch/arm/plat-samsung/dev-backlight.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/pwm_backlight.h>
> +#include <linux/slab.h>
> 
>  #include <plat/devs.h>
>  #include <plat/gpio-cfg.h>
> --
> 1.7.0.4

Yes, applied.

But would be better if you could add description in detail......

Fix following build error.
    arch/arm/plat-samsung/dev-backlight.c: In function 'samsung_bl_set':
    arch/arm/plat-samsung/dev-backlight.c:145: error: implicit declaration
of function 'kfree'

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
