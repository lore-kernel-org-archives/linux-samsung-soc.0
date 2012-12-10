From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] samsung: Add missing include guard to gpio-core.h
Date: Mon, 10 Dec 2012 10:53:09 +0900
Message-ID: <032201cdd679$1afe4230$50fac690$%kim@samsung.com>
References: <1354749432-6028-1-git-send-email-spang@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14884 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818Ab2LJBxR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 20:53:17 -0500
In-reply-to: <1354749432-6028-1-git-send-email-spang@chromium.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Michael Spang' <spang@chromium.org>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Michael Spang wrote:
> 
> Signed-off-by: Michael Spang <spang@chromium.org>
> ---
>  arch/arm/plat-samsung/include/plat/gpio-core.h |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h
> b/arch/arm/plat-samsung/include/plat/gpio-core.h
> index 1fe6917..8622c9a 100644
> --- a/arch/arm/plat-samsung/include/plat/gpio-core.h
> +++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
> @@ -11,6 +11,9 @@
>   * published by the Free Software Foundation.
>  */
> 
> +#ifndef __PLAT_SAMSUNG_GPIO_CORE_H
> +#define __PLAT_SAMSUNG_GPIO_CORE_H
> +
>  #define GPIOCON_OFF	(0x00)
>  #define GPIODAT_OFF	(0x04)
> 
> @@ -122,3 +125,5 @@ extern struct samsung_gpio_pm samsung_gpio_pm_4bit;
>  /* locking wrappers to deal with multiple access to the same gpio bank */
>  #define samsung_gpio_lock(_oc, _fl) spin_lock_irqsave(&(_oc)->lock, _fl)
>  #define samsung_gpio_unlock(_oc, _fl)
spin_unlock_irqrestore(&(_oc)->lock,
> _fl)
> +
> +#endif /* __PLAT_SAMSUNG_GPIO_CORE_H */
> --
> 1.7.7.3

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
