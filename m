From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Build failure: OMAP4430 failed due to exynos4 pinctrl
Date: Tue, 13 Nov 2012 14:11:35 +0900
Message-ID: <01a601cdc15d$5a4c46c0$0ee4d440$%kim@samsung.com>
References: <007b01cdc0bf$50c9ee70$f25dcb50$%kim@samsung.com>
 <201211121440.13980.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15826 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133Ab2KMFLh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Nov 2012 00:11:37 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDE009B4UF6SW30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Nov 2012 14:11:35 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDE00AUWUFBH230@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Nov 2012 14:11:35 +0900 (KST)
In-reply-to: <201211121440.13980.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, arm@kernel.org, 'Linus Walleij' <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org

Arnd Bergmann wrote:
> 

[...]

> This won't work. A driver can't "select" and "depend on"
> another symbol at the same time.
> 
Ooooops. You're right. I missed :-(

> This is what I came up with earlier.
> 
> 	Arnd
> 8<----------------
> From a15cc6277a3a43c8b5c1dd90ca71732b2ffe2b18 Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Wed, 10 Oct 2012 13:31:45 +0000
> Subject: [PATCH] pinctrl: samsung: don't allow enabling pinctrl-samsung
>  standalone
> 
> The main samsung pinctrl module references the specific exynos4210
> pinctrl driver, which selects the main driver in Kconfig.
> 
> Making the main driver a silent "bool" option avoid this potential
> build error if CONFIG_PINCTRL_SAMSUNG=y && CONFIG_PINCTRL_EXYNOS4=n:
> 
> drivers/built-in.o:(.rodata+0x4e4): undefined reference to
> `exynos4210_pin_ctrl'
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Linus, can you pick this up in your pinctrl/fixes ree?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 7bf914d..9f54bd4 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -178,7 +178,7 @@ config PINCTRL_COH901
>  	  ports of 8 GPIO pins each.
> 
>  config PINCTRL_SAMSUNG
> -	bool "Samsung pinctrl driver"
> +	bool
>  	select PINMUX
>  	select PINCONF
> 
