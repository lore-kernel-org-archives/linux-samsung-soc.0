From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v5 1/9] dt: exynos5420: Enable support for USB 3.0 PHY
 controller
Date: Fri, 25 Apr 2014 11:57:05 +0530
Message-ID: <535A0039.3040307@linaro.org>
References: <1398263451-18023-1-git-send-email-gautam.vivek@samsung.com> <1398263451-18023-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:34808 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751196AbaDYG1Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 02:27:16 -0400
Received: by mail-pb0-f49.google.com with SMTP id rr13so2826642pbb.36
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 23:27:15 -0700 (PDT)
In-Reply-To: <1398263451-18023-2-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, gregkh@linuxfoundation.org, t.figa@samsung.com, jg1.han@samsung.com, linux-kernel@vger.kernel.org, balbi@ti.com, robh+dt@kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org

On 04/23/2014 08:00 PM, Vivek Gautam wrote:
> Add device tree nodes for USB 3.0 PHY present alongwith
> USB 3.0 controller Exynos 5420 SoC. This phy driver is
> based on generic phy framework.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index c3a9a66..f69745f 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -732,4 +732,24 @@
>  		clock-names = "secss";
>  		samsung,power-domain = <&g2d_pd>;
>  	};
> +
> +	usbdrd_phy0: phy@12100000 {
> +		compatible = "samsung,exynos5420-usbdrd-phy";
> +		reg = <0x12100000 0x100>;
> +		clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
> +		clock-names = "phy", "ref";
> +		samsung,pmu-syscon = <&pmu_system_controller>;

Should the property name be samsung,syscon-phandle as used elsewhere?

samsung,syscon-phandle = <&pmu_system_controller>;

> +		samsung,pmu-offset = <0x704>;
> +		#phy-cells = <1>;
> +	};
> +
> +	usbdrd_phy1: phy@12500000 {
> +		compatible = "samsung,exynos5420-usbdrd-phy";
> +		reg = <0x12500000 0x100>;
> +		clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
> +		clock-names = "phy", "ref";
> +		samsung,pmu-syscon = <&pmu_system_controller>;

ditto

> +		samsung,pmu-offset = <0x708>;
> +		#phy-cells = <1>;
> +	};
>  };
> 


-- 
Tushar Behera
