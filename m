From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/7] arm: dts: exynos: add vbus regulator to USB2 phy
 nodes
Date: Sun, 23 Aug 2015 12:59:37 +0900
Message-ID: <55D94529.1030004@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com> <1440160723-6636-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:33131 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109AbbHWD7n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Aug 2015 23:59:43 -0400
In-Reply-To: <1440160723-6636-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Kukjin Kim <kgene@kernel.org>

W dniu 21.08.2015 o 21:38, Marek Szyprowski pisze:
> Exynos USB2 PHY driver now supports VBUS regulator, so add it to all
> boards which have it available. This also fixes commit
> 7eec1266751bd3a25e35ce88686634c768fedc24 ("ARM: dts: Add Maxim 77693
> PMIC to exynos4412-trats2"), which added new regulators to Trats2 board,
> but without linking them to the consumers.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

Thanks for taking care of it! Nice analysis.

1. If there would be a resend please change the "arm" to "ARM" in
subject. If not, maybe Kukjin can fix it when applying.

2. How about backporting 1st and 2nd patch to stable kernels? At least
for Trats2? Mentioned commit 7eec126675 introduces a bug (a feature
stops working) which would be nice to fix for stable releases as well.
We could also backport simpler patch, adding only "regulator-always-on".

3. What about safeout regulator #2? On Trats2 it goes to USB_VBUS of
modem. Shouldn't it be enabled?

I'll test the patchset later at work on my boards.

As for the code:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


> ---
>  arch/arm/boot/dts/exynos3250-monk.dts           | 1 +
>  arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
>  arch/arm/boot/dts/exynos4210-trats.dts          | 2 +-
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
>  arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
>  5 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
> index 540a0adf2be6..35b39d2255d3 100644
> --- a/arch/arm/boot/dts/exynos3250-monk.dts
> +++ b/arch/arm/boot/dts/exynos3250-monk.dts
> @@ -161,6 +161,7 @@
>  };
>  
>  &exynos_usbphy {
> +	vbus-supply = <&safeout_reg>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 41a5fafb9aa9..23623cd3ebd9 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -153,6 +153,7 @@
>  
>  &exynos_usbphy {
>  	status = "okay";
> +	vbus-supply = <&safeout_reg>;
>  };
>  
>  &hsotg {
> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
> index ba34886f8b65..01d38f2145b9 100644
> --- a/arch/arm/boot/dts/exynos4210-trats.dts
> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
> @@ -251,6 +251,7 @@
>  
>  &exynos_usbphy {
>  	status = "okay";
> +	vbus-supply = <&safe1_sreg>;
>  };
>  
>  &fimd {
> @@ -448,7 +449,6 @@
>  
>  			safe1_sreg: ESAFEOUT1 {
>  			     regulator-name = "SAFEOUT1";
> -			     regulator-always-on;
>  			};
>  
>  			safe2_sreg: ESAFEOUT2 {
> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> index eb379526e234..2c04297825fe 100644
> --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> @@ -248,6 +248,7 @@
>  
>  &exynos_usbphy {
>  	status = "okay";
> +	vbus-supply = <&safeout1_reg>;
>  };
>  
>  &fimd {
> @@ -486,7 +487,6 @@
>  
>  			safeout1_reg: ESAFEOUT1 {
>  				regulator-name = "SAFEOUT1";
> -				regulator-always-on;
>  			};
>  
>  			safeout2_reg: ESAFEOUT2 {
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 2a1ebb76ebe0..50a5e8a85283 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -391,6 +391,7 @@
>  };
>  
>  &exynos_usbphy {
> +	vbus-supply = <&esafeout1_reg>;
>  	status = "okay";
>  };
>  
> 
