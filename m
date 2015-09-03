From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 07/16] ARM: dts: exynos/dp: remove some properties that
 deprecated by analogix_dp driver
Date: Thu, 03 Sep 2015 09:01:19 +0900
Message-ID: <55E78DCF.1060308@samsung.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441087272-25353-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37760 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbbICABb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Sep 2015 20:01:31 -0400
In-reply-to: <1441087272-25353-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

On 01.09.2015 15:01, Yakir Yang wrote:
> After exynos_dp have been splited the common IP code into analogix_dp driver,
s/splited/split/

> the analogix_dp driver have deprecated some samsung platform properties which

s/samsung/Samsung/

> could be dynamic parsed from EDID/MODE/DPCD message, so this is an update for

s/dynamic/dynamically/

> exynos DTS file for dp-controller.
/exynos/Exynos/

> 
> Beside analogix_dp have provide the backward compatibility, so there are no
> bisectability break that make this change in a separate patch.

It took me some time to figure out the meaning of this sentence... Did
you want to say that backward compatibility is fully preserved?

You are removing samsung,dynamic-range and samsung,ycbcr-coeff. I would
assume that now:
1. on all these board these values would be parsed from EDID/MODE/DPCD
message?
2. everything would work as previously?
Am I understanding it correctly?

The patch itself looks good.

Best regards,
Krzysztof


> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v4:
> - Take Krzysztof suggest, separate all DTS changes to a separate patch.
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/exynos5250-arndale.dts   | 2 --
>  arch/arm/boot/dts/exynos5250-smdk5250.dts  | 2 --
>  arch/arm/boot/dts/exynos5250-snow.dts      | 4 +---
>  arch/arm/boot/dts/exynos5250-spring.dts    | 4 +---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 +---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts  | 2 --
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 +---
>  7 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index db3f65f..4636862 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -124,8 +124,6 @@
>  &dp {
>  	status = "okay";
>  	samsung,color-space = <0>;
> -	samsung,dynamic-range = <0>;
> -	samsung,ycbcr-coeff = <0>;
>  	samsung,color-depth = <1>;
>  	samsung,link-rate = <0x0a>;
>  	samsung,lane-count = <4>;
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index c625e71..cd424d6 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -80,8 +80,6 @@
>  
>  &dp {
>  	samsung,color-space = <0>;
> -	samsung,dynamic-range = <0>;
> -	samsung,ycbcr-coeff = <0>;
>  	samsung,color-depth = <1>;
>  	samsung,link-rate = <0x0a>;
>  	samsung,lane-count = <4>;
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 0720caa..242b621 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -244,12 +244,10 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hpd>;
>  	samsung,color-space = <0>;
> -	samsung,dynamic-range = <0>;
> -	samsung,ycbcr-coeff = <0>;
>  	samsung,color-depth = <1>;
>  	samsung,link-rate = <0x0a>;
>  	samsung,lane-count = <2>;
> -	samsung,hpd-gpio = <&gpx0 7 GPIO_ACTIVE_HIGH>;
> +	hpd-gpios = <&gpx0 7 GPIO_ACTIVE_HIGH>;
>  
>  	ports {
>  		port@0 {
> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
> index c1edd6d..91881d7 100644
> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> @@ -74,12 +74,10 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hpd_gpio>;
>  	samsung,color-space = <0>;
> -	samsung,dynamic-range = <0>;
> -	samsung,ycbcr-coeff = <0>;
>  	samsung,color-depth = <1>;
>  	samsung,link-rate = <0x0a>;
>  	samsung,lane-count = <1>;
> -	samsung,hpd-gpio = <&gpc3 0 GPIO_ACTIVE_HIGH>;
> +	hpd-gpios = <&gpc3 0 GPIO_ACTIVE_HIGH>;
>  };
>  
>  &ehci {
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index 8f4d76c..7433683 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -148,12 +148,10 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hpd_gpio>;
>  	samsung,color-space = <0>;
> -	samsung,dynamic-range = <0>;
> -	samsung,ycbcr-coeff = <0>;
>  	samsung,color-depth = <1>;
>  	samsung,link-rate = <0x06>;
>  	samsung,lane-count = <2>;
> -	samsung,hpd-gpio = <&gpx2 6 0>;
> +	hpd-gpio = <&gpx2 6 0>;
>  
>  	ports {
>  		port@0 {
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 98871f9..b3df3c1 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -92,8 +92,6 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hpd>;
>  	samsung,color-space = <0>;
> -	samsung,dynamic-range = <0>;
> -	samsung,ycbcr-coeff = <0>;
>  	samsung,color-depth = <1>;
>  	samsung,link-rate = <0x0a>;
>  	samsung,lane-count = <4>;
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index 7d5b386..b89bff5 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -142,12 +142,10 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hpd_gpio>;
>  	samsung,color-space = <0>;
> -	samsung,dynamic-range = <0>;
> -	samsung,ycbcr-coeff = <0>;
>  	samsung,color-depth = <1>;
>  	samsung,link-rate = <0x0a>;
>  	samsung,lane-count = <2>;
> -	samsung,hpd-gpio = <&gpx2 6 0>;
> +	hpd-gpios = <&gpx2 6 0>;
>  	panel = <&panel>;
>  };
>  
> 
