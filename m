From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: s3c64xx: Do not select both CPU_V6 and CPU_V6K at
 the same time
Date: Mon, 16 Dec 2013 04:59:17 +0900
Message-ID: <52AE0A15.5040503@samsung.com>
References: <1386965752-15954-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:52317 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751631Ab3LOT72 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Dec 2013 14:59:28 -0500
Received: by mail-pb0-f52.google.com with SMTP id uo5so4599621pbc.39
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Dec 2013 11:59:27 -0800 (PST)
In-Reply-To: <1386965752-15954-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 12/14/13 05:15, Tomasz Figa wrote:
> To use V6K extensions, these symbols must not be selected at the same
> time, so this patch keeps only CPU_V6K selected for S3C64XX.
>
> Signed-off-by: Tomasz Figa<tomasz.figa@gmail.com>
> ---
>   arch/arm/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index b64a8ef..4df191b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -731,7 +731,6 @@ config ARCH_S3C64XX
>   	select CLKDEV_LOOKUP
>   	select CLKSRC_SAMSUNG_PWM
>   	select COMMON_CLK
> -	select CPU_V6
>   	select CPU_V6K
>   	select GENERIC_CLOCKEVENTS
>   	select GPIO_SAMSUNG

Squashed with previous patch for CPU_V6K.

Thanks,
Kukjin
