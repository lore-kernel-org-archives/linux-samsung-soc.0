From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri, 03 Jun 2011 07:53:34 +0200
Message-ID: <000001cc21b2$9366b9a0$ba342ce0$%szyprowski@samsung.com>
References: <1307077639-18604-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27190 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110Ab1FCFyA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 01:54:00 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LM7005SW9PYQH@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Jun 2011 06:53:59 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LM70003S9PX5A@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Jun 2011 06:53:57 +0100 (BST)
In-reply-to: <1307077639-18604-1-git-send-email-tushar.behera@linaro.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@linaro.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, patches@linaro.org, jy0922.shim@samsung.com

Hello,

On Friday, June 03, 2011 7:07 AM Tushar Behera wrote:

> EHCI requires that USB support be enabled in kernel config.
> Selecting USB_SUPPORT with S5P_DEV_USB_EHCI fixes the problem.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/plat-s5p/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index e98f5c5..c7e7419 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -87,6 +87,7 @@ config S5P_DEV_CSIS1
> 
>  config S5P_DEV_USB_EHCI
>  	bool
> +	select USB_SUPPORT

IMHO this is not the best way to solve this issue. The main problem is
the fact that usb-phy.c file depends on CONFIG_USB_SUPPORT not it's own
Kconfig entry. Please check arch/arm/mach-exynos4/Makefile. To match the
style of other helper functions, usb-phy.c should be renamed to 
setup-usb-phy.c and get it's own Kconfig entry like 
CONFIG_EXYNOS4_SETUP_USB_PHY. Also the machine that uses it should select
this new entry. This is really not related to CONFIG_USB_SUPPORT at all
(one might want to have a kernel without USB support for some reason).


>  	help
>  	  Compile in platform device definition for USB EHCI
> 
> --

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
