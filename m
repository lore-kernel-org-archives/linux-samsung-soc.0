From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos 3250: add hsotg and usb2phy device
 nodes
Date: Tue, 08 Jul 2014 17:28:34 +0200
Message-ID: <53BC0E22.2090905@samsung.com>
References: <1404725986-12377-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30261 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581AbaGHP3J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 11:29:09 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8E006CVGCHRP20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Jul 2014 16:29:05 +0100 (BST)
In-reply-to: <1404725986-12377-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 07.07.2014 11:39, Marek Szyprowski wrote:
> This patch adds device tree nodes required to enable support for USB
> device controller.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v2:
> - removed phandle to syscon, because mode switch register is not needed for 3250.
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index eb457620975b..64a0ef44325a 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -309,6 +309,27 @@
>  			status = "disabled";
>  		};
>  
> +		hsotg: hsotg@12480000 {
> +			compatible = "samsung,s3c6400-hsotg";
> +			reg = <0x12480000 0x20000>;
> +			interrupts = <0 141 0>;
> +			clocks = <&cmu CLK_USBOTG>;
> +			clock-names = "otg";
> +			phys = <&exynos_usbphy 0>;
> +			phy-names = "usb2-phy";
> +			status = "disabled";
> +		};
> +
> +		exynos_usbphy: exynos-usbphy@125B0000 {
> +			compatible = "samsung,exynos3250-usb2-phy";
> +			reg = <0x125B0000 0x100>;
> +			samsung,pmureg-phandle = <&pmu_system_controller>;
> +			clocks = <&cmu CLK_USBOTG>, <&xusbxti>;
> +			clock-names = "phy", "ref";

Are you sure these are right clocks for Exynos3250? I thought the ref
clock was supposed to be SCLK_UPLL on this SoC.

Best regards,
Tomasz
