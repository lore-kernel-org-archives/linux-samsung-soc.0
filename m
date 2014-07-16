From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Enable PMIC interrupts on ODROID
Date: Wed, 16 Jul 2014 14:34:24 +0200
Message-ID: <53C67150.3080208@samsung.com>
References: <1405500606-5752-1-git-send-email-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58464 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755112AbaGPMfN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 08:35:13 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8T0036C1M49CB0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Jul 2014 13:34:52 +0100 (BST)
In-reply-to: <1405500606-5752-1-git-send-email-drake@endlessm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, liquid.acid@gmx.net, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org

On 16.07.2014 10:50, Daniel Drake wrote:
> The ODROID kernel shows that the PMIC interrupt line is hooked up
> to pin GPX3-2.
> 
> This is needed for the max77686-irq driver to create the PMIC IRQ
> domain, which is needed by max77686-rtc.
> 
> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index 6d6d23c..cb6f55f 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -148,6 +148,10 @@
>  
>  		max77686: pmic@09 {
>  			compatible = "maxim,max77686";
> +			interrupt-parent = <&gpx3>;
> +			interrupts = <2 0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&max77686_irq>;
>  			reg = <0x09>;
>  			#clock-cells = <1>;
>  
> @@ -368,4 +372,11 @@
>  		samsung,pins = "gpx1-3";
>  		samsung,pin-pud = <0>;
>  	};
> +
> +	max77686_irq: max77686-irq {
> +		samsung,pins = "gpx3-2";
> +		samsung,pin-function = <0>;
> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <0>;
> +	};
>  };
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
