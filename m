From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: Fix a typo in exynos5420-pinctrl.dtsi
Date: Sun, 10 Nov 2013 19:20:46 +0100
Message-ID: <11439635.3nLj0DE42O@flatron>
References: <1383797386-29458-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62988 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773Ab3KJSUr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 13:20:47 -0500
Received: by mail-ee0-f46.google.com with SMTP id b57so2005488eek.33
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Nov 2013 10:20:46 -0800 (PST)
In-Reply-To: <1383797386-29458-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Thursday 07 of November 2013 09:39:46 Sachin Kamat wrote:
> Fixed samaung -> samsung in property name.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> index e695aba5f73c..e62c8eb57438 100644
> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> @@ -64,7 +64,7 @@
>  			samsung,pins = "gpx0-7";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
> -			samaung,pin-drv = <0>;
> +			samsung,pin-drv = <0>;
>  		};
>  	};
>  
> 

Good catch.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
