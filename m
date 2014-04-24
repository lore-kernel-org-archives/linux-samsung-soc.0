From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/4] ARM: dts: exynos4: add hsotg device node
Date: Thu, 24 Apr 2014 18:16:37 +0200
Message-ID: <535938E5.5020204@samsung.com>
References: <1397479700-15864-1-git-send-email-chanho61.park@samsung.com>
 <1397479700-15864-4-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:65298 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753425AbaDXQQr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 12:16:47 -0400
In-reply-to: <1397479700-15864-4-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: k.debski@samsung.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Chanho,

On 14.04.2014 14:48, Chanho Park wrote:
> This patch adds a hsotg node for exynos4 USB2.0 device controller.
>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Kamil Debski <k.debski@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 0e32d7f..e541ecb 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -288,6 +288,17 @@
>   		#phy-cells = <1>;
>   	};
>
> +	hsotg@12480000 {
> +		compatible = "samsung,s3c6400-hsotg";
> +		reg = <0x12480000 0x20000>;
> +		interrupts = <0 71 0>;
> +		clocks = <&clock 305>;

Please use clock macros.

> +		clock-names = "otg";
> +		phys = <&exynos_usbphy 0>;
> +		phy-names = "device";

This is not the correct phy name for this binding. According to what the 
driver uses and the example in ...bindings/usb/dwc2.txt "usb2-phy" 
should be used.

Best regards,
Tomasz
