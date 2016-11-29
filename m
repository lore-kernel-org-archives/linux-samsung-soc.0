From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: Add support for s6e3ha2 panel device
 for TM2
Date: Tue, 29 Nov 2016 08:12:27 +0100
Message-ID: <7914f81f-0d6e-7c5d-d2f1-8dedb99d8e1e@samsung.com>
References: <CGME20161129061631epcas2p2936042c69a654dc4b4a509d57063e4fc@epcas2p2.samsung.com>
 <1480400182-4485-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:50244 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753347AbcK2HMd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 02:12:33 -0500
In-reply-to: <1480400182-4485-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Hyungwon,


On 2016-11-29 07:16, Hoegeun Kwon wrote:
> From: Hyungwon Hwang <human.hwang@samsung.com>
>
> This patch adds the Panel Device Tree node for s6e3ha2 display
> controller to Exynos5433 SoC dts.
>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 35 +++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)

Please send an updated driver with dt binding description first, then 
this patch.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index db879f4..d27f27d 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -252,11 +252,46 @@
>   			reg = <1>;
>   
>   			dsi_out: endpoint {
> +				remote-endpoint = <&dsi_in>;
>   				samsung,burst-clock-frequency = <512000000>;
>   				samsung,esc-clock-frequency = <16000000>;
>   			};
>   		};
>   	};
> +
> +	panel@0 {
> +		compatible = "samsung,s6e3ha2";
> +		reg = <0>;
> +		vdd3-supply = <&ldo27_reg>;
> +		vci-supply = <&ldo28_reg>;
> +		reset-gpios = <&gpg0 0 0>;

Typically reset gpio is used with GPIO_ACTIVE_LOW flag, so handling this 
pin should be changed in the panel driver.

> +		panel-en-gpios = <&gpf1 5 0>;

This should be renamed to "enable-gpios", as pointed in 
https://patchwork.kernel.org/patch/5714111/

> +		te-gpios = <&gpf1 3 1>;
> +		power-on-delay= <5>;
> +		init-delay = <120>;
> +		panel-width-mm = <71>;
> +		panel-height-mm = <125>;
> +
> +		display-timings {
> +			timing-0 {
> +				clock-frequency = <14874444>;
> +				hactive = <1440>;
> +				vactive = <2560>;
> +				hfront-porch = <1>;
> +				hback-porch = <1>;
> +				hsync-len = <1>;
> +				vfront-porch = <1>;
> +				vback-porch = <15>;
> +				vsync-len = <1>;
> +			};
> +		};
> +
> +		port {
> +			dsi_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
>   };
>   
>   &hsi2c_0 {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
