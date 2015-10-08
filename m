From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv3 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4
Date: Thu, 08 Oct 2015 09:41:45 +0200
Message-ID: <5077751.tKglqqEUaI@wuerfel>
References: <1444276117-3657-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:52213 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbbJHHmA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2015 03:42:00 -0400
In-Reply-To: <1444276117-3657-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 08 October 2015 03:48:36 Anand Moon wrote:
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 1ff2bfa..5d1937b 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -61,6 +61,7 @@ CONFIG_BLK_DEV_DM=y
>  CONFIG_DM_CRYPT=m
>  CONFIG_NETDEVICES=y
>  CONFIG_SMSC911X=y
> +CONFIG_USB_RTL8152=y
>  CONFIG_USB_USBNET=y
>  CONFIG_USB_NET_SMSC75XX=y
>  CONFIG_USB_NET_SMSC95XX=y

Can we make that a loadable module for multi_v7_defconfig?

	Arnd
