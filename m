From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: add ohci and ehci controller nodes for EXYNOS5440
Date: Thu, 06 Jun 2013 10:55:28 +0900
Message-ID: <09d801ce6258$eb64a9d0$c22dfd70$%kim@samsung.com>
References: <09d701ce6258$64ef1fc0$2ecd5f40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31365 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756442Ab3FFBzq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 21:55:46 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNY00DKB80EUN80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Jun 2013 10:55:28 +0900 (KST)
In-reply-to: <09d701ce6258$64ef1fc0$2ecd5f40$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.ab@samsung.com>

Kukjin Kim wrote:
> 
> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> EXYNOS5440 includes both OHCI and EHCI usb host controllers.
> Add device tree nodes for both of these controllers.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi
b/arch/arm/boot/dts/exynos5440.dtsi
> index 2607739..f3faabf 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -225,4 +225,19 @@
>  		clock-names = "sata";
>  	};
> 
> +	ohci@220000 {
> +		compatible = "samsung,exynos-ohci";

Oops, the EHCI and OHCI controllers on exynos5440 do not need any explicit
phy configuration.
So need to assign a different compatible value for these controllers...

If no problem, let me take this patch into samsung tree with fix.

+		compatible = "samsung,exynos5440-ohci";

> +		reg = <0x220000 0x1000>;
> +		interrupts = <0 29 0>;
> +		clocks = <&clock 24>;
> +		clock-names = "usbhost";
> +	};
> +
> +	ehci@221000 {
> +		compatible = "samsung,exynos-ehci";

Same as above.

+		compatible = "samsung,exynos5440-ehci";

> +		reg = <0x221000 0x1000>;
> +		interrupts = <0 29 0>;
> +		clocks = <&clock 24>;
> +		clock-names = "usbhost";
> +	};
>  };
> --
> 1.7.10.4
