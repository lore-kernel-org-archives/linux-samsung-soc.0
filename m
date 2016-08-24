From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos: Enable HDMI for Arndale Octa board
Date: Wed, 24 Aug 2016 07:28:38 +0200
Message-ID: <7c58bbae-91ce-a6e7-14be-282b6fa40e42@samsung.com>
References: <1472005524-3489-1-git-send-email-woogyom.kim@gmail.com>
 <1472005524-3489-2-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21854 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750947AbcHXF2v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 01:28:51 -0400
In-reply-to: <1472005524-3489-2-git-send-email-woogyom.kim@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Milo Kim <woogyom.kim@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org

Hi Milo,

On 08/24/2016 04:25 AM, Milo Kim wrote:
> * Support HDMI display data channel
>   I2C #2 is assigned for the HDMI DDC. It enables the EDID access.
>
> * GPIO for HDMI hot plug detect
>   GPX3_7 is used. The HPD awareness is done when the GPIO is active high and
>   single ended.
>
> * Enable HDMI block in Exynos5420
>   HDMI PLL consumes 1.0V LDO6 (PVDD_ANAIP_1V0) and HDMI oscillator requires
>   1.8V LDO7 (PVDD_ANAIP_1V8).
>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index 39a3b81..df362a2 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -70,6 +70,23 @@
>  	status = "disabled";
>  };
>  
> +&i2c_2 {
> +	samsung,i2c-slave-addr = <0x50>;
> +	status = "okay";
> +
> +	hdmiddc@50 {
> +		compatible = "samsung,exynos4210-hdmiddc";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&hdmi {
> +	hpd-gpios = <&gpx3 7 GPIO_OPEN_SOURCE>;
> +	vdd_osc-supply = <&ldo7_reg>;
> +	vdd_pll-supply = <&ldo6_reg>;
> +	status = "okay";

Please use ddc property in hdmi node, instead of this legacy binding.
See exynos4210-universal_c210.dts or exynos4412-odroid-common.dtsi for
reference.

Regards
Andrzej

> +};
> +
>  &hsi2c_4 {
>  	status = "okay";
>  
