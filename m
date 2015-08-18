From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable DWC2 USB driver and USB
 ethernet gadget
Date: Tue, 18 Aug 2015 18:36:13 +0900
Message-ID: <55D2FC8D.2020007@samsung.com>
References: <1439889333-11990-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32862 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950AbbHRJgR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Aug 2015 05:36:17 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NT900HK1UOFVE60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Aug 2015 10:36:15 +0100 (BST)
In-reply-to: <1439889333-11990-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>

On 18.08.2015 18:15, Marek Szyprowski wrote:
> DWC2 (s3c-hsotg) hardware module is available on many Exynos based boards,
> so enable DWC2 driver as well as the most common USB Ethernet gadget.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

That was my plan as well :)

Can you send similar patch for multi_v7?

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 1ff2bfa..729e2fa 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -158,8 +158,10 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_EXYNOS=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_DWC3=y
> +CONFIG_USB_DWC2=y
>  CONFIG_USB_HSIC_USB3503=y
>  CONFIG_USB_GADGET=y
> +CONFIG_USB_ETH=y
>  CONFIG_MMC=y
>  CONFIG_MMC_BLOCK_MINORS=16
>  CONFIG_MMC_SDHCI=y
> 
