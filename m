From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable DWC2 USB driver and USB
 ethernet gadget
Date: Tue, 18 Aug 2015 12:04:03 +0200
Message-ID: <55D30313.7080107@osg.samsung.com>
References: <1439891799-15302-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:58266 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060AbbHRKEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Aug 2015 06:04:08 -0400
In-Reply-To: <1439891799-15302-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello Marek,

On 08/18/2015 11:56 AM, Marek Szyprowski wrote:
> DWC2 (s3c-hsotg) hardware module is available on many Exynos based boards,
> so enable DWC2 driver as well as the most common USB Ethernet gadget.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index b2facab..d15f719 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -506,6 +506,7 @@ CONFIG_USB_R8A66597_HCD=m
>  CONFIG_USB_RENESAS_USBHS=m
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_DWC3=y
> +CONFIG_USB_DWC2=y
>  CONFIG_USB_CHIPIDEA=y
>  CONFIG_USB_CHIPIDEA_HOST=y
>  CONFIG_AB8500_USB=y
> @@ -517,6 +518,7 @@ CONFIG_USB_MXS_PHY=y
>  CONFIG_USB_RCAR_PHY=m
>  CONFIG_USB_GADGET=y
>  CONFIG_USB_RENESAS_USBHS_UDC=m
> +CONFIG_USB_ETH=y
>  CONFIG_MMC=y
>  CONFIG_MMC_BLOCK_MINORS=16
>  CONFIG_MMC_ARMMMCI=y
> 

Both are tristate Kconfig symbols and the current multi_v7 policy is
to build as much as possible as a module.

Other than that the patch looks good to me. So if you change that:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
