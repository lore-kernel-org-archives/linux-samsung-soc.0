From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 05/11] ARM: dts: add exynos4 clock controller nodes
Date: Thu, 15 Nov 2012 00:27:17 +0100
Message-ID: <4979279.mb3rWrdaG3@flatron>
References: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org> <1352930853-12268-6-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:64784 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1945916Ab2KNX1T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 18:27:19 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so640171eek.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Nov 2012 15:27:18 -0800 (PST)
In-Reply-To: <1352930853-12268-6-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

On Thursday 15 of November 2012 03:37:27 Thomas Abraham wrote:
> Add clock controller nodes for Exynos4210 and Exynos4x12 SoC's.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi |    6 ++++++
>  arch/arm/boot/dts/exynos4x12.dtsi |    6 ++++++
>  2 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi index d6fc306..f7daa09 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -50,6 +50,12 @@
>  		samsung,mct-nr-local-irqs = <4>;
>  	};
> 
> +	clock: clock-controller@0x10030000 {
> +		compatible = "samsung,exynos4210-clock";
> +		reg = <0x10030000 0x20000>;
> +		#clock-cells = <1>;
> +	};
> +
>  	pinctrl_0: pinctrl@11400000 {
>  		compatible = "samsung,pinctrl-exynos4210";
>  		reg = <0x11400000 0x1000>;
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
> b/arch/arm/boot/dts/exynos4x12.dtsi index 7cbbd19..bcfdaac 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -35,6 +35,12 @@
>  			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
>  	};
> 
> +	clock: clock-controller@0x10030000 {
> +		compatible = "samsung,exynos4412-clock";

nitpick: I forgot to mention about it in my comments for patch 3, but 
wouldn't it be better to call it "samsung,exynos4x12-clock"?

> +		reg = <0x10030000 0x20000>;
> +		#clock-cells = <1>;
> +	};
> +
>  	pinctrl_0: pinctrl@11400000 {
>  		compatible = "samsung,pinctrl-exynos4x12";
>  		reg = <0x11400000 0x1000>;

Otherwise looks fine.

Best regards,
Tomasz Figa
