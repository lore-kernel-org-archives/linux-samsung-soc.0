From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 04 Jan 2017 16:16:02 +0900
Message-ID: <da8cefa6-2afe-0eb6-30bc-49052719eaea@samsung.com>
References: <1483513115-3068-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170104065900epcas5p2752d2a9575b62a6155ffeb2b7d8f49a7@epcas5p2.samsung.com>
 <1483513115-3068-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38527 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934851AbdADI2g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 03:28:36 -0500
In-reply-to: <1483513115-3068-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, inki.dae@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, jh80.chung@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>

Hi Hoegeun,

On 2017년 01월 04일 15:58, Hoegeun Kwon wrote:
> From: Hyungwon Hwang <human.hwang@samsung.com>
> 
> This patch add the panel device tree node for S6E3HA2 display
> controller to TM2 dts.
> 
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 5b9451d..b3ba1ac 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -304,11 +304,28 @@
>  			reg = <1>;
>  
>  			dsi_out: endpoint {
> +				remote-endpoint = <&panel_in>;
>  				samsung,burst-clock-frequency = <512000000>;
>  				samsung,esc-clock-frequency = <16000000>;
>  			};
>  		};
>  	};
> +
> +	panel@0 {
> +		compatible = "samsung,s6e3ha2";
> +		reg = <0>;
> +		vdd3-supply = <&ldo27_reg>;
> +		vci-supply = <&ldo28_reg>;
> +		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> +		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &hsi2c_0 {
> 

I tested this patch on Exynos5433-TM2 board.
It is well working to display the image to LCD panel.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Regards,
Chanwoo Choi
