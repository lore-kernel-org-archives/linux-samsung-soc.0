From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: dts: Add keypad row entries for exynos4x12
Date: Fri, 21 Dec 2012 10:31:25 -0800
Message-ID: <007c01cddfa9$6369d640$2a3d82c0$@samsung.com>
References: <1354788815-21579-1-git-send-email-sachin.kamat@linaro.org>
 <1354788815-21579-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24817 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949Ab2LUSb3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Dec 2012 13:31:29 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFE00IUY8SC40L0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 03:31:28 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFE003DL8SE5U70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 03:31:27 +0900 (KST)
In-reply-to: <1354788815-21579-2-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> This patch adds keypad row support for Exynos4x12.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   56
> +++++++++++++++++++++++++++++
>  1 files changed, 56 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> index 0b293fb..bdfdf51 100644
> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> @@ -778,6 +778,62 @@
>  			samsung,pin-drv = <3>;
>  		};
> 
> +		keypad_row0: keypad-row0 {
> +			samsung,pins = "gpx2-0";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		keypad_row1: keypad-row1 {
> +			samsung,pins = "gpx2-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		keypad_row2: keypad-row2 {
> +			samsung,pins = "gpx2-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		keypad_row3: keypad-row3 {
> +			samsung,pins = "gpx2-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		keypad_row4: keypad-row4 {
> +			samsung,pins = "gpx2-4";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		keypad_row5: keypad-row5 {
> +			samsung,pins = "gpx2-5";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		keypad_row6: keypad-row6 {
> +			samsung,pins = "gpx2-6";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		keypad_row7: keypad-row7 {
> +			samsung,pins = "gpx2-7";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +
>  		keypad_col0: keypad-col0 {
>  			samsung,pins = "gpx1-0";
>  			samsung,pin-function = <3>;
> --
> 1.7.4.1

No, the nodes for keypad should be defined at each own board dt file.
Because it depends on board not SoC even though some boards can be same each
other.

- Kukjin
