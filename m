From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/4] ARM: dts: exynos4: add exynos_usbphy node
Date: Thu, 24 Apr 2014 18:09:45 +0200
Message-ID: <53593749.5020009@samsung.com>
References: <1397479700-15864-1-git-send-email-chanho61.park@samsung.com>
 <1397479700-15864-3-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56344 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758600AbaDXQJx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 12:09:53 -0400
In-reply-to: <1397479700-15864-3-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: k.debski@samsung.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hi Chanho,

On 14.04.2014 14:48, Chanho Park wrote:
> This patch enables a exynos_usbphy node for exynos4 SoCs.
> A exynos4x12 usb phy node is almost same with 4210's one
> except compatible string and pmu syscon.
>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4.dtsi    | 10 ++++++++++
>   arch/arm/boot/dts/exynos4x12.dtsi |  5 +++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index e565b86..0e32d7f 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -278,6 +278,16 @@
>   		status = "disabled";
>   	};
>
> +	exynos_usbphy: exynos-usbphy@125B0000 {
> +		compatible = "samsung,exynos4210-usb2-phy";
> +		reg = <0x125B0000 0x100>;
> +		samsung,pmureg-phandle = <&pmu_reg>;
> +		clocks = <&clock 305>, <&clock 2>;

Please use clock macros from include/dt-bindings instead of numbers 
directly.

Best regards,
Tomasz
