From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: exynos4210-universal_c210: enable USB functionality
Date: Wed, 21 May 2014 00:48:11 +0200
Message-ID: <537BDBAB.8010101@gmail.com>
References: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com> <1400590021-15422-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:51133 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbaETWsT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 18:48:19 -0400
Received: by mail-ee0-f54.google.com with SMTP id b57so951171eek.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 May 2014 15:48:17 -0700 (PDT)
In-Reply-To: <1400590021-15422-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Hi Marek,

On 20.05.2014 14:46, Marek Szyprowski wrote:
> This patch adds device tree nodes necessary to enable USB support on
> universalc210 board, this includes UDC controller (USB gadget) as well
> as EHCI and OHCI host ports. LDO3 and LDO8 regulators are switched to
> always on mode until EHCI and OHCI drivers will support them correctly.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> index 9296dee10e26..0a32b396306c 100644
> --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> @@ -68,6 +68,12 @@
>  		enable-active-high;
>  	};
>  
> +	hsotg@12480000 {
> +		vusb_d-supply = <&ldo3_reg>;
> +		vusb_a-supply = <&ldo8_reg>;
> +		status = "okay";
> +	};
> +
>  	sdhci_emmc: sdhci@12510000 {
>  		bus-width = <8>;
>  		non-removable;
> @@ -77,6 +83,18 @@
>  		status = "okay";
>  	};
>  
> +	ehci@12580000 {
> +		status = "okay";

Shouldn't you also enable applicable ports here, so that required PHYs
are configured?

> +	};
> +
> +	ohci@12590000 {
> +		status = "okay";

Ditto.

Best regards,
Tomasz
