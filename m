From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Add dwc3 SUSPHY quirk
Date: Tue, 19 Sep 2017 19:40:38 +0200
Message-ID: <20170919174038.2sspjvadt6ggka65@kozik-lap>
References: <1505728934-6200-1-git-send-email-andrzej.p@samsung.com>
 <CGME20170918100230eucas1p29fae00c53f1106af1961a6e269740b2f@eucas1p2.samsung.com>
 <1505728934-6200-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:38753 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdISRkn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 13:40:43 -0400
Content-Disposition: inline
In-Reply-To: <1505728934-6200-2-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Mon, Sep 18, 2017 at 12:02:13PM +0200, Andrzej Pietrasiewicz wrote:
> Odroid XU4 board does not enumerate SuperSpeed devices.
> This patch makes exynos5 series chips use USB SUSPHY quirk,
> which solves the problem.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> ---
>  arch/arm/boot/dts/exynos54xx.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Makes sense to me... was it tested also on XU3 and XU?

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
> index 0389e8a..8ca4fef 100644
> --- a/arch/arm/boot/dts/exynos54xx.dtsi
> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
> @@ -134,6 +134,7 @@
>  				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>  				phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
>  				phy-names = "usb2-phy", "usb3-phy";
> +				snps,dis_u3_susphy_quirk;
>  			};
>  		};
>  
> @@ -154,6 +155,7 @@
>  				reg = <0x12400000 0x10000>;
>  				phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
>  				phy-names = "usb2-phy", "usb3-phy";
> +				snps,dis_u3_susphy_quirk;
>  			};
>  		};
>  
> -- 
> 1.9.1
> 
