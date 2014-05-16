From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5250
Date: Fri, 16 May 2014 21:28:09 +0900
Message-ID: <048c01cf7102$4c2266f0$e46734d0$@samsung.com>
References: <1399542642-10001-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59049 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754454AbaEPM2M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 08:28:12 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5O00A7S2MY0H10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 May 2014 21:28:10 +0900 (KST)
In-reply-to: <1399542642-10001-1-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ajaynumb@gmail.com, tomasz.figa@gmail.com, joshi@samsung.com, prashanth.g@samsung.com

Ajay Kumar wrote:
> 
> Adds the PWM nodes to 5250 pinctrl dtsi file.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi |   28
> ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> index 9a49e68..886cfca 100644
> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
> @@ -351,6 +351,34 @@
>  			samsung,pin-drv = <0>;
>  		};
> 
> +		pwm0_out: pwm0-out {
> +			samsung,pins = "gpb2-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		pwm1_out: pwm1-out {
> +			samsung,pins = "gpb2-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		pwm2_out: pwm2-out {
> +			samsung,pins = "gpb2-2";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <0>;
> +		};
> +
> +		pwm3_out: pwm3-out {
> +			samsung,pins = "gpb2-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <0>;
> +		};
> +
>  		i2c7_bus: i2c7-bus {
>  			samsung,pins = "gpb2-2", "gpb2-3";
>  			samsung,pin-function = <3>;
> --
> 1.7.9.5

Looks good to me, applied this and 2nd one.

Thanks,
Kukjin
