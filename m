From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: dts: Fix gpio pin names of keypad columns in
 exynos4x12-pinctrl
Date: Fri, 21 Dec 2012 10:34:52 -0800
Message-ID: <007d01cddfa9$ded572d0$9c805870$@samsung.com>
References: <1354788815-21579-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25028 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340Ab2LUSe4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Dec 2012 13:34:56 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFE00B6U8Y7H230@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 03:34:55 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFE004AQ8Y51C70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 03:34:55 +0900 (KST)
In-reply-to: <1354788815-21579-1-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org, 'Tomasz Figa' <t.figa@samsung.com>

Sachin Kamat wrote:
> 
> Keypad columns are connected to gpx1 pins on 4x12.
> 
> Cc: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   16 ++++++++--------
>  1 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> index 8e6115a..0b293fb 100644
> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> @@ -779,56 +779,56 @@
>  		};
> 
>  		keypad_col0: keypad-col0 {
> -			samsung,pins = "gpl2-0";
> +			samsung,pins = "gpx1-0";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> 
>  		keypad_col1: keypad-col1 {
> -			samsung,pins = "gpl2-1";
> +			samsung,pins = "gpx1-1";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> 
>  		keypad_col2: keypad-col2 {
> -			samsung,pins = "gpl2-2";
> +			samsung,pins = "gpx1-2";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> 
>  		keypad_col3: keypad-col3 {
> -			samsung,pins = "gpl2-3";
> +			samsung,pins = "gpx1-3";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> 
>  		keypad_col4: keypad-col4 {
> -			samsung,pins = "gpl2-4";
> +			samsung,pins = "gpx1-4";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> 
>  		keypad_col5: keypad-col5 {
> -			samsung,pins = "gpl2-5";
> +			samsung,pins = "gpx1-5";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> 
>  		keypad_col6: keypad-col6 {
> -			samsung,pins = "gpl2-6";
> +			samsung,pins = "gpx1-6";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
>  		};
> 
>  		keypad_col7: keypad-col7 {
> -			samsung,pins = "gpl2-7";
> +			samsung,pins = "gpx1-7";
>  			samsung,pin-function = <3>;
>  			samsung,pin-pud = <0>;
>  			samsung,pin-drv = <0>;
> --
> 1.7.4.1

As I commented in your other patch, the value should be defined at the board
dt file not here. And I think, need to fix this file.

- Kukjin 
