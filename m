From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v5 3/9] dt: exynos5250: Enable support for generic USB
 DRD phy
Date: Fri, 25 Apr 2014 12:01:01 +0530
Message-ID: <535A0125.9020207@linaro.org>
References: <1398263451-18023-1-git-send-email-gautam.vivek@samsung.com> <1398263451-18023-4-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:63191 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333AbaDYGbM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 02:31:12 -0400
Received: by mail-pb0-f42.google.com with SMTP id un15so2831829pbc.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 23:31:11 -0700 (PDT)
In-Reply-To: <1398263451-18023-4-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, gregkh@linuxfoundation.org, t.figa@samsung.com, jg1.han@samsung.com, linux-kernel@vger.kernel.org, balbi@ti.com, robh+dt@kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org

On 04/23/2014 08:00 PM, Vivek Gautam wrote:
> Add device tree node for new usbdrd-phy driver, which
> is based on generic phy framework.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 3742331..d4254c0 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -551,6 +551,16 @@
>  		};
>  	};
>  
> +	usbdrd_phy: phy@12100000 {
> +		compatible = "samsung,exynos5250-usbdrd-phy";
> +		reg = <0x12100000 0x100>;
> +		clocks = <&clock CLK_USB3>, <&clock CLK_FIN_PLL>;
> +		clock-names = "phy", "ref";
> +		samsung,pmu-syscon = <&pmu_system_controller>;

Replace samsung,pmu-syscon by samsung,syscon-phandle ?

> +		samsung,pmu-offset = <0x704>;
> +		#phy-cells = <1>;
> +	};
> +
>  	usb@12110000 {
>  		compatible = "samsung,exynos4210-ehci";
>  		reg = <0x12110000 0x100>;
> 


-- 
Tushar Behera
