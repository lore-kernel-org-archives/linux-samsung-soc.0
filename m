From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] usb: Remove references to non-existent PLAT_S5P symbol
Date: Tue, 07 Oct 2014 09:46:04 +0900
Message-ID: <00d301cfe1c8$1320a8d0$3961fa70$%han@samsung.com>
References: <1412610430-8647-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59314 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751252AbaJGAqH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Oct 2014 20:46:07 -0400
In-reply-to: <1412610430-8647-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, pebolle@tiscali.nl, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, October 07, 2014 12:47 AM, Sylwester Nawrocki wrote:
> 
> The PLAT_S5P Kconfig symbol was removed in commit d78c16ccde96
> ("ARM: SAMSUNG: Remove remaining legacy code"). There are still
> some references left, fix that by replacing them with ARCH_S5PV210.
> 
> Reported-by: Paul Bolle <pebolle@tiscali.nl>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Acked-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/usb/host/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 82800a7..6f1d48e 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -220,7 +220,7 @@ config USB_EHCI_SH
> 
>  config USB_EHCI_EXYNOS
>         tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
> -       depends on PLAT_S5P || ARCH_EXYNOS
> +       depends on ARCH_S5PV210 || ARCH_EXYNOS
>         help
>  	Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
> 
> @@ -527,7 +527,7 @@ config USB_OHCI_SH
> 
>  config USB_OHCI_EXYNOS
>  	tristate "OHCI support for Samsung S5P/EXYNOS SoC Series"
> -	depends on PLAT_S5P || ARCH_EXYNOS
> +	depends on ARCH_S5PV210 || ARCH_EXYNOS
>  	help
>  	 Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
> 
> --
> 1.7.9.5
