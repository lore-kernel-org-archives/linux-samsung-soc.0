From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Update EHCI config entry
Date: Thu, 16 Jan 2014 17:50:24 +0900
Message-ID: <000101cf1297$fef674c0$fce35e40$%han@samsung.com>
References: <1389861264-7305-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40936 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199AbaAPIu2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jan 2014 03:50:28 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZH00KE8KK0JM10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Jan 2014 17:50:24 +0900 (KST)
In-reply-to: <1389861264-7305-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Olof Johansson' <olof@lixom.net>, 'Jingoo Han' <jg1.han@samsung.com>, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>, 'Julius Werner' <jwerner@chromium.org>

On Thursday, January 16, 2014 5:34 PM, Tushar Behera wrote:
> 
> Commit 29824c167bea ("USB: host: Rename ehci-s5p to ehci-exynos")
> renamed the config entry of EHCI host driver. Similar change needs
> to be done in exynos_defconfig as well.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

(+cc Vivek Gautam, Yulgon Kim, Julius Werner)

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Yes, right.
I overlooked 'exynos_defconfig', when I changed the name of
Exynos EHCI driver. Thank you for sending the patch. :-)

Best regards,
Jingoo Han

> ---
>  arch/arm/configs/exynos_defconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index dbe1f1c..4ce7b70 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -94,7 +94,7 @@ CONFIG_FONT_7x14=y
>  CONFIG_LOGO=y
>  CONFIG_USB=y
>  CONFIG_USB_EHCI_HCD=y
> -CONFIG_USB_EHCI_S5P=y
> +CONFIG_USB_EHCI_EXYNOS=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_DWC3=y
>  CONFIG_USB_PHY=y
> --
> 1.7.9.5
