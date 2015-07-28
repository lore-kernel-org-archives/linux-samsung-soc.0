From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC PATCH 3/3] ARM: dts: add MCT property use-cp15-phys-counter
 for exynos5422-odroidxu3
Date: Tue, 28 Jul 2015 14:53:14 +0900
Message-ID: <55B718CA.3050103@samsung.com>
References: <1438032528.17734.49.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17364 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751152AbbG1FxU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jul 2015 01:53:20 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NS600D2GOCT6KA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Jul 2015 06:53:17 +0100 (BST)
In-reply-to: <1438032528.17734.49.camel@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexey Klimov <klimov.linux@gmail.com>, linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org, dianders@chromium.org, chirantan@chromium.org
Cc: t.dakhran@gmail.com, kgene@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, yury.norov@gmail.com

On 28.07.2015 06:28, Alexey Klimov wrote:
> Speedup MCT operation on odroid-xu3 dev board by using
> coprocessor 64-bit counter instead of reading same counter
> located in mmio region.
> 
> Tested on Odroid-xu3.
> 
> Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 4 ++++

Please do this in Odroid XU3 common DTSI:
arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi

>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index 78e6a50..b7f6c8f 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -18,6 +18,10 @@
>  	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
>  };
>  
> +&mct {
> +	use-cp15-phys-counter;
> +};
> +

Put the node in alphabetical position.

Best regards,
Krzysztof

>  &i2c_0 {
>  	status = "okay";
>  
> 
