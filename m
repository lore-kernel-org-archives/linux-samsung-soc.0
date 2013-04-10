From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: dts: Remove keypad entries from
 exynos4x12-pinctrl.dtsi
Date: Wed, 10 Apr 2013 19:03:12 +0900
Message-ID: <30fc01ce35d2$9c59faf0$d50df0d0$%kim@samsung.com>
References: <1363151289-685-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46027 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836Ab3DJKDN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 06:03:13 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0ML100AP9ALC3A00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Apr 2013 19:03:12 +0900 (KST)
In-reply-to: <1363151289-685-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Keypad pins/lines are board specific and should be added to respective
> board dts files.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   56
-------------------------
> ----
>  1 files changed, 0 insertions(+), 56 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> index 099cec7..704290f 100644
> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> @@ -778,62 +778,6 @@
>  			samsung,pin-drv = <3>;
>  		};
> 
> -		keypad_col0: keypad-col0 {
> -			samsung,pins = "gpl2-0";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
> -		keypad_col1: keypad-col1 {
> -			samsung,pins = "gpl2-1";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
> -		keypad_col2: keypad-col2 {
> -			samsung,pins = "gpl2-2";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
> -		keypad_col3: keypad-col3 {
> -			samsung,pins = "gpl2-3";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
> -		keypad_col4: keypad-col4 {
> -			samsung,pins = "gpl2-4";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
> -		keypad_col5: keypad-col5 {
> -			samsung,pins = "gpl2-5";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
> -		keypad_col6: keypad-col6 {
> -			samsung,pins = "gpl2-6";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
> -		keypad_col7: keypad-col7 {
> -			samsung,pins = "gpl2-7";
> -			samsung,pin-function = <3>;
> -			samsung,pin-pud = <0>;
> -			samsung,pin-drv = <0>;
> -		};
> -
>  		cam_port_b: cam-port-b {
>  			samsung,pins = "gpm0-0", "gpm0-1", "gpm0-2",
"gpm0-3",
>  					"gpm0-4", "gpm0-5", "gpm0-6",
"gpm0-7",
> --
> 1.7.4.1

Applied, this whole series.

Thanks.

- Kukjin
