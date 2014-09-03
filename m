From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4x12: Fix pull setting in sd4_width8 pin
 group
Date: Wed, 03 Sep 2014 22:50:46 +0900
Message-ID: <02ed01cfc77e$0fede790$2fc9b6b0$@samsung.com>
References: <1409062405-15215-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48575 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756344AbaICNus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Sep 2014 09:50:48 -0400
In-reply-to: <1409062405-15215-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Tomasz Figa wrote:
> 
> The group has the samsung,pin-pud property set to 4, which is not a
> correct value. This patch fixes this by replacing it with 3, which is
> the correct value for pull-up.
> 
Yes, I checked the value. You're right.

Will apply into fixes.

Thanks,
Kukjin

> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> index 927fec6..c141931 100644
> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> @@ -691,7 +691,7 @@
>  		sd4_bus8: sd4-bus-width8 {
>  			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
>  			samsung,pin-function = <4>;
> -			samsung,pin-pud = <4>;
> +			samsung,pin-pud = <3>;
>  			samsung,pin-drv = <3>;
>  		};
> 
> --
> 2.0.4
